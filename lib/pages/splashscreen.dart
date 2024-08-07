import 'package:flutter/material.dart';
import 'dart:async';

import 'package:food_delivery/pages/pageentree1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const entree1(), // Navigate to the next page
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Your splash screen UI here
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/pattern.png",
              fit: BoxFit.cover, // Ensure the background image covers the entire screen
            ),
          ),
          Center(
            child: Image.asset(
              "assets/foodninja.png",
              height: screenHeight * 0.2, // 20% of screen height
              width: screenWidth * 0.7, // 70% of screen width
              fit: BoxFit.contain, // Maintain aspect ratio
            ),
          ),
        ],
      ),
    );
  }
}
