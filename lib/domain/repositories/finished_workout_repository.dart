import 'package:gym_mirror/domain/entities/finished_workout.dart';

abstract class FinishedWorkoutRepository {
  Future<List<FinishedWorkout>> getFinishedWorkouts();
  Future<FinishedWorkout> getFinishedWorkoutById(int id);
  Future<void> createFinishedWorkout(FinishedWorkout workout);
  Future<void> updateFinishedWorkout(FinishedWorkout workout);
  Future<void> deleteFinishedWorkout(int id);
}