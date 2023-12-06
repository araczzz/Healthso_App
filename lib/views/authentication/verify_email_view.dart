// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colour_constants.dart';
import '../../constants/routes.dart';
import '../../utilities/logout_dialogue.dart.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

//logout
enum MenuAction { logout }

class _VerifyEmailViewState extends State<VerifyEmailView> {
//changes

  @override
  void initState() {
    super.initState();
    checkEmailVerification();
  }

  void checkEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        navigateToMain();
      }
    }
  }

  void navigateToMain() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      homePageRoute,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ColorConstants.primaryColour, // Background color is now #4F2ECC
      appBar: AppBar(
        title: const Text('Verify Email'),
        backgroundColor:
            ColorConstants.primaryColour, // Set app bar color to #4F2ECC
        //for logout option
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialogue(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      authViewRoute,
                      (_) => false,
                    );
                  }
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                    value: MenuAction.logout, child: Text('Log Out'))
              ];
            },
          )
        ],
        //for logout option
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Text(
              "We've sent you an email to verify your email. Please click the link to verify your email.",
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.white, // Text color is white
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Text(
              "If you haven't received a verification email, kindly press the button below!!",
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.white, // Text color is white
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 5, left: 40, right: 40),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white; // White when pressed
                        }
                        return Colors.white; // White for normal state
                      },
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(const Color(
                        0xFF4F2ECC)), // Set the text color to the background color
                  ),
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();
                  },
                  child: const Text(
                    'Send email verification',
                  ),
                ),
              ),
              const SizedBox(height: 0), // Add a SizedBox with zero height
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 40, right: 40),
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromARGB(255, 173, 229, 176);
                              }
                              return Colors.white;
                            },
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColorConstants.primaryColour),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromARGB(255, 254, 255, 255),
                              width: 2.0,
                            ),
                          ), // Add a green border
                        ),
                        onPressed: checkEmailVerification,
                        child: const Text('Check'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
