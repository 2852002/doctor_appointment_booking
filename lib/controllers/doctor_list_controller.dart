import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/doctor.dart';

class DoctorListController {
  Future<List<Doctor>> fetchDoctors() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    final List<dynamic> data = json.decode(response);
    return data.map((doctor) => Doctor.fromJson(doctor)).toList();
  }
}
