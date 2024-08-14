import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/bio2.dart';
import 'package:food_delivery/pages/success2.dart';
import 'package:google_fonts/google_fonts.dart';


class password extends StatefulWidget {
  const password({super.key});
  @override
  _passwordState createState() => _passwordState();
}

class _passwordState extends State<password> {

  final _password1 = TextEditingController();
  final _password2 = TextEditingController();
  bool visible= false;

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
                    Text("Reset your password", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 25)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("here", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 25)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Select which contact details should we use to reset your password",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                height: 57,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFF4F4F4),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // Offset x: 12, y: 26
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                ),
                child: TextField(
                  controller: _password1,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "New Password",
                    hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: Color(0xFF959595),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    border: InputBorder.none,

                  ),
                ),

              ),
              const SizedBox(height: 20),
              Container(
                height: 57,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFF4F4F4),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07), // Shadow color with 7% opacity
                      offset: Offset(12, 26), // Offset x: 12, y: 26
                      blurRadius: 50, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                ),
                child: TextField(
                  controller: _password2,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: Color(0xFF959595),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    border: InputBorder.none,
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
                      MaterialPageRoute(builder: (context) => const Success2()),
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