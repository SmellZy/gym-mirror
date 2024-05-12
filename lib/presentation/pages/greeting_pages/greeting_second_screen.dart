import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class GreetingSecondPage extends StatelessWidget {
  const GreetingSecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
              text: "I will help you \n",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: "with ",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: "exercises!",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold))
        ]));
  }
}