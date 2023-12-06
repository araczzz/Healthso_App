// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/constants/routes.dart';

import 'PROFILE/profile_components/custom_container.dart';
import 'PROFILE/profile_components/user_prof_widget.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorConstants.primaryColour,
            size: 16,
          ),
          onPressed: () {},
        ),
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              color: Color(0xFF070532), // Title color
              fontSize: 16, 
              fontWeight: FontWeight.w600, // Title font weight
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications,
              size: 25,
              color: ColorConstants.primaryColour,
            ),
          ),
          Icon(
            Icons.message,
            size: 25,
            color: ColorConstants.primaryColour,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            userProfile(
              userName: 'Anusha Ganguly',
              dateOfBirth: '10/11/2001',
              phoneNumber: '123456789',
              imagePath: 'assets/Anusha.png',
              onEditPressed: () {
                Navigator.pushNamed(context, editProfRoute);
              },
            ),
            buildCustomContainer(
              icon: Icons.medical_information,
              text: 'Medical History',
              info: 'Check your All Medical History',
              btnText: 'Read',
              onPressed: () async {
                Navigator.pushNamed(
                  context, // Use the context from the build method
                  medicalHistoryRoute,
                );
              },
            ),
            buildCustomContainer(
              icon: Icons.lock_person,
              text: 'Your History',
              info: 'Receive and save up. Points to receive gifts',
              btnText: 'Read',
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  yourHistoryRoute,
                );
              },
            ),
            buildCustomContainer(
              icon: Icons.medication,
              text: 'Medicine & Supplements',
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  medicineSuppliRoute,
                );
              },
            ),
            buildCustomContainer(
              icon: Icons.home_filled,
              text: 'Personal Information',
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  personalInfoRoute,
                );
              },
            ),
            buildCustomContainer(
              icon: Icons.settings_rounded,
              text: 'Profile Settings',
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  profileSettingsRoute,
                );
              },
            ),
            buildCustomContainer(
              icon: Icons.contact_page,
              text: 'Contact Us',
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  contactUsRoute,
                );
              },
            ),
            buildCustomContainer(
              icon: Icons.logout_rounded,
              text: 'Log Out',
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  authViewRoute,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
