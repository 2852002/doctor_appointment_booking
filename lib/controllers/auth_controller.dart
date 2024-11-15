import 'package:flutter/material.dart';

class AuthController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String dummyEmail = 'user123';
  final String dummyPassword = '123456';

  bool validateCredentials() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    return email.isNotEmpty && password.isNotEmpty;
  }

  void signIn(BuildContext context, VoidCallback onSuccess) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (validateCredentials()) {
      if (email == dummyEmail && password == dummyPassword) {
        onSuccess();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Incorrect username or password")),
        );
      }
    } else {
      // Show error message for empty fields
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid credentials")),
      );
    }
  }
}
