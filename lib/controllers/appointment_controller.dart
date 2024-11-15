import 'package:flutter/material.dart';

class AppointmentController {
  void bookAppointment({
    required String doctorId,
    required String patientName,
    required String appointmentDate,
    required String appointmentTime,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    if (patientName.isNotEmpty && appointmentDate.isNotEmpty && appointmentTime.isNotEmpty) {
      onSuccess();
    } else {
      onFailure();
    }
  }
}
