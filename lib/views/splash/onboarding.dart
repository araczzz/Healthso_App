import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/views/authentication/auth_view.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _currentPageIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                _buildTabContent(
                    "assets/onboarding_pg1.png",
                    "Discover Top Doctors",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat "),
                _buildTabContent(
                    "assets/onboarding_pg2.png",
                    "Ask a Doctor Online",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat"),
                _buildTabContent(
                    "assets/onboarding_pg3.png",
                    "Get Expert Advice",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(
      String imagePath, String welcomeText, String details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 514,
          height: 359,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDotIndicator(0),
            _buildDotIndicator(1),
            _buildDotIndicator(2),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          welcomeText,
          style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: ColorConstants.primaryColour),
        ),
        Text(
          details,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorConstants.onBoardText),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthView(),
                ),
              );
            },
            child: const Text(
              "Skip Tour",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDotIndicator(int pageIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndex == _currentPageIndex
            ? ColorConstants.primaryColour // Active page color
            : Colors.grey, // Inactive page color
      ),
    );
  }
}
