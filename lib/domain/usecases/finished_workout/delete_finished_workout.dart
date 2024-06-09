import 'package:gym_mirror/domain/repositories/finished_workout_repository.dart';

class DeleteFinishedWorkout {
  final FinishedWorkoutRepository repository;

  DeleteFinishedWorkout(this.repository);

  Future<void> call(int id) {
    return repository.deleteFinishedWorkout(id);
  }
}