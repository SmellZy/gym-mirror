import 'package:gym_mirror/domain/entities/workout.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> getWorkouts();
  Future<Workout> getWorkoutById(int id);
  Future<void> createWorkout(Workout workout);
  Future<void> updateWorkout(Workout workout);
  Future<void> deleteWorkout(int id);
}