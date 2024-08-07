import 'package:flutter/material.dart';
import 'package:food_delivery/pages/bio1.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => signupState();
}

class signupState extends State<signup> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();
  bool _isChecked = false;
  bool _isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final isSmallScreen = width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/pattern.png", width: width, height: height, fit: BoxFit.cover),
            Column(
              children: [
                SizedBox(height: height * 0.1),
                Image.asset("assets/foodninja.png", height: height * 0.22, width: width * 0.8),
                SizedBox(height: height * 0.05),
                Text("Sign Up for Free", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: isSmallScreen ? 18 : 22)),
                SizedBox(height: height * 0.03),
                _buildTextField(
                  context,
                  controller: _username,
                  hintText: "Username",
                  assetName: "assets/profil.svg",
                ),
                SizedBox(height: height * 0.02),
                _buildTextField(
                  context,
                  controller: _email,
                  hintText: "Email",
                  assetName: "assets/email.svg",
                ),
                SizedBox(height: height * 0.02),
                _buildTextField(
                  context,
                  controller: _password,
                  hintText: "Password",
                  assetName: "assets/password.svg",
                  obscureText: true,
                ),
                SizedBox(height: height * 0.03),
                _buildCheckbox(context, "Keep Me Signed In", _isChecked, (value) {
                  setState(() {
                    _isChecked = value;
                  });
                }),
                SizedBox(height: height * 0.02),
                _buildCheckbox(context, "Email Me About Special Pricing", _isChecked1, (value) {
                  setState(() {
                    _isChecked1 = value;
                  });
                }),
                SizedBox(height: height * 0.04),
                _buildSignUpButton(context),
                SizedBox(height: height * 0.02),
                _buildLoginText(context),
                SizedBox(height: height * 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, {required TextEditingController controller, required String hintText, required String assetName, bool obscureText = false}) {
    return Container(
      height: 57,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFF4F4F4),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(90, 108, 234, 0.07), // Shadow color with 7% opacity
            offset: Offset(12, 26), // Offset x: 12, y: 26
            blurRadius: 50, // Blur radius
            spreadRadius: 0, // Spread radius
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(assetName),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: hintText == "Email" ? TextInputType.emailAddress : TextInputType.text,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: "Roboto",
                  color: Color(0xFF959595),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context, String text, bool isChecked, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              onChanged(!isChecked);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isChecked ? [const Color(0xFF53E88B), const Color(0xFF15BE77)] : [Colors.transparent, Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: !isChecked ? const Color(0xFF53E88B) : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (!isChecked)
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xFF53E88B), Color(0xFF15BE77)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  if (isChecked)
                    const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
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
            MaterialPageRoute(builder: (context) => const bio1()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Make button background transparent
          shadowColor: Colors.transparent, // Remove button shadow
          minimumSize: const Size(175, 57), // Adjust button size as needed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Match the container's border radius
          ),
        ),
        child: Text(
          "Create an account",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const login()),
        );
      },
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Color(0xFF53E88B), Color(0xFF15BE77)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp,
          ).createShader(bounds);
        },
        child: Text("already have an account?", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
      ),
    );
  }
}
