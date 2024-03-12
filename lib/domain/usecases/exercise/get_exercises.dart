import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';

class GetExercises {
  final ExerciseRepository repository;

  GetExercises(this.repository);

  Future<List<Exercise>> call() {
    return repository.getExercises();
  }
}