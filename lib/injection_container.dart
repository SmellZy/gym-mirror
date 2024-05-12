import 'package:get_it/get_it.dart';
import 'package:gym_mirror/data/datasources/exercise_local_datasource.dart';
import 'package:gym_mirror/data/datasources/user_local_datasource.dart';
import 'package:gym_mirror/data/datasources/workout_local_datasource.dart';
import 'package:gym_mirror/data/models/exercise/exercise_model.dart';
import 'package:gym_mirror/data/models/user/user_model.dart';
import 'package:gym_mirror/data/models/workout/workout_model.dart';
import 'package:gym_mirror/data/repositories/exercise_repository_impl.dart';
import 'package:gym_mirror/data/repositories/user_repository_impl.dart';
import 'package:gym_mirror/data/repositories/workout_repository_impl.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';
import 'package:gym_mirror/domain/usecases/exercise/create_exercise.dart';
import 'package:gym_mirror/domain/usecases/exercise/delete_exercise.dart';
import 'package:gym_mirror/domain/usecases/exercise/get_exercise_by_id.dart';
import 'package:gym_mirror/domain/usecases/exercise/get_exercises.dart';
import 'package:gym_mirror/domain/usecases/exercise/update_exercise.dart';
import 'package:gym_mirror/domain/usecases/user/create_user.dart';
import 'package:gym_mirror/domain/usecases/user/get_user.dart';
import 'package:gym_mirror/domain/usecases/user/update_user.dart';
import 'package:gym_mirror/domain/usecases/workout/create_workout.dart';
import 'package:gym_mirror/domain/usecases/workout/delete_workout.dart';
import 'package:gym_mirror/domain/usecases/workout/get_workout_by_id.dart';
import 'package:gym_mirror/domain/usecases/workout/get_workouts.dart';
import 'package:gym_mirror/domain/usecases/workout/update_workout.dart';
import 'package:gym_mirror/presentation/bloc/exercise/exercise_bloc.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/bloc/workout/workout_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  
  // User Use Cases
  getIt.registerLazySingleton(() => CreateUser(getIt()));
  getIt.registerLazySingleton(() => GetUser(getIt()));
  getIt.registerLazySingleton(() => UpdateUser(getIt()));

  // Exercise Use Cases
  getIt.registerLazySingleton(() => CreateExercise(getIt()));
  getIt.registerLazySingleton(() => DeleteExercise(getIt()));
  getIt.registerLazySingleton(() => GetExercises(getIt()));
  getIt.registerLazySingleton(() => GetExerciseById(getIt()));
  getIt.registerLazySingleton(() => UpdateExercise(getIt()));

  // Workout Use Cases
  getIt.registerLazySingleton(() => CreateWorkout(getIt()));
  getIt.registerLazySingleton(() => DeleteWorkout(getIt()));
  getIt.registerLazySingleton(() => GetWorkoutById(getIt()));
  getIt.registerLazySingleton(() => GetWorkouts(getIt()));
  getIt.registerLazySingleton(() => UpdateWorkout(getIt()));

  // Repositories
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(localDatasource: getIt()));
  getIt.registerLazySingleton<WorkoutRepository>(() => WorkoutRepositoryImpl(localDatasource: getIt()));
  getIt.registerLazySingleton<ExerciseRepository>(() => ExerciseRepositoryImpl(localDatasource: getIt()));

  // Data sources
  getIt.registerLazySingleton<UserLocalDatasource>(() => UserLocalDatasource(userBox: getIt()));
  getIt.registerLazySingleton<WorkoutLocalDatasource>(() => WorkoutLocalDatasource(workoutBox: getIt()));
  getIt.registerLazySingleton<ExerciseLocalDatasource>(() => ExerciseLocalDatasource(exerciseBox: getIt()));

  
  // Hive
  getIt.registerLazySingleton<Box<UserModel>>(() => Hive.box<UserModel>('userBox'));
  getIt.registerLazySingleton<Box<ExerciseModel>>(() => Hive.box<ExerciseModel>('exerciseBox'));
  getIt.registerLazySingleton<Box<WorkoutModel>>(() => Hive.box<WorkoutModel>('workoutBox'));


  // Bloc
  getIt.registerFactory(() => UserBloc(getIt<UserRepository>()));
  getIt.registerFactory(() => WorkoutBloc(getIt<WorkoutRepository>()));
  getIt.registerFactory(() => ExerciseBloc(getIt<ExerciseRepository>()));
}