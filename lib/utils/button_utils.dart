import 'package:flutter/material.dart';

class Button_utils extends StatelessWidget {
  const Button_utils({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed:(){

          }, child: Text("Check History")),
    );
  }
}
