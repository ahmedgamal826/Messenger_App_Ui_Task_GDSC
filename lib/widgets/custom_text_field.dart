import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.validateMessage,
      required this.hintText});

  final TextEditingController controller;
  final String label;
  final String validateMessage;
  final String hintText;

  bool show = true;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return widget.validateMessage;
          }
        },
        controller: widget.controller,
        obscureText:
            widget.label == 'Password' || widget.label == 'Confirm Password'
                ? widget.show
                : false,
        decoration: InputDecoration(
            suffixIconColor: widget.show ? Colors.grey : Colors.blue,
            suffixIcon:
                widget.label == 'Password' || widget.label == 'Confirm Password'
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.show = !widget.show;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      )
                    : Text(''),
            label: Text('${widget.label}'),
            hintText: '${widget.hintText}',
            border: OutlineInputBorder()),
      ),
    );
  }
}
