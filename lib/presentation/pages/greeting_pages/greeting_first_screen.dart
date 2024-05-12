import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class GreetingFirstPage extends StatelessWidget {
  const GreetingFirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(children: [
          TextSpan(
              text: "Hi!\n",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: "My name is ",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: "IO.",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold))
        ]));
  }
}