import 'package:flutter/material.dart';
import '../components/cust_text_field.dart';
import '../components/cust_button.dart';

class SignUpPage extends StatefulWidget{
  final void Function()? onTap;
  
  const SignUpPage({super.key, this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{
  //Text Editing Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 229, 218),
      body: Column(
        children: [
          //orange stack

          //welcome text
          Text('Sign Up', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 106, 0)
          )),
          Text('Create an account',
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
          //confirm password text field
          CustTextField(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: true,
          ),
          //sign up button
          CustButton(buttonText: 'Sign up', onTap: () {}),
          //return to sign in button
          Text('Already a member?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Text('Return to Sign In',
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