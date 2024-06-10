import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_mirror/generated/l10n.dart';

@RoutePage()
class GreetingThirdPage extends StatelessWidget {
  const GreetingThirdPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text:  TextSpan(children: [
          TextSpan(
              text: S.of(context).answer,
              style: const TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: S.of(context).Questions4,
              style: const TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: S.of(context).beforeWeStartOur,
              style: const TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
          TextSpan(
              text: S.of(context).firstTraining,
              style: const TextStyle(
                  fontSize: 34,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold))
        ]));
  }
}
