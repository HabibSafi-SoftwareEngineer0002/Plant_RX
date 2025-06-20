import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:plant_rx/services/classification_services.dart';
import 'package:plant_rx/src/home_page/components/title_section.dart';

import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../services/disease_provider.dart';
import 'components/greeting.dart';
import 'components/history.dart';
import 'components/instructions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final imagePicker = ImagePicker();
  String? imagePath;
  img.Image? image;
  late ClassificationServices classificationServices;

  @override
  void initState() {
    super.initState();

    classificationServices = ClassificationServices();
    classificationServices.initHelper();
  }

  Future<List<MapEntry>> processImage() async {
    if (imagePath != null) {
      final imageData = File(imagePath!).readAsBytesSync();

      image = img.decodeImage(imageData);
      final classification = await classificationServices.inferenceImage(image!);
      final sortedClassification = classification.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

      return sortedClassification;
    }

    return [];
  }

  @override
  void dispose() {
    Hive.close();
    classificationServices.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final diseaseService = Provider.of<DiseaseService>(context);

    // Data
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeedDial(
        icon: Icons.camera_alt,
        spacing: 10,
        children: [
          SpeedDialChild(
            child: const FaIcon(FontAwesomeIcons.file, color: kWhite),
            label: "Choose image",
            backgroundColor: Colors.lightGreen,
            onTap: () async {
              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

              imagePath = pickedFile?.path;

              final result = await processImage();

              log('Result: $result');
            },
          ),
          SpeedDialChild(
            child: const FaIcon(FontAwesomeIcons.camera, color: kWhite),
            label: "Take photo",
            backgroundColor: Colors.lightGreen,
            onTap: () async {
              final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

              imagePath = pickedFile?.path;

              final result = await processImage();

              log('Result: $result');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
        child: CustomScrollView(
          slivers: [
            GreetingSection(size.height * 0.2),
            TitleSection('Guidance', size.height * 0.066),
            InstructionsSection(size),
            TitleSection(' History', size.height * 0.066),
            HistorySection(size, context, diseaseService),
          ],
        ),
      ),
    );
  }
}
