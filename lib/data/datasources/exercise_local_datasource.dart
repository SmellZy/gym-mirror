import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:gym_mirror/data/models/exercise/exercise_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExerciseLocalDatasource {
  final Box<ExerciseModel> exerciseBox;

  ExerciseLocalDatasource({required this.exerciseBox});

  List<ExerciseModel> getExercises() {
    return exerciseBox.values.toList();
  }

  ExerciseModel? getExerciseById(int id) {
    return exerciseBox.getAt(id);
  }

  void createExercise(ExerciseModel exercise) {
    exerciseBox.add(exercise);
  }

  Future<void> updateExercise(ExerciseModel exercise) async {
  final existingExercise = exerciseBox.values.firstWhereOrNull((w) => w.id == exercise.id);
  if (existingExercise != null) {
    await exerciseBox.putAt(existingExercise.id, exercise);
  } else {
    log('Exercise not found in local storage');
    }
  }

  void deleteExercise(int id) {
    exerciseBox.deleteAt(id);
  }

  void loadExercises(List<ExerciseModel> exercises) {
    for (var exercise in exercises) {
      exerciseBox.add(exercise);
    }
  }
}