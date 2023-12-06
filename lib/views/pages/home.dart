// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthso/constants/routes.dart';
import 'package:healthso/views/Resources/Patients/patient.dart';
import 'package:healthso/views/pages/HOME/home_components/services_cat.dart';
import 'package:healthso/views/pages/HOME/home_components/symptoms_cat.dart';
import 'package:healthso/views/pages/HOME/home_components/upcoming_card.dart';
import 'package:healthso/views/pages/HOME/home_components/vision.dart';
import 'package:healthso/views/pages/HOME/nav_bar/wallet.dart';
import 'package:ionicons/ionicons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';

// import 'dart:developer' as devtools show log;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? locationName;

  Future<String?> getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude,
              localeIdentifier: "en");
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        return placemark
            .name; // You can use other properties like locality, country, etc. as needed.
      }
    } catch (e) {
      print("Error getting location name: $e");
    }
    return null;
  }

  Future<Position?> _getCurrentLocation() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      // Handle case when location service is not enabled
      return null;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double latitude = position.latitude;
      double longitude = position.longitude;

      locationName = await getLocationName(latitude, longitude);

      if (locationName != null) {
        // Do something with the location name, e.g., display it
        print("Location Name: $locationName");
      }

      return position;
    } catch (e) {
      // Handle any errors that might occur while getting the location
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    //guest account
    if (Patient.currentPatient != null) {
      final currentPatient = Patient.currentPatient!;
      Fluttertoast.showToast(msg: 'Welcome, ${currentPatient.name}');
    } else {
      Fluttertoast.showToast(msg: 'No Guest information available.');
    }

    // final auth = FirebaseAuth.instance.currentUser;
    // final username = auth?.displayName;
    // devtools.log('user: $username');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 180,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: Colors.black,
                  ),
                  FutureBuilder<Position?>(
                    future: _getCurrentLocation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('location...',
                            style: TextStyle(
                                color: Color.fromARGB(255, 32, 31, 31)));
                      } else if (snapshot.hasError || !snapshot.hasData) {
                        return const Text('📍unavailable',
                            style: TextStyle(color: Colors.black));
                      } else {

                        return Row(
                          children: [
                            Text(locationName!,
                                style: const TextStyle(color: Colors.black)),
                            IconButton(
                              onPressed: () {},
                              icon: Transform.scale(
                                scale:
                                    0.5, // Adjust the scale factor as needed to decrease the size
                                child: Transform.rotate(
                                  angle: -1.5708,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Transform.scale(
                scale: 2.5,
                child: Image.asset(
                  'assets/icons/ABHA.png',
                  width: 74,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Transform.scale(
            scale: 1.5,
            child: const Icon(Ionicons.person_circle, color: Colors.black),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to a new page
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      const Wallet(), 
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/wallet_icon.png', 
                  color: Colors.black,
                 
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 160, 209, 229),
                    borderRadius: BorderRadius.circular(
                        2.0), 
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "200",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  const UpcomingCard(),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      children: [
                        const Services(),
                        const SizedBox(height: 10),
                        const Categories(),
                        const SizedBox(height: 15),
                        // Button
                        Container(
                          width: double.infinity,
                          height: 33,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: TextButton(
                            onPressed: () {
                              navigator?.pushNamed(symptomsRoute);
                            },
                            child: const Text(
                              "View All Symptoms",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            vision(
              context: context,
              userCount: "30 Crores",
              doctorCount: "1 Lakh",
              hospCount: "20,000",
              patientStoryCount: "40 Lakh",
            )
          ],
        ),
      ),
    );
  }
}

class CustomIcon {
  final String name;
  final String icon;

  CustomIcon({
    required this.name,
    required this.icon,
  });
}
