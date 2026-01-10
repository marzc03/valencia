import 'package:flutter/material.dart';
import '../components/cust_text_field.dart';
import '../components/cust_button.dart';
import '../user.dart';
import '../components/cust_radio.dart';

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
  //final TextEditingController unitsController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
 // final TextEditingController sexController = TextEditingController();
 // final TextEditingController activityLevelController = TextEditingController();
 // final TextEditingController goalController = TextEditingController();


  //sign up method
  void signUp(){
    /*
    todo: implement login functionality
    */
    //navigate to home page after login
    Navigator.pushNamed(context, '/home');

    //create user object
    User newUser = User(
        age: int.parse(ageController.text),
        w: double.parse(weightController.text),
        h: double.parse(heightController.text),
        activityLevel: ActivityLevel.sedentary, // Placeholder
        sex: Sex.male, // Placeholder
        mode: Mode.maintenance,
        units: "metric" // Placeholder
    );
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 149, 229, 218),
       body: SingleChildScrollView(
         child: Column(
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
              
              //Starter data
              CustTextField(
                controller: ageController,
                hintText: 'Age',
                obscureText: false,
              ),

              
              CustRadio(options: ['Imperial', 'Metric'], title: 'Units', onChanged: (value) {}),
              
              CustTextField(
                controller: weightController,
                hintText: 'Weight',
                obscureText: false,
              ),

              CustTextField(
                controller: heightController,
                hintText: 'Height',
                obscureText: false,
              ),
              
              CustRadio(options: ['male', 'female'], title: 'Sex', onChanged: (value) {}),
              
              CustRadio(options: ['Sedentary', 'Lightly Active', 'Moderately Active', 'Very Active', 'Extra Active'], title: 'Activity level outside of exercise', onChanged: (value) {}),  

              CustRadio(options: ['Weight Loss', 'Maintenance', 'Weight Gain', 'Recomposition', 'Bulking', 'Cutting'], title: 'Fitness Goal', onChanged: (value) {}),

              //sign up button
              CustButton(buttonText: 'Sign up', onTap: () { signUp(); }),

              //return to sign in button
              Text('Already a member?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text('Login now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(''),//fix this and do it right
              Text(''),
         ],
        ),
      )
    );
  }
}