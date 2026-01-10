import 'package:flutter/material.dart';
import '../components/cust_text_field.dart';
import '../components/cust_button.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onTap;
  
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  //Text Editing Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login(){
    /*
    todo: implement login functionality

    */

    //navigate to home page after login
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 229, 218),
      body: Column(
        children: [
          //orange stack

          //welcome text
          Text('Valencia', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 106, 0)
          )),
          Text('Welcome Back!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          //email text field
          CustTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          //password text field
          CustTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          //sign in button
          CustButton(buttonText: 'Sign in', onTap: () { login(); }),
          //register button
          Text('Not a member?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Text('Register now',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}