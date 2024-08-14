import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/location.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/password.dart';
import 'package:food_delivery/pages/success1.dart';
import 'package:google_fonts/google_fonts.dart';


class method extends StatefulWidget {
  const method({super.key});
  @override
  _methodState createState() => _methodState();
}

class _methodState extends State<method> {


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
                    Text("Forgot password?", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 25)),
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
                      "Select which contact details should we",
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
                      "use to reset your password",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height: 105,
                  width: 345,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x5A6CEA).withOpacity(0.07),
                        offset: Offset(0, 0),
                        blurRadius: 50,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/message.svg"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Via sms:",style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: 18,
                              ),),
                              Row(
                                children: [
                                  Text("•••• •••• ",style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Text("5438",style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 18,

                                  ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  height: 105,
                  width: 345,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x5A6CEA).withOpacity(0.07),
                        offset: Offset(0, 0),
                        blurRadius: 50,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/email1.svg"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Via email:",style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: 18,
                              ),),
                              Row(
                                children: [
                                  Text("•••• ",style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Text("@gmail.com",style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 18,

                                  ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
                      MaterialPageRoute(builder: (context) => const password()),
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