import 'package:flutter/material.dart';
import 'package:messenger_app/screens/second_page.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Middle Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPageUI()));
            },
            child: Text('Click')),
      ),
    );
  }
}
