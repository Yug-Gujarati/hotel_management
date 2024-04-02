import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String svgPath;
  final String? Function(String?)? validator;
  final String errortext;

  CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.svgPath,
    this.validator,
    required this.errortext,
  }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey[800],
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0.5),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 40, right: 30),
          child: SvgPicture.asset(
            svgPath,
            color: Colors.grey[800],
            height: 18,
            width: 18,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _formKey.currentState?.validate() == false ? Colors.red : const Color.fromARGB(255, 117, 117, 117),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: _formKey.currentState?.validate() == false ? Colors.red : Color.fromARGB(255, 117, 117, 117),
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
        errorText: _formKey.currentState?.validate() == false ? errortext : null,
      ),
    );
  }
}
