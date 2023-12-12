import 'package:flutter/material.dart';

class SpecialistPage extends StatelessWidget {
  const SpecialistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 46, 204),
        title: const Text('Find Your Health Concern'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: const Color.fromARGB(255, 192, 192, 192),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'General physician',
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
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _customTextContainer('Now or Later'),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _customTextContainer('Video Consult'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                _largeContainer(
                  'assets/Doctor.png',
                  doctorName: 'Dr Sudha',
                  doctorLastName: 'Balasubramnian',
                  specialization: 'General Physician',
                  experience: '28 Years experience',
                  location: 'Nanganallur • Diha Clinic • ~3.6km',
                  nextAvailable: 'NEXT AVAILABLE AT',
                  appointmentTime: '05:30 PM today',
                ),
                const SizedBox(height: 10),
                Container(
                  height: 10, // Gray gap height
                  color: const Color.fromARGB(255, 159, 158, 158),
                ),
                const SizedBox(height: 10),
                _largeContainer(
                  'assets/Doctor.png',
                  doctorName: 'Dr Sudha',
                  doctorLastName: 'Balasubramnian',
                  specialization: 'General Physician',
                  experience: '28 Years experience',
                  location: 'Nanganallur • Diha Clinic • ~3.6km',
                  nextAvailable: 'NEXT AVAILABLE AT',
                  appointmentTime: '05:30 PM today',
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _customTextContainer(String text) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 192, 192, 192),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _largeContainer(
    String imagePath, {
    required String doctorName,
    required String doctorLastName,
    required String specialization,
    required String experience,
    required String location,
    required String nextAvailable,
    required String appointmentTime,
  }) {
    return Container(
      decoration: const BoxDecoration(
        // Add if needed
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 50),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (doctorLastName.isNotEmpty)
                      Text(
                        doctorLastName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    Text(
                      specialization,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 78, 71, 71),
                      ),
                    ),
                    Text(
                      experience,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 78, 71, 71),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 4), // Add spacing between the image and text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1,
                  color: const Color.fromARGB(255, 159, 158, 158), // Grey line
                ),
                Text(
                  location,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal, // No longer bold
                  ),
                ),
                const SizedBox(height: 4), // Add space
                const Row(
                  children: [
                    Text(' ~400 Consultation Fees'),
                  ],
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nextAvailable,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 80, 46, 204),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.home),
                        const SizedBox(width: 3),
                        Text(appointmentTime),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4), // Add spacing between the text and button
          ElevatedButton(
            onPressed: () {
              // Handle button click here
            },
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 80, 46, 204),
            ),
            child: const Text('Book Clinic Visit'),
          ),
        ],
      ),
    );
  }
}
