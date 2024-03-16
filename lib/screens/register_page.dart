import 'package:flutter/material.dart';
import 'package:messenger_app/model/chats_model.dart';
import 'package:messenger_app/screens/home_chats.dart';
import 'package:messenger_app/screens/login_page.dart';
import 'package:messenger_app/screens/profile_screen.dart';
import 'package:messenger_app/screens/second_page.dart';
import 'package:messenger_app/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool show = true;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: widget._formKey,
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  "Register Now",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Let's create an accont for you!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: widget.nameController,
                hintText: 'Name',
                label: 'Name',
                validateMessage: 'Name is required',
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
              CustomTextField(
                controller: widget.confirmpasswordController,
                hintText: 'Confirm Password',
                label: 'Confirm Password',
                validateMessage: 'Confirm Password is required',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    setState(() {
                      if (widget._formKey.currentState!.validate() &&
                          widget.passwordController.text ==
                              widget.confirmpasswordController.text) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeChats(),
                          ),
                        );
                        //////////////////
                        String namePass = widget.nameController.text;
                        String emailPass = widget.emailController.text;
                        ProfileScreen.setPassedText(namePass, emailPass);
                        //////////////////
                      } else if (widget.passwordController.text !=
                          widget.confirmpasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "The passwords aren't match",
                          style: TextStyle(fontSize: 23),
                        )));
                      }
                    });
                  },
                  child: Text(
                    'Sign Up',
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
                    "already have an account?",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Login',
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
