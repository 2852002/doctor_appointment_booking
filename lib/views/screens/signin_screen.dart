import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  final AuthController authController = AuthController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.35,
            width: double.infinity,
            child: Image.asset(
              'assets/signin_image.png', 
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign in to Book a doctor's\nappointment",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: authController.emailController,
                      hintText: 'Enter the Username',
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: authController.passwordController,
                      hintText: 'Enter the Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),

                    CustomButton(
                      text: 'Get Started',
                      onPressed: () {
                        authController.signIn(context, () {
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Don’t Have an account ",
                          style: TextStyle(color: Colors.black45),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup'); 
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
