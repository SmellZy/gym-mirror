import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).maybePop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          )),
      width: MediaQuery.of(context).size.width * 0.7,
      lineHeight: 18.0,
      percent: percent,
      backgroundColor: Colors.transparent,
      progressColor: const Color.fromARGB(255, 44, 83, 189),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      barRadius: const Radius.circular(35),
      animation: true,
      animationDuration: 2500,
      alignment: MainAxisAlignment.center,
      clipLinearGradient: true,
      animateFromLastPercent: true,
    );
  }
}
