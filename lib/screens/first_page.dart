// first_page_ui.dart
import 'package:flutter/material.dart';
import 'package:messenger_app/screens/middle_screen.dart';
import 'package:messenger_app/screens/second_page.dart';

class FirstPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            String textToPass = 'Hello from First Page';
            SecondPageUI.setPassedText(textToPass);

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MiddleScreen()));
          },
          child: Text('Pass Text to Second Page'),
        ),
      ),
    );
  }
}
