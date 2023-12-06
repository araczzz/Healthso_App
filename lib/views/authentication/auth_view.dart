import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/constants/routes.dart';
import 'package:healthso/views/Resources/Patients/patient.dart';
import 'package:permission_handler/permission_handler.dart';
import 'register_view.dart';
import 'login_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(223, 63, 17, 230),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                  child: TextButton(
                    onPressed: () async {
                      final status = await Permission.location.request();

                      if (status.isGranted) {
                        // Location permission granted

                        // Update the current patient (you may need to replace this logic)
                        Patient.currentPatient =
                            Patient(id: 1, name: 'John Doe');

                        // Navigate to the home page
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          homePageRoute,
                          (route) => false,
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: ColorConstants.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 306,
                height: 580,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 179,
                              height: 42,
                              child: Image.asset(
                                'assets/logo_name.png',
                                width: 41.55,
                                height: 36.23,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 223,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 303,
                          height: 200,
                          child: Image.asset(
                            'assets/auth_bg_pic.png',
                            width: 303,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    // REGISTER BUTTON
                    Container(
                      // group6412h (171:858)
                      margin: const EdgeInsets.fromLTRB(15, 0, 15.87, 73),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupkdwoJXb (NKsmA4nodQnjM5d2rqkDwo)
                            margin: const EdgeInsets.fromLTRB(0, 0, 0.98, 16),
                            width: 295.02,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ColorConstants.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterView(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.125,
                                  color: ColorConstants.primaryColour,
                                ),
                              ),
                            ),
                          ),
                          //LOGIN BUTTON
                          Container(
                            // autogroupfkrwLDP (NKsmH4b9TxU5Bm2SQYfkRw)
                            margin: const EdgeInsets.fromLTRB(0.98, 0, 0, 0),
                            width: 295.02,
                            height: 42,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginView(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.125,
                                  color: ColorConstants.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
