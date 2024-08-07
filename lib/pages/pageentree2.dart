import 'package:flutter/material.dart';
import 'package:food_delivery/pages/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class entree2 extends StatefulWidget {
  const entree2({super.key});

  @override
  State<entree2> createState() => entree2State();
}

class entree2State extends State<entree2> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            SvgPicture.asset(
              "assets/entree2.svg",
              height: screenHeight * 0.5,
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Food Ninja is Where Your",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Comfort Food Lives",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "Enjoy a fast and smooth food delivery at",
              style: GoogleFonts.roboto(
                fontSize: screenWidth * 0.04,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "your doorstep",
              style: GoogleFonts.roboto(
                fontSize: screenWidth * 0.04,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF53E88B), Color(0xFF15BE77)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const signup()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: Size(screenWidth * 0.4, screenHeight * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  "Next",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
