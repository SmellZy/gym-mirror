part of 'exercise_bloc.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}
// Event to Load Exercises from JSON
class LoadExercisesEvent extends ExerciseEvent {}


// Event to Get All Exercises
class GetExercisesEvent extends ExerciseEvent {}
 //Event to Get a Specific Exercise by ID
class GetExerciseEvent extends ExerciseEvent {
  final int id;

  const GetExerciseEvent(this.id);

  @override
  List<Object> get props => [id];
}

// Event to Create a New Exercise
class CreateExerciseEvent extends ExerciseEvent {
  final Exercise exercise;

  const CreateExerciseEvent(this.exercise);

  @override
  List<Object> get props => [exercise];
}

// Event to Update an Existing Exercise
class UpdateExerciseEvent extends ExerciseEvent {
  final Exercise exercise;

  const UpdateExerciseEvent(this.exercise);

  @override
  List<Object> get props => [exercise];
}

//Event to Delete an Exercise by ID
class DeleteExerciseEvent extends ExerciseEvent {
  final int id;

  const DeleteExerciseEvent(this.id);

  @override
  List<Object> get props => [id];
}