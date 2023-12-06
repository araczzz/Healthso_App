// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as devtools show log;
import '../../constants/colour_constants.dart';
import '../../constants/routes.dart';
import '../../utilities/show_error_dialogue.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // Function to handle "Forgot Password?" action
  void _handleForgotPassword() {
    // Add navigation logic to "verify_email_view.dart"
    Navigator.of(context).pushNamed(verifyEmailRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColour,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/auth_bg_pic.png'), // Centered background image
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        color: Colors.white), // Text color is white
                    decoration: const InputDecoration(
                      hintText: 'Enter your email', // Updated hint text
                      labelText: 'Email', // Updated label text
                      labelStyle: TextStyle(
                          color: Colors.white), // Label text color is white
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Set border color to white
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: const TextStyle(
                            color: Colors.white), // Text color is white
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password here',
                          labelStyle: TextStyle(
                              color: Colors.white), // Label text color is white
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.white), // Set border color to white
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: TextButton(
                          onPressed:
                              _handleForgotPassword, // Use the function to navigate to "verify_email_view.dart"
                          style: TextButton.styleFrom(
                              foregroundColor: ColorConstants.white),
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 40,
                      right: 40,
                    ),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return ColorConstants.primaryColour;
                              }
                              return const Color.fromARGB(255, 249, 249,
                                  249); // Use blue color for the button
                            },
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: ColorConstants.primaryColour,
                              fontWeight:
                                  FontWeight.bold), // Set text color to white
                        ),
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;

                          try {
                            final userCredential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            // Check if the user's email is verified
                            if (userCredential.user?.emailVerified == true) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                homePageRoute,
                                (route) => false,
                              );
                              devtools.log(userCredential.toString());
                            } else {
                              Navigator.of(context).pushNamed(verifyEmailRoute);
                            }
                          } on FirebaseAuthException catch (e) {
                            // Handle sign-in errors
                            if (e.code == 'user-not-found') {
                              await showErrorDialogue(
                                context,
                                'Incorrect email/password',
                              );
                            } else if (e.code == 'wrong-password') {
                              await showErrorDialogue(
                                context,
                                'Wrong Credentials',
                              );
                            } else {
                              await showErrorDialogue(
                                context,
                                'Error: ${e.code}',
                              );
                            }
                          } catch (e) {
                            await showErrorDialogue(
                              context,
                              e.toString(),
                            );
                          }
                        }),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute,
                        (route) => false,
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: ColorConstants.white),
                    child: const Text('Not registered yet ? Register Here!'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
