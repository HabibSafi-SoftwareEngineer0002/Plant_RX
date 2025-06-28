import 'package:flutter/material.dart';


class HistoryDetails extends StatefulWidget {
  const HistoryDetails({super.key});

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.transparent,  image: DecorationImage(image: AssetImage("assets/images/pepper.jpg"))),
      ),
    );
  }
}
