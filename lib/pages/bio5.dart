import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/location.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/success1.dart';
import 'package:google_fonts/google_fonts.dart';


class bio5 extends StatefulWidget {
  const bio5({super.key});
  @override
  _bio5State createState() => _bio5State();
}

class _bio5State extends State<bio5> {


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
                    Text("Set your location", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 25)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "This data will be displayed in your account profile for security",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                height: 147,
                width: 342,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      offset: Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(22),
                ),
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/pin.svg"),
                          const SizedBox(width: 10,),
                          Text(
                            "Your location",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                      onTap:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => locate()),
                        );
                      },
                      child: Container(
                        height: 57,
                        width: 322,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Set location",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ),
                    )
                  ],
                )
              )
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
                      MaterialPageRoute(builder: (context) => const Success1()),
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