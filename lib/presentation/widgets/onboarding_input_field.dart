import 'package:flutter/material.dart';

class OnboardingInputField extends StatelessWidget {
  const OnboardingInputField({
    super.key,
    required this.controller,
    required this.suffixText,
    required this.hintText,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String? suffixText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool amountErrorStatus = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: "Outer-Sans",
          fontWeight: FontWeight.w200),
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixStyle: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 25,
            fontFamily: "Outer-Sans",
            fontWeight: FontWeight.w200),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Colors.white.withOpacity(0.75))),
        disabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Colors.white.withOpacity(0.75))),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Colors.white.withOpacity(0.75))),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 25,
            fontFamily: "Outer-Sans",
            fontWeight: FontWeight.w200),
        hintMaxLines: 1,
        hintTextDirection: TextDirection.ltr,
      ),
      keyboardType: keyboardType,
    );
  }
}
