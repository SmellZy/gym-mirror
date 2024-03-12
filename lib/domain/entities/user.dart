import 'package:gym_mirror/domain/entities/workout.dart';

enum FitnessLevel {
  beginner,
  intermediate,
  advanced
}

class User {
  final String name;
  final DateTime birthday;
  final int height;
  final int weight;
  final int dayStreak;
  final List<Workout> workoutHistory;
  final FitnessLevel fitnessLevel;

  User(
    {
      required this.name, 
      required this.birthday, 
      required this.height, 
      required this.weight,
      required this.dayStreak,
      required this.workoutHistory,
      required this.fitnessLevel,
    }
  );
}