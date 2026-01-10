import 'package:flutter/material.dart';
import '../pages/login.dart';
import '../pages/sign_up.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  
  //initially show login page
  bool isLoginPage = true;

  //switch between login and register
  void togglePages() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (isLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } 
    else {
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}