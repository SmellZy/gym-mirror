import 'package:equatable/equatable.dart';

class Exercise extends Equatable{
  final int id;
  final String? name;
  final String? description;
  final int? repetitions;
  final int? sets;
  final int? restTime;
  final String? modelPath;

  Exercise(
    {
      required this.id,
      this.name, 
      this.description, 
      this.repetitions, 
      this.sets, 
      this.restTime,
      this.modelPath
    }
  );

  @override
  List<Object?> get props => [id, name, description, repetitions, sets, restTime, modelPath];
}