part of 'exercise_bloc.dart';

abstract class ExerciseState extends Equatable {
  const ExerciseState();
  
  @override
  List<Object> get props => [];
}
//Initial state
class ExerciseInitial extends ExerciseState {}

//Loading states
class ExerciseLoading extends ExerciseState {}
class ExercisesLoading extends ExerciseState {}
class ExerciseCreating extends ExerciseState {}
class ExerciseUpdating extends ExerciseState {}
class ExerciseDeleting extends ExerciseState {}

//Loaded states
class ExerciseLoaded extends ExerciseState {
  final Exercise exercise;

  const ExerciseLoaded(this.exercise);

  @override
  List<Object> get props => [exercise];
}

class ExercisesLoaded extends ExerciseState {
  final List<Exercise> exercises;

  const ExercisesLoaded(this.exercises);

  @override
  List<Object> get props => [exercises];
}

//Error states
class ExerciseError extends ExerciseState {
  final String message;

  const ExerciseError(this.message);

  @override
  List<Object> get props => [message];
}

