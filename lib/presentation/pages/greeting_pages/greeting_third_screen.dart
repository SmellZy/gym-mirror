import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class GreetingThirdPage extends StatelessWidget {
  const GreetingThirdPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
              text: "Answer ",
              style: TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: "4 questions ",
              style: TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "before we start our \n",
              style: TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: "first training",
              style: TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold))
        ]));
  }
}
