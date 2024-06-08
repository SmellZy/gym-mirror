import 'package:equatable/equatable.dart';
import 'package:gym_mirror/domain/entities/workout.dart';

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
  final int? weight;
  final List<int>? weightHistory;
  final int? dayStreak;
  final List<Workout>? workoutHistory;
  final FitnessLevel? fitnessLevel;

  User(
    {
      required this.id,
      this.name, 
      this.birthday, 
      this.height, 
      this.weight,
      this.weightHistory,
      this.dayStreak,
      this.workoutHistory,
      this.fitnessLevel,
    }
  );
  
  @override
  List<Object?> get props => [id, name, birthday, height, weight, weightHistory, dayStreak, workoutHistory, fitnessLevel];
}