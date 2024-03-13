import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DateTime birthday;
  @HiveField(2)
  final int height;
  @HiveField(3)
  final int weight;
  @HiveField(4)
  final int dayStreak;
  @HiveField(5)
  final List<Workout> workoutHistory;
  @HiveField(6)
  final FitnessLevel fitnessLevel;

  UserModel(
    {
      required this.name, 
      required this.birthday, 
      required this.height, 
      required this.weight,
      required this.dayStreak,
      required this. workoutHistory,
      required this.fitnessLevel
    }
  );


  //Convertion from entity to model
  factory UserModel.fromEntity(User user) => UserModel(
    name: user.name, 
    birthday: user.birthday, 
    height: user.height, 
    weight: user.weight,
    dayStreak: user.dayStreak,
    workoutHistory: user.workoutHistory,
    fitnessLevel: user.fitnessLevel
  );

  //Convertion from model to entity
  User toEntity() => User(
    name: name, 
    birthday: birthday, 
    height: height, 
    weight: weight,
    dayStreak: dayStreak,
    workoutHistory: workoutHistory,
    fitnessLevel: fitnessLevel
  );
}