import 'package:flutter/material.dart';
import 'views/screens/splash_screen.dart';
import 'views/screens/signin_screen.dart';
import 'views/screens/dashboard_screen.dart';
import 'views/screens/doctor_list_screen.dart';
import 'views/screens/appointment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signin': (context) => SignInScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/doctorList': (context) => const DoctorListScreen(),
        '/appointment': (context) => const AppointmentScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
