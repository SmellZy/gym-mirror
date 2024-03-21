import 'package:gym_mirror/domain/entities/exercise.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> getExercises();
  Future<Exercise> getExerciseById(int id);
  Future<void> createExercise(Exercise exercise);
  Future<void> updateExercise(Exercise exercise);
  Future<void> deleteExercise(int id);
  Future<List<Exercise>> loadExercises();
}