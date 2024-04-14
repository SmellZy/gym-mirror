import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:hive/hive.dart';

part 'workout_model.g.dart';

@HiveType(typeId: 2)
class WorkoutModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final int? calories;
  @HiveField(4)
  final int? duration;
  @HiveField(5)
  final Difficulty? difficulty;
  @HiveField(6)
  final List<Exercise>? exercises;

  WorkoutModel(
    {
      required this.id, 
      this.title, 
      this.description, 
      this.calories, 
      this.duration, 
      this.difficulty, 
      this.exercises
    }
  );

  //Convertion from entity to model
  factory WorkoutModel.fromEntity(Workout workout) => WorkoutModel(
    id: workout.id, 
    title: workout.title, 
    description: workout.description, 
    calories: workout.calories, 
    duration: workout.duration, 
    difficulty: workout.difficulty, 
    exercises: workout.exercises
  );

  //Convertion from model to entity
  Workout toEntity() => Workout(
    id: id,
    title: title,
    description: description,
    calories: calories,
    duration: duration,
    difficulty: difficulty,
    exercises: exercises
  );
}