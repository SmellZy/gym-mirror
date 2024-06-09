part of 'finished_workout_bloc.dart';
abstract class FinishedWorkoutEvent extends Equatable {
  const FinishedWorkoutEvent();

  @override
  List<Object> get props => [];
}

// Event to Get All Workouts
class GetFinishedWorkoutsEvent extends FinishedWorkoutEvent {}

// Event to Get a Specific Workout by ID
class GetFinishedWorkoutEvent extends FinishedWorkoutEvent {
  final int id;

  const GetFinishedWorkoutEvent(this.id);

  @override
  List<Object> get props => [id];
}

// Event to Create a New Workout
class CreateFinishedWorkoutEvent extends FinishedWorkoutEvent {
  final FinishedWorkout workout;

  const CreateFinishedWorkoutEvent(this.workout);

  @override
  List<Object> get props => [workout];
}

// Event to Update an Existing Workout
class UpdateFinishedWorkoutEvent extends FinishedWorkoutEvent {
  final FinishedWorkout workout;

  const UpdateFinishedWorkoutEvent(this.workout);

  @override
  List<Object> get props => [workout];
}

// Event to Delete a Workout by ID
class DeleteFinishedWorkoutEvent extends FinishedWorkoutEvent {
  final int id;

  const DeleteFinishedWorkoutEvent(this.id);

  @override
  List<Object> get props => [id];
}
