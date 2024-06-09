import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/repositories/finished_workout_repository.dart';

class UpdateFinishedWorkout {
  final FinishedWorkoutRepository repository;

  UpdateFinishedWorkout(this.repository);

  Future<void> call(FinishedWorkout workout) {
    return repository.updateFinishedWorkout(workout);
  }
}