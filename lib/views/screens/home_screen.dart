import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../widgets/top_doctor_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            child: Container(
              color: const Color.fromARGB(255, 83, 40, 202),
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                          },
                        ),
                        const Icon(
                          Icons.local_hospital,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                  // Welcome and Booking Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Let's Book The \nAppointment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
       const Padding(
  padding: EdgeInsets.all(16.0),
  child: Align(
    alignment: Alignment.centerLeft, 
    child: Text(
      "Categories",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.red,
      ),
    ),
  ),
),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryCard(
                title: "General",
                icon: Icons.health_and_safety,
                backgroundColor: Colors.yellow,
              ),
              CategoryCard(
                title: "ENT",
                icon: Icons.hearing,
                backgroundColor: Colors.blue,
              ),
              CategoryCard(
                title: "Dental",
                icon: Icons.medical_services,
                backgroundColor: Colors.green,
              ),
              CategoryCard(
                title: "Cardio",
                icon: Icons.favorite,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Doctors",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: const Row(
                    children: [
                      Text(
                        "All",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TopDoctorCard(
                  name: "Dr. John Doe",
                  specialty: "Cardiology",
                  time: "7am-7pm",
                ),
                TopDoctorCard(
                  name: "Dr. Jane Smith",
                  specialty: "Dentistry",
                  time: "8am-5pm",
                ),
                TopDoctorCard(
                  name: "Dr. Emily Clarke",
                  specialty: "Pediatrics",
                  time: "9am-4pm",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
