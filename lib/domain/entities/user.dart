import 'package:equatable/equatable.dart';
import 'package:gym_mirror/data/models/finished_workout/finished_workout_model.dart';

enum FitnessLevel {
  beginner,
  intermediate,
  advanced
}

class User extends Equatable{
  final int id;
  final String? name;
  final DateTime? birthday;
  final int? height;
  final int? initialWeight;
  final int? currentWeight;
  final int? goalWeight;
  final List<int>? weightHistory;
  final int? dayStreak;
  final List<FinishedWorkoutModel>? workoutHistory;
  final FitnessLevel? fitnessLevel;

  User(
    {
      required this.id,
      this.name, 
      this.birthday, 
      this.height, 
      this.initialWeight,
      this.currentWeight,
      this.goalWeight,
      this.weightHistory,
      this.dayStreak,
      this.workoutHistory,
      this.fitnessLevel,
    }
  );
  
  @override
  List<Object?> get props => [id, name, birthday, height, initialWeight, currentWeight, goalWeight, weightHistory, dayStreak, workoutHistory, fitnessLevel];
}