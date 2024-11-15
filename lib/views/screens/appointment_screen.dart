import 'package:flutter/material.dart';
import '../../controllers/appointment_controller.dart';
import '../../models/doctor.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final AppointmentController appointmentController = AppointmentController();

  String selectedPatient = '';
  String selectedDate = '';
  String selectedTime = '';
  String mobileNumber = '';

  final TextEditingController mobileController = TextEditingController();

  final List<Map<String, String>> weekDays = List.generate(7, (index) {
    final now = DateTime.now();
    final day = now.add(Duration(days: index));
    return {
      "day": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][day.weekday % 7],
      "date": "${day.day}",
    };
  });

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = ModalRoute.of(context)!.settings.arguments as Doctor;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 224, 224),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                  },
                ),
                const SizedBox(width: 5),
                const Text(
                  "Appointment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.local_hospital,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 83, 40, 202),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      doctor.specialization,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Schedules",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.red),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: weekDays.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: dayButton(entry["date"]!, entry["day"]!),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Visit Hours",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.red),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  timeButton('7:00 AM'),
                  timeButton('8:00 AM'),
                  timeButton('9:00 AM'),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                "Patient",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.red),
              ),
              const SizedBox(height: 5,),
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Enter the Mobile Number',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  mobileNumber = value;
                },
              ),
              const SizedBox(height: 20),
            
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                
                ),
                child: Column(
                  children: [
                    buildPatientRow("MRD23", "John Smith"),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    buildPatientRow("NSD45", "Jane Doe"),
                   
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedDate.isNotEmpty &&
                        selectedTime.isNotEmpty &&
                        mobileNumber.isNotEmpty &&
                        selectedPatient.isNotEmpty) {
                      appointmentController.bookAppointment(
                        doctorId: doctor.id,
                        patientName: selectedPatient,
                        appointmentDate: selectedDate,
                        appointmentTime: selectedTime,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Appointment Booked Successfully")));
                        },
                        onFailure: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Failed to book appointment")));
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill in all fields")));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color.fromARGB(255, 83, 40, 202),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Book Appointment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Patient row builder
Widget buildPatientRow(String code, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric( horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              code,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Container(
              width: 1,
              height: 50, 
              color: Colors.grey.shade300,
            ),
            const SizedBox(width: 8), 
            Text(
              name,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedPatient = name;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedPatient == name ? Colors.red : Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            "Select",
            style: TextStyle(
              color: selectedPatient == name ? Colors.white : Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

  // Day Button
  Widget dayButton(String day, String date) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedDate = '$day, $date';
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedDate == '$day, $date' ? Colors.blue : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(day, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 5),
          Text(date, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  // Time Button
  Widget timeButton(String time) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTime = time;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedTime == time ? Colors.blue : Colors.white,
      ),
      child: Text(time),
    );
  }
}
