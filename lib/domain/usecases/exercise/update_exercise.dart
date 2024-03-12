import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';

class UpdateExercise {
  final ExerciseRepository repository;

  UpdateExercise(this.repository);

  Future<void> call(Exercise exercise) {
    return repository.updateExercise(exercise);
  }
}