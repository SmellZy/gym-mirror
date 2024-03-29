import 'package:gym_mirror/domain/entities/exercise.dart';

enum Difficulty {
  easy,
  medium,
  hard,
  expert
}

class Workout {
  final int id;
  final String title;
  final String description;
  final int calories;
  final int duration;
  final Difficulty difficulty;
  final List<Exercise> exercises;

  Workout(
    {
      required this.id,
      required this.title, 
      required this.description, 
      required this.calories, 
      required this.duration, 
      required this.difficulty,
      required this.exercises,
      }
    );
}