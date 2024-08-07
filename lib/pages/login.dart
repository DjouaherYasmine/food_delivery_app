import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/pattern.png",
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                SizedBox(height: size.height * 0.1),
                Image.asset(
                  "assets/foodninja.png",
                  height: size.height * 0.22,
                  width: size.width * 0.7,
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "Login to your account",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  height: size.height * 0.07,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFF4F4F4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(90, 108, 234, 0.07),
                        offset: Offset(12, 26),
                        blurRadius: 50,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
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
                SizedBox(height: size.height * 0.02),
                Container(
                  height: size.height * 0.07,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFF4F4F4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(90, 108, 234, 0.07),
                        offset: Offset(12, 26),
                        blurRadius: 50,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
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
                SizedBox(height: size.height * 0.03),
                Text(
                  "Or Continue With",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: size.height * 0.07,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFF4F4F4),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            offset: Offset(12, 26),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/facebook.svg"),
                          Text("Facebook",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04)),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.07,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFF4F4F4),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(90, 108, 234, 0.07),
                            offset: Offset(12, 26),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/google.svg"),
                          Text("Google",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Color(0xFF53E88B), Color(0xFF15BE77)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.clamp,
                    ).createShader(bounds);
                  },
                  child: Text(
                    "Forgot your password?",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.035,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
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
                        MaterialPageRoute(builder: (context) => const login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      minimumSize: Size(size.width * 0.4, size.height * 0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
