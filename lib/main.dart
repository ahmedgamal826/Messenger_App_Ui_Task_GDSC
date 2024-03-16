import 'package:flutter/material.dart';
import 'package:messenger_app/screens/first_page.dart';
import 'package:messenger_app/screens/home_chats.dart';
import 'package:messenger_app/screens/image_picker.dart';
import 'package:messenger_app/screens/login_page.dart';
import 'package:messenger_app/screens/register_page.dart';

void main() {
  runApp(const MessengerApp());
}

class MessengerApp extends StatelessWidget {
  const MessengerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
