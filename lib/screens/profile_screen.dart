import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(String textPass, {super.key});

  static late String namePassedText; // Static variable to hold the passed text
  static late String emailPassedText; // Static variable to hold the passed text

  // Static method to set the passed text
  static void setPassedText(String text, String textEmail) {
    namePassedText = text;
    emailPassedText = textEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 100,
              child: Text(
                namePassedText[0].toUpperCase(),
                style: TextStyle(fontSize: 100, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Row(
                children: [
                  Text(
                    'Name  ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    namePassedText,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    'Email   ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        emailPassedText,
                        // softWrap: true,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        // overflow: TextOverflow.ellipsis,
                        // maxLines: 2,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
