import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/views/pages/HOME/home_menus/all_services.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Services",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: ColorConstants.primaryColour),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Allservices(),
                  ),
                );
              },
              child: Text(
                "see all",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: ColorConstants.primaryColour),
              ),
            ),
          ],
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  CustomContainer(
                    goToRoute: '/popular-doctors/',
                    text: 'Doctor',
                    imagePath: 'assets/Doctor.png',
                  ),
                  CustomContainer(
                    text: 'Instant Video Consult',
                    imagePath: 'assets/service2.png',
                    textStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    goToRoute: '',
                  ),
                  CustomContainer(
                    text: 'Medicines',
                    imagePath: 'assets/service3.png',
                    goToRoute: '',
                  ),
                  CustomContainer(
                    text: 'Lab Tests',
                    imagePath: 'assets/service4.png',
                    goToRoute: '',
                  ),
                  CustomContainer(
                    text: 'Dietitian',
                    imagePath: 'assets/service5.png',
                    goToRoute: '',
                  ),
                  CustomContainer(
                    text: 'Nurse',
                    imagePath: 'assets/service6.png',
                    goToRoute: '',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
          width: 99,
          height: 130.6717529296875,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: ColorConstants.primaryColour,
          ),
          child: Column(
            children: [
              const SizedBox(height: 3),
              Container(
                width: 92.19847106933594,
                height: 92.19847106933594,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Image.asset(imagePath),
              ),
              const SizedBox(height: 3),
              Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
