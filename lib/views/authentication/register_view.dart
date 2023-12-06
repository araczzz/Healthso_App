// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colour_constants.dart';
import '../../constants/routes.dart';
import '../../utilities/show_error_dialogue.dart';
import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _fullName;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _fullName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    final email = _email.text;
    final password = _password.text;
    final fullname = _fullName.text;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updateDisplayName(fullname);

        devtools.log('username: $user.displayName');
      }
      devtools.log("Signup successful: ${userCredential.user}");

      Navigator.pushNamed(context, loginRoute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        await showErrorDialogue(
          context,
          'Email already in use. Please try a different email.',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ColorConstants.primaryColour, // Background color is now #4F2ECC
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40), // Add spacing at the top
            const Text(
              'Hello!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Add spacing below the text

            Image.asset('assets/auth_bg_pic.png'), // Centered background image
            const SizedBox(height: 20),
            // Centered background image
            const SizedBox(height: 20), // Add spacing below the image
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _fullName,
                    style: const TextStyle(
                        color: Colors.white), // Text color is white
                    decoration: const InputDecoration(
                      hintText: 'Enter your full name',
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                          color: Colors.white), // Label text color is white
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Set border color to white
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        color: Colors.white), // Text color is white
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.white), // Label text color is white
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Set border color to white
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.white), // Text color is white
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      labelStyle: TextStyle(
                          color: Colors.white), // Label text color is white
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Set border color to white
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 40, right: 40),
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
                            return Colors.white;
                          },
                        ),
                      ),
                      onPressed: _handleSignup,
                      child: Text(
                        'Signup',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: ColorConstants
                                .primaryColour), // Set text color to black
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (route) => false,
                      );
                    },
                    // Set text color to white
                    child: const Text('Already have an account? Login Here!'),
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
