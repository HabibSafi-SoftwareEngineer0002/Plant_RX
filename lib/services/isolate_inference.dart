import 'dart:io';
import 'dart:isolate';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as image_lib;
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../utils/image_utils.dart';

class IsolateInference {
  static const String _debugName = "TFLITE_INFERENCE";
  final ReceivePort _receivePort = ReceivePort();
  late Isolate _isolate;
  late SendPort _sendPort;

  SendPort get sendPort => _sendPort;

  Future<void> start() async {
    _isolate = await Isolate.spawn<SendPort>(entryPoint, _receivePort.sendPort, debugName: _debugName);
    _sendPort = await _receivePort.first;
  }

  Future<void> close() async {
    _isolate.kill();
    _receivePort.close();
  }

  static void entryPoint(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final InferenceModel isolateModel in port) {
      image_lib.Image? img;
      if (isolateModel.isCameraFrame()) {
        img = ImageUtils.convertCameraImage(isolateModel.cameraImage!);
      } else {
        img = isolateModel.image;
      }

      // Resize image to model input shape
      image_lib.Image imageInput = image_lib.copyResize(
        img!,
        width: isolateModel.inputShape[1],
        height: isolateModel.inputShape[2],
      );

      // Rotate image for Android camera frame
      if (Platform.isAndroid && isolateModel.isCameraFrame()) {
        imageInput = image_lib.copyRotate(imageInput, angle: 90);
      }

      // Normalize pixel values if needed (assuming model expects float32 values between 0 and 1)
      final imageMatrix = List.generate(
        imageInput.height,
        (y) => List.generate(imageInput.width, (x) {
          final pixel = imageInput.getPixel(x, y);
          return [
            pixel.r.toDouble() / 255.0,
            pixel.g.toDouble() / 255.0,
            pixel.b.toDouble() / 255.0,
          ];
        }),
      );

      // Tensor input shape: [1, height, width, 3]
      final input = [imageMatrix];

      // Tensor output shape: [1, num_classes]
      final output = [List<double>.filled(isolateModel.outputShape[1], 0.0)];

      // Run inference
      final interpreter = Interpreter.fromAddress(isolateModel.interpreterAddress);
      interpreter.run(input, output);

      // Retrieve output
      final result = output.first;

      // Normalize and map results
      double totalScore = result.reduce((a, b) => a + b);
      final classification = <String, double>{};
      if (totalScore > 0) {
        for (var i = 0; i < result.length; i++) {
          if (result[i] > 0) {
            classification[isolateModel.labels[i]] = result[i] / totalScore;
          }
        }
      }

      isolateModel.responsePort.send(classification);
    }
  }
}

class InferenceModel {
  CameraImage? cameraImage;
  image_lib.Image? image;
  int interpreterAddress;
  List<String> labels;
  List<int> inputShape;
  List<int> outputShape;
  late SendPort responsePort;

  InferenceModel(
    this.cameraImage,
    this.image,
    this.interpreterAddress,
    this.labels,
    this.inputShape,
    this.outputShape,
  );

  bool isCameraFrame() => cameraImage != null;
}
