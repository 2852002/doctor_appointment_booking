import 'package:flutter/material.dart';

class DashboardController {
  void navigateToDoctorList(BuildContext context) {
    Navigator.pushNamed(context, '/doctorList');
  }
}
