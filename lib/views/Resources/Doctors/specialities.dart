import 'package:flutter/material.dart';
import 'package:healthso/views/Resources/Doctors/specialist.dart';

class SpecialitiesPage extends StatefulWidget {
  const SpecialitiesPage({Key? key}) : super(key: key);

  @override
  _SpecialitiesPageState createState() => _SpecialitiesPageState();
}

class _SpecialitiesPageState extends State<SpecialitiesPage> {
  bool showSecondSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 46, 204),
        title: const Text('Find Doctors'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Card(
              elevation: 4,
              margin: EdgeInsets.only(top: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_rounded,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 8),
                        Text('Learn how to book an appointment'),
                        SizedBox(width: 60),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 231, 226, 226),
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
                          hintText: 'Search Symptoms Specialities',
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
            const SizedBox(height: 20),
            const Text(
              'Most searched specialities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 400,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: showSecondSet ? 16 : 8,
                itemBuilder: (BuildContext context, int index) {
                  final specialities = [
                    'General Physician',
                    'Skin and Hair',
                    'Women\'s Health',
                    'Dental Care',
                    'Child Specialist',
                    'Ear, Nose, Throat',
                    'Mental Wellness',
                    'Bones & Joints',
                  ];

                  final text = specialities[index % specialities.length];

                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SpecialistPage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: _SpecialityItem(
                        image: 'assets/${index % 8 + 1}.png',
                        text: text,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showSecondSet = !showSecondSet;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                child: Text(
                    showSecondSet ? 'Hide Second Set' : 'View All Symptoms'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecialityItem extends StatelessWidget {
  final String image;
  final String text;

  const _SpecialityItem({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    final firstLine = words[0];
    final secondLine = words.length > 1 ? words.sublist(1).join(' ') : '';

    return Column(
      children: [
        Container(
          width: 50,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          firstLine,
          style: const TextStyle(fontSize: 10),
        ),
        if (secondLine.isNotEmpty)
          Text(
            secondLine,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
