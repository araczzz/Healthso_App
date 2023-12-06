import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthso/views/Resources/Doctors/specialities.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 30,
            left: 50,
            right: 50,
            child: Image.asset(
              'assets/insulin.png',
              width: 343,
              height: 220,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 150), // Spacer for the image
                // Search TextField with blue border
                Container(
                  width: 180, // Adjust the width as needed
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Icon(Icons.search),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 40, // Adjust the height as needed
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                            onChanged: (query) {
                              // Implement search functionality here if needed.
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: "clicked");
                        // Navigate to the Specialist page when "Doctor" is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SpecialitiesPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 104,
                        height: 88,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 212, 203),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_rounded,
                              size: 36,
                              color: Color.fromARGB(255, 243, 10, 10),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Doctor',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 104,
                      height: 88,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 194, 216, 231),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_pharmacy_rounded,
                              size: 36,
                              color: Color.fromARGB(255, 70, 152, 225)),
                          SizedBox(height: 8),
                          Text('Pharmacy',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0))),
                        ],
                      ),
                    ),
                    Container(
                      width: 104,
                      height: 88,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 195, 236, 195),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_hospital,
                              size: 36,
                              color: Color.fromARGB(255, 60, 150, 63)),
                          SizedBox(height: 8),
                          Text('Hospital',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your symptoms',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 37, 37, 37)),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 166,
                        height: 48,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Text('😓', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 8),
                            Text('Headache',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 166,
                        height: 48,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Text('🤢', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 8),
                            Text('Nausea',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 166,
                        height: 48,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Text('🌡️', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 8),
                            Text('Temperature',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
