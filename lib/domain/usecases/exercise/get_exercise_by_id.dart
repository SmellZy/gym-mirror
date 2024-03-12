import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';

class GetExerciseById {
  final ExerciseRepository repository;

  GetExerciseById(this.repository);

  Future<Exercise> call(int id) {
    return repository.getExerciseById(id);
  }
}