import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:hive/hive.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 1)
class ExerciseModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int repetitions;
  @HiveField(4)
  final int sets;
  @HiveField(5)
  final int restTime;
  @HiveField(6)
  final String modelPath;

  ExerciseModel(
    {
      required this.id, 
      required this.name, 
      required this.description, 
      required this.repetitions, 
      required this.sets, 
      required this.restTime,
      required this.modelPath
    }
  );

  //Convertion from entity to model
  factory ExerciseModel.fromEntity(Exercise exercise) => ExerciseModel(
    id: exercise.id, 
    name: exercise.name, 
    description: exercise.description, 
    repetitions: exercise.repetitions, 
    sets: exercise.sets, 
    restTime: exercise.restTime,
    modelPath: exercise.modelPath
  );

  //Convertion from model to entity
  Exercise toEntity() => Exercise(
    id: id, 
    name: name, 
    description: description, 
    repetitions: repetitions, 
    sets: sets, 
    restTime: restTime,
    modelPath: modelPath
  );

  static ExerciseModel fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      repetitions: json['repetitions'] as int,
      sets: json['sets'] as int,
      restTime: json['restTime'] as int,
      modelPath: json['modelPath'] as String,
    );
  }
}