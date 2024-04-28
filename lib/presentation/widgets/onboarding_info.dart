import 'package:flutter/material.dart';

class OnboardingInfoInput extends StatelessWidget {
  const OnboardingInfoInput({
    super.key,
    required this.labelText,
    required this.child,
    required this.heightOfSizedBox,
  });
  final Widget child;
  final String labelText;
  final double heightOfSizedBox;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(labelText,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Outer-Sans",
              fontWeight: FontWeight.bold,
              fontSize: 27,
              decoration: TextDecoration.none)),
      const SizedBox(height: 40),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: child,),
      SizedBox(height: heightOfSizedBox),
    ]);
  }
}
