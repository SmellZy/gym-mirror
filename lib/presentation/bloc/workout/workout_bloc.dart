import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;

  WorkoutBloc(this.workoutRepository) : super(WorkoutInitial()){
    on<GetWorkoutsEvent>(_onGetWorkouts);
    on<GetWorkoutEvent>(_onGetWorkout);
    on<CreateWorkoutEvent>(_onCreateWorkout);
    on<UpdateWorkoutEvent>(_onUpdateWorkout);
    on<DeleteWorkoutEvent>(_onDeleteWorkout);

  }
  
  Future<void> _onGetWorkouts(event, emit) async {
    try {
      emit(WorkoutLoading());
      final List<Workout> workout = await workoutRepository.getWorkouts();
      emit(WorkoutsLoaded(workout));
    } catch (error) {
      emit(WorkoutError(error.toString()));
    }
  }

  Future<void> _onGetWorkout(event, emit) async {
    try {
      emit(WorkoutLoading());
      final workout = await workoutRepository.getWorkoutById(event.id);
      emit(WorkoutLoaded(workout));
    } catch (error) {
      emit(WorkoutError(error.toString()));
    }
  }

  Future<void> _onCreateWorkout(event, emit) async {
    try {
      emit(WorkoutCreating());
      await workoutRepository.createWorkout(event.workout);
      final List<Workout> workouts = await workoutRepository.getWorkouts();
      emit(WorkoutsLoaded(workouts));
    } catch (error) {
      emit(WorkoutError(error.toString()));
    }
  }

  Future<void> _onUpdateWorkout(event, emit) async {
    try {
      emit(WorkoutUpdating());
      await workoutRepository.updateWorkout(event.workout);
      final List<Workout> workouts = await workoutRepository.getWorkouts();
      emit(WorkoutsLoaded(workouts));
    } catch (error) {
      emit(WorkoutError(error.toString()));
    }
  }

  Future<void> _onDeleteWorkout(event, emit) async {
    try {
      emit(WorkoutDeleting());
      await workoutRepository.deleteWorkout(event.id);
      final List<Workout> workouts = await workoutRepository.getWorkouts();
      emit(WorkoutsLoaded(workouts));
    } catch (error) {
      emit(WorkoutError(error.toString()));
    }
  }
}
