import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const CustButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 106, 0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}