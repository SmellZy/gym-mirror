import 'package:equatable/equatable.dart';
import 'package:gym_mirror/domain/entities/exercise.dart';

enum Difficulty {
  easy,
  medium,
  hard,
  expert
}

class Workout extends Equatable{
  final int id;
  final String? title;
  final String? description;
  final int? calories;
  final int? duration;
  final Difficulty? difficulty;
  final List<Exercise>? exercises;

  Workout(
    {
      required this.id,
      this.title, 
      this.description, 
      this.calories, 
      this.duration, 
      this.difficulty,
      this.exercises,
      }
    );
    
      @override
      List<Object?> get props => [id, title, description, calories, duration, difficulty, exercises];
}