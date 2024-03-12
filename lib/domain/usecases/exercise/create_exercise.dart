import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';

class CreateExercise {
  final ExerciseRepository repository;

  CreateExercise(this.repository);

  Future<void> call(Exercise exercise) {
    return repository.createExercise(exercise);
  }
}