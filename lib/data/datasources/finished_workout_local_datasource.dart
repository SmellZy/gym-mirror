import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:gym_mirror/data/models/finished_workout/finished_workout_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FinishedWorkoutLocalDatasource {
  final Box<FinishedWorkoutModel> finishedWorkoutBox;

  FinishedWorkoutLocalDatasource({required this.finishedWorkoutBox});

  List<FinishedWorkoutModel> getFinishedWorkouts() {
    return finishedWorkoutBox.values.toList();
  }

  FinishedWorkoutModel? getFinishedWorkoutById(int id) {
    return finishedWorkoutBox.get(id);
  } 

  void createFinishedWorkout(FinishedWorkoutModel workout) {
    finishedWorkoutBox.add(workout);
  }

  Future<void> updateFinishedWorkout(FinishedWorkoutModel workout) async {
  final existingWorkout = finishedWorkoutBox.values.firstWhereOrNull((w) => w.id == workout.id);
  if (existingWorkout != null) {
    await finishedWorkoutBox.putAt(existingWorkout.id, workout);
  } else {
    log('Finished Workout not found in local storage');
  }
}

  void deleteFinishedWorkout (int id) {
    finishedWorkoutBox.deleteAt(id);
  }
}