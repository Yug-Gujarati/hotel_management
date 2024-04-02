import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custome_button.dart';
import '../../components/custome_text_field.dart';
import 'login_screen.dart';

class ChangPasswordScreen extends StatefulWidget {
  const ChangPasswordScreen({super.key});

  @override
  State<ChangPasswordScreen> createState() => _ChangPasswordScreenState();
}

class _ChangPasswordScreenState extends State<ChangPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final ConfirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            "asstes/Reset password – 1.svg",
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Text(
                    "Get Started",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Text(
                    "Please fill your detail to access your account",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Enter your password',
                          errortext: "Please enter password",
                          svgPath: 'asstes/password.svg',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextField(
                          controller: ConfirmpasswordController,
                          hintText: "Enter your confirm Password",
                          errortext: "Enter confirm Password",
                          svgPath: 'asstes/password.svg',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter confirm Password';
                            } else if (value != passwordController.value.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        MyCustomeButton(
                          text: "Reset Password",
                          onTap: () {
                            if (_formKey.currentState?.validate() == true) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
