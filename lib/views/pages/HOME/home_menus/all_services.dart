import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/constants/routes.dart';

class Allservices extends StatefulWidget {
  const Allservices({super.key});

  @override
  State<Allservices> createState() => _AllservicesState();
}

class _AllservicesState extends State<Allservices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          'All Services',
          style: TextStyle(
            color: ColorConstants.primaryColour,
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorConstants.primaryColour,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomContainer(
              goToRoute: popularDocRoute,
              text: 'Doctor',
              imagePath: 'assets/Doctor.png',
            ),
            CustomContainer(
              goToRoute: '',
              text: 'Instant Video Consult',
              imagePath: 'assets/service2.png',
              textStyle: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomContainer(
              goToRoute: '',
              text: 'Medicines',
              imagePath: 'assets/service3.png',
            ),
            CustomContainer(
              goToRoute: '',
              text: 'Lab Tests',
              imagePath: 'assets/service4.png',
            ),
            CustomContainer(
              goToRoute: '',
              text: 'Dietitian',
              imagePath: 'assets/service5.png',
            ),
            CustomContainer(
              goToRoute: '',
              text: 'Nurse',
              imagePath: 'assets/service6.png',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String goToRoute;
  final String text;
  final String imagePath;
  final TextStyle? textStyle; // Add a new parameter for the custom TextStyle

  const CustomContainer({
    super.key,
    required this.goToRoute,
    required this.text,
    required this.imagePath,
    this.textStyle, // Make the new parameter nullable
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, goToRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: ColorConstants.primaryColour,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 79,
                  width: 77,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
