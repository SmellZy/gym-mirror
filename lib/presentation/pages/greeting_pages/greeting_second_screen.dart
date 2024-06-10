import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_mirror/generated/l10n.dart';

@RoutePage()
class GreetingSecondPage extends StatelessWidget {
  const GreetingSecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text:  TextSpan(children: [
          TextSpan(
              text: S.of(context).iWillHelpYou,
              style: const TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: S.of(context).withIO,
              style: const TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: S.of(context).exercises,
              style: const TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold))
        ]));
  }
}