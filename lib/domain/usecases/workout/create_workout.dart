import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';

class CreateWorkout {
  final WorkoutRepository repository;

  CreateWorkout(this.repository);

  Future<void> call(Workout workout) {
    return repository.createWorkout(workout);
  }
}