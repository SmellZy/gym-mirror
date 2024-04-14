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
  final int? weight;
  @HiveField(5)
  final int? dayStreak;
  @HiveField(6)
  final List<Workout>? workoutHistory;
  @HiveField(7)
  final FitnessLevel? fitnessLevel;

  UserModel(
    {
      required this.id,
      this.name, 
      this.birthday, 
      this.height, 
      this.weight,
      this.dayStreak,
      this.workoutHistory,
      this.fitnessLevel
    }
  );


  //Convertion from entity to model
  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
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
    id: id,
    name: name, 
    birthday: birthday, 
    height: height, 
    weight: weight,
    dayStreak: dayStreak,
    workoutHistory: workoutHistory,
    fitnessLevel: fitnessLevel
  );
}