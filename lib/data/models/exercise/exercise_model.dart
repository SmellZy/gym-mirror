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

  ExerciseModel(
    {
      required this.id, 
      required this.name, 
      required this.description, 
      required this.repetitions, 
      required this.sets, 
      required this.restTime
    }
  );

  //Convertion from entity to model
  factory ExerciseModel.fromEntity(Exercise exercise) => ExerciseModel(
    id: exercise.id, 
    name: exercise.name, 
    description: exercise.description, 
    repetitions: exercise.repetitions, 
    sets: exercise.sets, 
    restTime: exercise.restTime
  );

  //Convertion from model to entity
  Exercise toEntity() => Exercise(
    id: id, 
    name: name, 
    description: description, 
    repetitions: repetitions, 
    sets: sets, 
    restTime: restTime
  );
}