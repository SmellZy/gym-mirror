import 'package:gym_mirror/data/models/workout/workout_model.dart';
import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:hive/hive.dart';

part 'finished_workout_model.g.dart';

@HiveType(typeId: 3)
class FinishedWorkoutModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final WorkoutModel workout;
  @HiveField(2)
  final DateTime date;

  FinishedWorkoutModel(
    {
      required this.id, 
      required this.workout,
      required this.date
    }
  );

  //Convertion from entity to model
  factory FinishedWorkoutModel.fromEntity(FinishedWorkout workout) => FinishedWorkoutModel(
    id: workout.id, 
    workout: workout.workout,
    date: workout.date
  );

  //Convertion from model to entity
  FinishedWorkout toEntity() => FinishedWorkout(
    id: id,
    workout: workout,
    date: date
  );
}