import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CustTextField({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child:  TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(210, 222, 93, 0))),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(210, 222, 93, 0), width: 1.5)),
        hintText: hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(210, 222, 93, 0)),
      ),
    )
    );
  }
}