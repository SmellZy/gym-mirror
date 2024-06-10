import 'package:flutter/material.dart';
import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/generated/l10n.dart';

class ExercisesData {
  final Exercise exercise1;
  final Exercise exercise2;

  ExercisesData(BuildContext context)
      : exercise1 = Exercise(
          id: 0,
          name: S.of(context).mill,
          description: S.of(context).millDescription,
          repetitions: 20,
          sets: 3,
          restTime: 10,
          modelPath: "melnica",
        ),
        exercise2 = Exercise(
          id: 1,
          name: S.of(context).bicycle,
          description: S.of(context).bicylceDescription,
          repetitions: 15,
          sets: 3,
          restTime: 10,
          modelPath: "bicycle",
        );
}
