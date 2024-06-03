part of 'workout_bloc.dart';
abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

// Initial State
class WorkoutInitial extends WorkoutState {}

// Loading States
class WorkoutsLoading extends WorkoutState {}
class WorkoutLoading extends WorkoutState {}
class WorkoutUpdating extends WorkoutState {}
class WorkoutCreating extends WorkoutState {}
class WorkoutDeleting extends WorkoutState {}

class WrokoutCreated extends WorkoutState {}
// Loaded States
class WorkoutsLoaded extends WorkoutState {
  final List<Workout> workouts;

  const WorkoutsLoaded(this.workouts);

  @override
  List<Object> get props => [workouts];
}

class WorkoutLoaded extends WorkoutState {
  final Workout workout;

  const WorkoutLoaded(this.workout);

  @override
  List<Object> get props => [workout];
}

// Error States
class WorkoutError extends WorkoutState {
  final String message;

  const WorkoutError(this.message);

  @override
  List<Object> get props => [message];
}
