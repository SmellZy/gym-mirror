import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/repositories/finished_workout_repository.dart';
part 'finished_workout_event.dart';
part 'finished_workout_state.dart';

class FinishedWorkoutBloc extends Bloc<FinishedWorkoutEvent, FinishedWorkoutState> {
  final FinishedWorkoutRepository finishedWorkoutRepository;

  FinishedWorkoutBloc(this.finishedWorkoutRepository) : super(FinishedWorkoutInitial()){
    on<GetFinishedWorkoutsEvent>(_onGetFinishedWorkouts);
    on<GetFinishedWorkoutEvent>(_onGetFinishedWorkout);
    on<CreateFinishedWorkoutEvent>(_onCreateFinishedWorkout);
    on<UpdateFinishedWorkoutEvent>(_onUpdateFinishedWorkout);
    on<DeleteFinishedWorkoutEvent>(_onDeleteFinishedWorkout);

  }
  
  Future<void> _onGetFinishedWorkouts(GetFinishedWorkoutsEvent event, Emitter<FinishedWorkoutState> emit) async {
    try {
      if (state is! FinishedWorkoutsLoaded) {
        emit(FinishedWorkoutLoading());
      }
      final List<FinishedWorkout> workout = await finishedWorkoutRepository.getFinishedWorkouts();
      emit(FinishedWorkoutsLoaded(workout));
    } catch (error) {
      emit(FinishedWorkoutError(error.toString()));
    }
  }

  Future<void> _onGetFinishedWorkout(GetFinishedWorkoutEvent event, Emitter<FinishedWorkoutState> emit) async {
    try {
      if (state is! FinishedWorkoutLoaded) {
        emit(FinishedWorkoutLoading());
      }
      final workout = await finishedWorkoutRepository.getFinishedWorkoutById(event.id);
      emit(FinishedWorkoutLoaded(workout));
    } catch (error) {
      emit(FinishedWorkoutError(error.toString()));
    }
  }

  Future<void> _onCreateFinishedWorkout(CreateFinishedWorkoutEvent event, Emitter<FinishedWorkoutState> emit) async {
    try {
      if (state is! FinishedWorkoutsLoaded) {
        emit(FinishedWorkoutCreating());
      }
      await finishedWorkoutRepository.createFinishedWorkout(event.workout);
      emit(FinishedWorkoutCreated());
      final List<FinishedWorkout> workouts = await finishedWorkoutRepository.getFinishedWorkouts();
      emit(FinishedWorkoutsLoaded(workouts));
    } catch (error) {
      emit(FinishedWorkoutError(error.toString()));
    }
  }

  Future<void> _onUpdateFinishedWorkout(UpdateFinishedWorkoutEvent event, Emitter<FinishedWorkoutState> emit) async {
    try {
      if (state is! FinishedWorkoutsLoaded) {
        emit(FinishedWorkoutUpdating());
      }
      await finishedWorkoutRepository.updateFinishedWorkout(event.workout);
      final List<FinishedWorkout> workouts = await finishedWorkoutRepository.getFinishedWorkouts();
      emit(FinishedWorkoutsLoaded(workouts));
    } catch (error) {
      emit(FinishedWorkoutError(error.toString()));
    }
  }

  Future<void> _onDeleteFinishedWorkout(DeleteFinishedWorkoutEvent event, Emitter<FinishedWorkoutState> emit) async {
    try {
      if (state is! FinishedWorkoutsLoaded) {
        emit(FinishedWorkoutDeleting());
      }
      await finishedWorkoutRepository.deleteFinishedWorkout(event.id);
      final List<FinishedWorkout> workouts = await finishedWorkoutRepository.getFinishedWorkouts();
      emit(FinishedWorkoutsLoaded(workouts));
    } catch (error) {
      emit(FinishedWorkoutError(error.toString()));
    }
  }
}
