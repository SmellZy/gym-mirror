import 'package:gym_mirror/data/datasources/workout_local_datasource.dart';
import 'package:gym_mirror/data/models/workout/workout_model.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final WorkoutLocalDatasource localDatasource;

  WorkoutRepositoryImpl({required this.localDatasource});

  @override
  Future<void> createWorkout(Workout workout) async{
    final workoutModel = WorkoutModel.fromEntity(workout);
    localDatasource.createWorkout(workoutModel);
  }

  @override
  Future<void> deleteWorkout(int id) async{
    localDatasource.deleteWorkout(id);
  }

  @override
  Future<Workout> getWorkoutById(int id) async{
    final workoutModel = localDatasource.getWorkoutById(id);
    return workoutModel!.toEntity();
  }

  @override
  Future<List<Workout>> getWorkouts() async{
    final workoutModel = localDatasource.getWrokouts();
    List<Workout> res = workoutModel.map((model) => model.toEntity()).toList();
    return res;
  }

  @override
  Future<void> updateWorkout(Workout workout) async{
    final workoutModel = WorkoutModel.fromEntity(workout);
    localDatasource.updateWorkout(workoutModel);
  }

  
}