import 'package:gym_mirror/domain/repositories/workout_repository.dart';

class DeleteWorkout {
  final WorkoutRepository repository;

  DeleteWorkout(this.repository);

  Future<void> call(int id) {
    return repository.deleteWorkout(id);
  }
}