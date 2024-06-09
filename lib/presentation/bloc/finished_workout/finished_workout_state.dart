part of 'finished_workout_bloc.dart';
abstract class FinishedWorkoutState extends Equatable {
  const FinishedWorkoutState();

  @override
  List<Object> get props => [];
}

// Initial State
class FinishedWorkoutInitial extends FinishedWorkoutState {}

// Loading States
class FinishedWorkoutsLoading extends FinishedWorkoutState {}
class FinishedWorkoutLoading extends FinishedWorkoutState {}
class FinishedWorkoutUpdating extends FinishedWorkoutState {}
class FinishedWorkoutCreating extends FinishedWorkoutState {}
class FinishedWorkoutDeleting extends FinishedWorkoutState {}

class FinishedWorkoutCreated extends FinishedWorkoutState {}
// Loaded States
class FinishedWorkoutsLoaded extends FinishedWorkoutState {
  final List<FinishedWorkout> workouts;

  const FinishedWorkoutsLoaded(this.workouts);

  @override
  List<Object> get props => [workouts];
}

class FinishedWorkoutLoaded extends FinishedWorkoutState {
  final FinishedWorkout workout;

  const FinishedWorkoutLoaded(this.workout);

  @override
  List<Object> get props => [workout];
}

// Error States
class FinishedWorkoutError extends FinishedWorkoutState {
  final String message;

  const FinishedWorkoutError(this.message);

  @override
  List<Object> get props => [message];
}
