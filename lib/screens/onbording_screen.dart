import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_management/screens/auth/login_screen.dart';
import 'package:hotel_management/screens/auth/registration_screen.dart';

import '../components/custome_button.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "asstes/Onboarding screen – 1.svg", fit: BoxFit.fill, // Cover entire screen
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Image.asset(
                    "asstes/logo for onbording screen.png",
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                ),
                Spacer(),
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MyCustomeButton(
                  text: "Log in",
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomButton(
                  text: "Sign Up",
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                  },
                  textColor: Colors.blue,
                  color: Colors.white,
                  borderColor: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
