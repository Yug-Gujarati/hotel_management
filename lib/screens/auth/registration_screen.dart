import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custome_button.dart';
import '../../components/custome_text_field.dart';
import '../dashboard/dashboard_screen.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confiempasswordControler = TextEditingController();
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
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Text(
                    "Sign Up",
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Enter your full name',
                          errortext: "Please enter full name",
                          svgPath: 'asstes/cusotmer icon.svg',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextField(
                          controller: emailController,
                          hintText: "Enter your email or mobile",
                          errortext: "enter email",
                          svgPath: 'asstes/email.svg',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            } else if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          hintText: "Enter your password",
                          errortext: "enter password",
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
                          controller: confiempasswordControler,
                          hintText: "Enter your password",
                          errortext: "enter password",
                          svgPath: 'asstes/password hide.svg',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm password is required';
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
                          text: "Sign Up",
                          onTap: () {
                            if (_formKey.currentState?.validate() == true) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                "Alrady have an Account ?",
                                style: TextStyle(color: Colors.grey[800], fontSize: 14),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                  child: Text(
                                    "Log in ",
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
                                  )),
                            ],
                          ),
                        ),
                        Text(
                          "Or",
                          style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, spreadRadius: 2),
                              ]),
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    'asstes/google.png',
                                    height: 25,
                                  )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, spreadRadius: 2),
                              ]),
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    'asstes/facebook.png',
                                    height: 25,
                                  )),
                            ),
                          ],
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
