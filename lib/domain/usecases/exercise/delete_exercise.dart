import 'package:gym_mirror/domain/repositories/exercise_repository.dart';

class DeleteExercise {
  final ExerciseRepository repository;

  DeleteExercise(this.repository);

  Future<void> call(int id) {
    return repository.deleteExercise(id);
  }
}