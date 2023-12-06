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
            const SizedBox(height: 30),
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
                    'assets/Doctor.png', 'Heading 1', 'Subheading 1'),
                Container(
                  color: const Color.fromARGB(255, 197, 194, 194), // Grey color
                  height: 10, // Adjust the height as needed
                ),
                _largeContainer(
                    'assets/Doctor.png', 'Heading 2', 'Subheading 2'),
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

  Widget _largeContainer(String imagePath, String heading, String subheading) {
    return Container(
      decoration: const BoxDecoration(
          //Add if needed
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 80,
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(subheading),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color.fromARGB(255, 159, 158, 158),
          ),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Text 1'),
                  Text('Text 2'),
                  Text('Text 3'),
                ],
              ),
              const SizedBox(width: 50),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Text 4'),
                  Text('Text 5'),
                  Text('Text 6'),
                ],
              ),
              const SizedBox(width: 90),
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
        ],
      ),
    );
  }
}
