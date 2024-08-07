import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/pages/pageentree2.dart';
import 'package:google_fonts/google_fonts.dart';

class entree1 extends StatefulWidget {
  const entree1({super.key});

  @override
  State<entree1> createState() => entree1State();
}

class entree1State extends State<entree1> {
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
              "assets/entree1.svg",
              height: screenHeight * 0.5,
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Find your Comfort",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Food here",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Here You Can find a chef or dish for every",
              style: GoogleFonts.roboto(
                fontSize: screenWidth * 0.04,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "taste and color. Enjoy!",
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
                    MaterialPageRoute(builder: (context) => const entree2()),
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
