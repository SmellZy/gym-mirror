part of 'workout_bloc.dart';
abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

// Event to Get All Workouts
class GetWorkoutsEvent extends WorkoutEvent {}

// Event to Get a Specific Workout by ID
class GetWorkoutEvent extends WorkoutEvent {
  final int id;

  const GetWorkoutEvent(this.id);

  @override
  List<Object> get props => [id];
}

// Event to Create a New Workout
class CreateWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  const CreateWorkoutEvent(this.workout);

  @override
  List<Object> get props => [workout];
}

// Event to Update an Existing Workout
class UpdateWorkoutEvent extends WorkoutEvent {
  final Workout workout;

  const UpdateWorkoutEvent(this.workout);

  @override
  List<Object> get props => [workout];
}

// Event to Delete a Workout by ID
class DeleteWorkoutEvent extends WorkoutEvent {
  final int id;

  const DeleteWorkoutEvent(this.id);

  @override
  List<Object> get props => [id];
}
