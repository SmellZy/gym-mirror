import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
   const OnboardingButton({
    super.key,
    this.onPressed,
    this.textColor,
    required this.borderColor,
    required this.buttonText
  });

  final Function? onPressed;
  final String buttonText;
  final Color? textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 0),
        enableFeedback: false,
        minimumSize: const Size(double.infinity, 47),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        side: BorderSide(
          width: 1,
          color: borderColor,
        ),
      ),
      onPressed: () {onPressed;
      },
      child: Text(
        buttonText,
        style: TextStyle(
            color: textColor),
      ),
    );
  }
}