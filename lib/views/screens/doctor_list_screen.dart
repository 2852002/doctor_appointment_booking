import 'package:flutter/material.dart';
import '../../controllers/doctor_list_controller.dart';
import '../../models/doctor.dart';
import '../widgets/custom_button.dart'; // Import the custom button

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  final DoctorListController doctorListController = DoctorListController();
  TextEditingController searchController = TextEditingController();
  List<Doctor> allDoctors = [];
  List<Doctor> filteredDoctors = [];
  bool isLoading = true;  

  @override
  void initState() {
    super.initState();
    doctorListController.fetchDoctors().then((doctors) {
      setState(() {
        allDoctors = doctors;
        filteredDoctors = doctors; 
        isLoading = false; 
      });
    });

    searchController.addListener(() {
      filterDoctors();
    });
  }

  void filterDoctors() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredDoctors = allDoctors
          .where((doctor) => doctor.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 224, 224),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 5),
                const Text(
                  "Doctor List",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search Doctor...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          isLoading
              ? const Expanded(
                  child: Center(
                    child:  CircularProgressIndicator(), 
                  ),
                )
              : Expanded(
                  child: filteredDoctors.isEmpty
                      ? const Center(child: Text("No doctors found"))
                      : ListView.builder(
                          itemCount: filteredDoctors.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(9),
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          filteredDoctors[index].name,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        CustomButtonlist(
                                          buttonText: "Book Appointment",
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/appointment',
                                                arguments: filteredDoctors[index]);
                                          },
                                          backgroundColor: Colors.red, 
                                          textColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          filteredDoctors[index].specialization,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue.shade300,
                                          ),
                                        ),
                                        CustomButtonlist(
                                          buttonText: filteredDoctors[index].availableTime,
                                          onPressed: () {
                                          },
                                          backgroundColor: Colors.yellow,
                                          textColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
        ],
      ),
    );
  }
}
