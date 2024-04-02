import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/custome_button.dart';
import '../../components/custome_text_field.dart';
import 'login_screen.dart';
import 'otp_screens.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
                      "Forgot Password",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Please enter your register email and we will send you password reset instruction to this email",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: emailController,
                            hintText: 'Enter your email or mobile',
                            errortext: "Please enter email",
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
                            height: MediaQuery.of(context).size.height * 0.001,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                "Didn't receive and email?",
                                style: TextStyle(color: Colors.grey[800], fontSize: 14),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          MyCustomeButton(
                            text: "Send OTP",
                            onTap: () {
                              if (_formKey.currentState?.validate() == true) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpVerifyScreen()));
                              }
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomButton(
                            text: 'Cancle',
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            color: Colors.white,
                            borderColor: const Color.fromARGB(255, 117, 117, 117),
                            textColor: const Color.fromARGB(255, 66, 66, 66),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
