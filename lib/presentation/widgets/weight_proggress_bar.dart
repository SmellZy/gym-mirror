import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WeightProgressBar extends StatelessWidget {
  final double initialWeight;
  final double currentWeight;
  final double goalWeight;

  WeightProgressBar({
    required this.initialWeight,
    required this.currentWeight,
    required this.goalWeight,
  });

  @override
  Widget build(BuildContext context) {
    double progress = 0.0;
    bool isLosingWeight = initialWeight > goalWeight;

    if (isLosingWeight) {
      if (currentWeight <= initialWeight && currentWeight >= goalWeight) {
        progress = (initialWeight - currentWeight) / (initialWeight - goalWeight);
      } else if (currentWeight < goalWeight) {
        progress = 1.0;
      }
    } else {
      if (currentWeight >= initialWeight && currentWeight <= goalWeight) {
        progress = (currentWeight - initialWeight) / (goalWeight - initialWeight);
      } else if (currentWeight > goalWeight) {
        progress = 1.0;
      }
    }

    // Ensure progress is between 0.0 and 1.0
    progress = progress.clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          isLosingWeight ? 'Losing Weight Progress' : 'Gaining Weight Progress',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width*0.7,
            animation: true,
            animationDuration: 1000,
            lineHeight: 40.0,
            percent: progress,
            center: Text(
              '${(progress * 100).toStringAsFixed(1)}%',
              style: const TextStyle(color: Colors.white),
            ),
            progressColor: isLosingWeight ? Colors.red : Colors.green,
            barRadius: const Radius.circular(15),
            backgroundColor: Colors.white.withOpacity(0.5),
            leading: Text(
              initialWeight.toStringAsFixed(1),
              style: const TextStyle(color: Colors.white, fontFamily: "Outer-Sans"),
            ),
            trailing: Text(
              goalWeight.toStringAsFixed(1),
              style: const TextStyle(color: Colors.white, fontFamily: "Outer-Sans"),
            ),
          ),
        ),
      ],
    );
  }
}
