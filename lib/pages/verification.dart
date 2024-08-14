import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/location.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/method.dart';
import 'package:food_delivery/pages/success1.dart';
import 'package:google_fonts/google_fonts.dart';


class verification extends StatefulWidget {
  const verification({super.key});
  @override
  _verificationState createState() => _verificationState();
}

class _verificationState extends State<verification> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset("assets/pattern2.svg", width: 400,),
          Column(
            children: [
              const SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Enter 4-digit", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 25)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Verification code", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 25)),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Code send to +6282045**** ",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "This code will expired in 01:30",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 345,
                  height: 105,
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x5A6CEA).withOpacity(0.07), // RGBA color with 7% opacity
                        offset: Offset(12, 26), // x: 12, y: 26
                        blurRadius: 50, // blur radius
                        spreadRadius: 0, // spread radius
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 50.0),
                      maxLength: 4,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Only allow digits
                        LengthLimitingTextInputFormatter(4), // Limit to 4 digits
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove the default underline border
                        counterText: "", // Remove character counter below the TextField

                      ),
                      onChanged: (value) {
                        if (value.length == 4) {
                          // Handle the complete input
                          print("Code entered: $value");
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                      MaterialPageRoute(builder: (context) => const method()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Make button background transparent
                    shadowColor: Colors.transparent, // Remove button shadow
                    minimumSize: const Size(157, 57), // Adjust button size as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Match the container's border radius
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}