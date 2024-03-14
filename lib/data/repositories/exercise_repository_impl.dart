import 'package:gym_mirror/data/datasources/exercise_local_datasource.dart';
import 'package:gym_mirror/data/models/exercise/exercise_model.dart';
import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseLocalDatasource localDatasource;

  ExerciseRepositoryImpl({required this.localDatasource});

  @override
  Future<void> createExercise(Exercise exercise) async{
    final exerciseModel = ExerciseModel.fromEntity(exercise);
    localDatasource.createExercise(exerciseModel);
  }

  @override
  Future<void> deleteExercise(int id) async{
    localDatasource.deleteExercise(id);
  }

  @override
  Future<Exercise> getExerciseById(int id) async{
    final exerciseModel = localDatasource.getExerciseById(id);
    return exerciseModel!.toEntity();
  }

  @override
  Future<List<Exercise>> getExercises() async{
    final exerciseModel = localDatasource.getExercises();
    List<Exercise> res = exerciseModel.map((model) => model.toEntity()).toList();
    return res;
  }

  @override
  Future<void> updateExercise(Exercise exercise) async{
    final exerciseModel = ExerciseModel.fromEntity(exercise);
    localDatasource.updateExercise(exerciseModel);
  }
}