// second_page_ui.dart
import 'package:flutter/material.dart';

class SecondPageUI extends StatelessWidget {
  static String? _passedText; // Static variable to hold the passed text

  // Static method to set the passed text
  static void setPassedText(String text) {
    _passedText = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(_passedText!), // Display the passed text
      ),
    );
  }
}
