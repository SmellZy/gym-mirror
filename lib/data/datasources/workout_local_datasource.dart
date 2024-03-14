import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:gym_mirror/data/models/workout/workout_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutLocalDatasource {
  final Box<WorkoutModel> workoutBox;

  WorkoutLocalDatasource({required this.workoutBox});

  List<WorkoutModel> getWrokouts() {
    return workoutBox.values.toList();
  }

  WorkoutModel? getWorkoutById(int id) {
    return workoutBox.get(id);
  } 

  void createWorkout(WorkoutModel workout) {
    workoutBox.add(workout);
  }

  Future<void> updateWorkout(WorkoutModel workout) async {
  final existingWorkout = workoutBox.values.firstWhereOrNull((w) => w.id == workout.id);
  if (existingWorkout != null) {
    await workoutBox.putAt(existingWorkout.id, workout);
  } else {
    log('Workout not found in local storage');
  }
}

  void deleteWorkout (int id) {
    workoutBox.deleteAt(id);
  }
}