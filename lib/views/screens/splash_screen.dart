import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
    
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 100,       
          height: 100,      
        ),
      ),
    );
  }
}
