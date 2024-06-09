import 'package:equatable/equatable.dart';
import 'package:gym_mirror/data/models/workout/workout_model.dart';



class FinishedWorkout extends Equatable{
  final int id;
  final WorkoutModel workout;
  final DateTime date;

  FinishedWorkout(
    {
      required this.id,
      required this.workout,
      required this.date
      }
    );
    
      @override
      List<Object?> get props => [id, workout, date];
}