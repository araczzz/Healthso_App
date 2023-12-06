import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:ionicons/ionicons.dart';

Widget vision(
    {required BuildContext context,
    required userCount,
    required doctorCount,
    required hospCount,
    required patientStoryCount}) {
  return Column(
    children: [
      Container(
        width:
            MediaQuery.of(context).size.width, // Set the width to screen width
        color: const Color(0xFFD9D9D9).withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Our vision is to help mankind live healthier, longer lives by making quality healthcare accessible, affordable and convenient.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      custVisionData(
                          context: context,
                          dataTitle: "Our Users",
                          dataCount: userCount),
                      const SizedBox(height: 34),
                      custVisionData(
                          context: context,
                          dataTitle: "Hospitals",
                          dataCount: hospCount),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custVisionData(
                          context: context,
                          dataTitle: "Our Doctors",
                          dataCount: doctorCount),
                      const SizedBox(height: 34),
                      custVisionData(
                          context: context,
                          dataTitle: "Patient Stories",
                          dataCount: patientStoryCount),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        color: const Color(0xFF4F2ECC),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo_name.png',
                width: 138.3,
                height: 34.54,
              ),
              const SizedBox(height: 15),
              const Text(
                "Our vision is to help mankind live \nhealthier, longer lives by making quality healthcare accessible, affordable and convenient.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "Raleway",
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget custVisionData({
  required BuildContext context,
  required dataTitle,
  required dataCount,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            dataTitle,
            style: const TextStyle(
              fontSize: 16,
              color: ColorConstants.primaryColour,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Ionicons.sparkles_outline,
            color: ColorConstants.primaryColour,
            size: 16,
          ),
        ],
      ),
      Text(
        dataCount,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ],
  );
}
