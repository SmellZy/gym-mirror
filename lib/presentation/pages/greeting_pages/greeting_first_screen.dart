import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_mirror/generated/l10n.dart';

@RoutePage()
class GreetingFirstPage extends StatelessWidget {
  const GreetingFirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text:  TextSpan(children: [
          TextSpan(
              text: S.of(context).Hi,
              style: const TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
           TextSpan(
              text: S.of(context).myNameIs,
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.w200)),
           TextSpan(
              text: S.of(context).io,
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Outer-Sans",
                  fontWeight: FontWeight.bold))
        ]));
  }
}