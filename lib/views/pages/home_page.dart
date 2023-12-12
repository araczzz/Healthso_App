import 'package:flutter/material.dart';
import 'package:healthso/views/pages/home.dart';
import 'package:healthso/views/pages/profile.dart';
import 'package:healthso/views/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    const Search(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Color.fromARGB(255, 80, 46, 204)),
            activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 80, 46, 204)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 80, 46, 204)),
            activeIcon: Icon(Icons.search, color: Color.fromARGB(255, 80, 46, 204)),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Color.fromARGB(255, 80, 46, 204)),
            activeIcon: Icon(Icons.person, color: Color.fromARGB(255, 80, 46, 204)),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
