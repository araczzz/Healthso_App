import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthso/views/authentication/auth_view.dart';
import 'package:healthso/views/authentication/login_view.dart';
import 'package:healthso/views/authentication/register_view.dart';
import 'package:healthso/views/authentication/verify_email_view.dart';
import 'package:healthso/views/pages/HOME/home_menus/all_symptomps.dart';
import 'package:healthso/views/pages/HOME/home_menus/popular_doctors.dart';
import 'package:healthso/views/pages/PROFILE/profile_menus/contact_us.dart';
import 'package:healthso/views/pages/PROFILE/profile_menus/edit_profile.dart';
import 'package:healthso/views/pages/PROFILE/profile_menus/medical_history.dart';
import 'package:healthso/views/pages/PROFILE/profile_menus/medicine_suppli.dart';
import 'package:healthso/views/pages/PROFILE/profile_menus/personal_info.dart';
import 'package:healthso/views/pages/PROFILE/profile_menus/profile_set.dart';
import 'package:healthso/views/pages/PROFILE/profile_menus/your_history.dart';
import 'package:healthso/views/pages/home_page.dart';
import 'package:healthso/views/splash/onboarding.dart';
import 'constants/colour_constants.dart';
import 'constants/routes.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        onBoardRoute: (context) => const Onboarding(),
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        homePageRoute: (context) => const HomePage(),
        authViewRoute: (context) => const AuthView(),
        firebaseInitRoute: (context) => const FirebaseInit(),
        //profile-page
        medicalHistoryRoute: (context) => const MedicalHistory(),
        yourHistoryRoute: (context) => const YourHistory(),
        medicineSuppliRoute: (context) => const MedicineSuppli(),
        personalInfoRoute: (context) => const PersonalInfo(),
        profileSettingsRoute: (context) => const ProfileSettings(),
        contactUsRoute: (context) => const ContactUs(),
        editProfRoute: (context) => const EditProfile(),
        //home
        symptomsRoute: (context) => const AllSymptoms(),
        //doctor
        popularDocRoute: (context) => const PopularDoctors(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay for the splash screen (you can replace this with loading data, etc.)
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the HomeScreen after the splash screen is done
      Navigator.pushReplacementNamed(context, firebaseInitRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Customize the background color or add your splash screen image here
      backgroundColor: ColorConstants.primaryColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/logo.png'),
              width: 171,
              height: 149,
            ),
            SizedBox(height: 20),
            Image(
              image: AssetImage('assets/app_name.png'),
              width: 131,
              height: 42,
            ),
            SizedBox(height: 19),
            Text(
              'India’s top doctors to guide you to',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: ColorConstants.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'better health every day',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: ColorConstants.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseInit extends StatelessWidget {
  const FirebaseInit({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  return const HomePage();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const Onboarding();
              }

            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
