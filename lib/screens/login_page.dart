import 'package:flutter/material.dart';
import 'package:messenger_app/screens/home_chats.dart';
import 'package:messenger_app/screens/register_page.dart';
import 'package:messenger_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool show = true;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: widget._formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Now',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: widget.emailController,
                hintText: 'Email',
                label: 'Email',
                validateMessage: 'Email is required',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: widget.passwordController,
                hintText: 'Password',
                label: 'Password',
                validateMessage: 'Password is required',
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (widget._formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeChats()));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 120, left: 120),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account?",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
