import 'package:gym_mirror/data/datasources/finished_workout_local_datasource.dart';
import 'package:gym_mirror/data/models/finished_workout/finished_workout_model.dart';
import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/repositories/finished_workout_repository.dart';

class FinishedWorkoutRepositoryImpl implements FinishedWorkoutRepository {
  final FinishedWorkoutLocalDatasource localDatasource;

  FinishedWorkoutRepositoryImpl({required this.localDatasource});

  @override
  Future<void> createFinishedWorkout(FinishedWorkout workout) async{
    final workoutModel = FinishedWorkoutModel.fromEntity(workout);
    localDatasource.createFinishedWorkout(workoutModel);
  }

  @override
  Future<void> deleteFinishedWorkout(int id) async{
    localDatasource.deleteFinishedWorkout(id);
  }

  @override
  Future<FinishedWorkout> getFinishedWorkoutById(int id) async{
    final workoutModel = localDatasource.getFinishedWorkoutById(id);
    return workoutModel!.toEntity();
  }

  @override
  Future<List<FinishedWorkout>> getFinishedWorkouts() async{
    final workoutModel = localDatasource.getFinishedWorkouts();
    List<FinishedWorkout> res = workoutModel.map((model) => model.toEntity()).toList();
    return res;
  }

  @override
  Future<void> updateFinishedWorkout(FinishedWorkout workout) async{
    final workoutModel = FinishedWorkoutModel.fromEntity(workout);
    localDatasource.updateFinishedWorkout(workoutModel);
  }
}