import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/custome_button.dart';
import 'chang_password_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController(text: '');
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
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Text(
                    "OTP Verification",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      "OTP has been sent to your email, ID please enter OTP",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i <= 5; i++) buildOTPFormField(i),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        MyCustomeButton(
                          text: "Verify",
                          onTap: () {
                            if (_formKey.currentState?.validate() == true) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangPasswordScreen()));
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                "Did't receive and email?",
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

  Widget buildOTPFormField(int index) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        key: ValueKey(index),
        //controller: TextEditingController(text: ''),
        cursorColor: Colors.grey[800],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 1, bottom: 1),
          filled: true,
          fillColor: Colors.white,
          hintText: "1",
          hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: _formKey.currentState?.validate() == false ? Colors.red : const Color.fromARGB(255, 117, 117, 117),
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _formKey.currentState?.validate() == false ? Colors.red : const Color.fromARGB(255, 117, 117, 117),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _formKey.currentState?.validate() == false ? Colors.red : Color.fromARGB(255, 117, 117, 117),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 117, 117, 117),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          errorText: _formKey.currentState?.validate() == false ? 'Enter number' : null,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus(); // Move focus to next field
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
