import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';

class UpdateWorkout {
  final WorkoutRepository repository;

  UpdateWorkout(this.repository);

  Future<void> call(Workout workout) {
    return repository.updateWorkout(workout);
  }
}