import 'package:gym_mirror/data/models/finished_workout/finished_workout_model.dart';
import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final DateTime? birthday;
  @HiveField(3)
  final int? height;
  @HiveField(4)
  final int? initialWeight;
  @HiveField(5)
  final int? currentWeight;
  @HiveField(6)
  final int? goalWeight;
  @HiveField(7)
  final int? dayStreak;
  @HiveField(8)
  final List<FinishedWorkoutModel>? workoutHistory;
  @HiveField(9)
  final FitnessLevel? fitnessLevel;
  @HiveField(10)
  final List<int>? weigthHistory;

  UserModel(
    {
      required this.id,
      this.name, 
      this.birthday, 
      this.height, 
      this.initialWeight,
      this.currentWeight,
      this.goalWeight,
      this.dayStreak,
      this.workoutHistory,
      this.fitnessLevel,
      this.weigthHistory
    }
  );


  //Convertion from entity to model
  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    name: user.name, 
    birthday: user.birthday, 
    height: user.height, 
    initialWeight: user.initialWeight,
    currentWeight: user.currentWeight,
    goalWeight: user.goalWeight,
    dayStreak: user.dayStreak,
    workoutHistory: user.workoutHistory,
    fitnessLevel: user.fitnessLevel,
    weigthHistory: user.weightHistory
  );

  //Convertion from model to entity
  User toEntity() => User(
    id: id,
    name: name, 
    birthday: birthday, 
    height: height, 
    initialWeight: initialWeight,
    currentWeight: currentWeight,
    goalWeight: goalWeight,
    dayStreak: dayStreak,
    workoutHistory: workoutHistory,
    fitnessLevel: fitnessLevel,
    weightHistory: weigthHistory
  );
}