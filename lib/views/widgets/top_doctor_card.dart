import 'package:flutter/material.dart';

class TopDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String time;

  const TopDoctorCard({super.key, 
    required this.name,
    required this.specialty,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(specialty),
        trailing: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            time,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
