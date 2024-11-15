import 'package:flutter/material.dart';
import 'doctor_list_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(), 
    const DoctorListScreen(),
    const Center(child: Text("List of Appointments")), 
    const Center(child: Text("Profile")), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 226, 224, 224),
    body: _pages[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.white, 
      unselectedItemColor: Colors.black, 
      showSelectedLabels: false,  
      showUnselectedLabels: false, 
      items: [
        BottomNavigationBarItem(
          icon: _currentIndex == 0
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 83, 40, 202),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home, color: Colors.white),
                      Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              : const Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 1
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 83, 40, 202),
                    borderRadius: BorderRadius.circular(8200),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.local_hospital, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        'Doc',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              : const Icon(Icons.local_hospital),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 2
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 83, 40, 202),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        'Book',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              : const Icon(Icons.calendar_today),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 3
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 83, 40, 202),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.account_circle, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'You',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              : const Icon(Icons.account_circle),
          label: '',
        ),
      ],
    ),
  );
}
}