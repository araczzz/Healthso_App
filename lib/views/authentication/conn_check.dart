import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Scene extends StatefulWidget {
  const Scene({super.key});

  @override
  SceneState createState() => SceneState();
}

class SceneState extends State<Scene> {
  Future<bool> checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final isConnected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              child,
              if (!isConnected)
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.red,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wifi_off,
                            size: 80,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No Internet Connection',
                            style: GoogleFonts.raleway(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap the screen to try again',
                            style: GoogleFonts.raleway(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff4F2ECC),
          ),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(17, 17.17, 16.13, 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff4F2ECC),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // vectorUUH (1:3127)
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 244.33),
                    width: 326.87,
                    height: 11.5,
                    child: Image.asset(
                      'assets/heart.png',
                      width: 326.87,
                      height: 11.5,
                    ),
                  ),
                  Container(
                    // vectorxPT (1:3291)
                    margin: const EdgeInsets.fromLTRB(1.13, 0, 0, 63),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: SizedBox(
                        width: 116,
                        height: 116,
                        child: Image.asset(
                          'assets/nocnn.png',
                          width: 116,
                          height: 116,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // group2RH3 (1:3292)
                    margin: const EdgeInsets.fromLTRB(34.5, 0, 35.37, 270),
                    width: double.infinity,
                    height: 63,
                    child: Stack(
                      children: [
                        Positioned(
                          // healthso8hF (I1:3293;2:959)
                          left: 0,
                          top: 0,
                          child: Align(
                            child: SizedBox(
                              width: 257,
                              height: 42,
                              child: Text(
                                'Oops! No Internet Connection',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  height: 2.1,
                                  letterSpacing: -1,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // tapthescreentotryagainZnZ (1:3294)
                          left: 50,
                          top: 37,
                          child: Align(
                            child: SizedBox(
                              width: 158,
                              height: 26,
                              child: Text(
                                'Tap the screen to try again',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.8571428571,
                                  letterSpacing: -0.5,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // rectangle8CKj (1:3126)
                    margin: const EdgeInsets.fromLTRB(96, 0, 95.87, 0),
                    width: double.infinity,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
