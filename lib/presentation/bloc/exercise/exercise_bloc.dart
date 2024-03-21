import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository exerciseRepository;


  ExerciseBloc(this.exerciseRepository) : super(ExerciseInitial()) {
    on<LoadExercisesEvent>(_onLoadExercises);
    on<GetExercisesEvent>(_onGetExercises);
    on<GetExerciseEvent>(_onGetExercise);
    on<CreateExerciseEvent>(_onCreateExercise);
    on<UpdateExerciseEvent>(_onUpdateExercise);
    on<DeleteExerciseEvent>(_onDeleteExercise);
  }

  Future<void> _onLoadExercises(event, emit) async {
    try {
      emit(ExerciseLoading());
      final List<Exercise> exercises = await exerciseRepository.loadExercises();
      emit(ExercisesLoaded(exercises));
    } catch (error) {
      emit(ExerciseError(error.toString()));
    }
  }

  Future<void> _onGetExercises(event, emit) async {
    try {
      emit(ExerciseLoading());
      final List<Exercise> exercises = await exerciseRepository.getExercises();
      emit(ExercisesLoaded(exercises));
    } catch (error) {
      emit(ExerciseError(error.toString()));
    }
  }

  Future<void> _onGetExercise(event, emit) async {
    try {
      emit(ExerciseLoading());
      final Exercise exercise = await exerciseRepository.getExerciseById(event.id);
      emit(ExerciseLoaded(exercise));
    } catch (error) {
      emit(ExerciseError(error.toString()));
    }
  }

  Future<void> _onCreateExercise(event, emit) async {
    try {
      emit(ExerciseCreating());
      await exerciseRepository.createExercise(event.exercise);
      final List<Exercise> exercises = await exerciseRepository.getExercises();
      emit(ExercisesLoaded(exercises));
    } catch (error) {
      emit(ExerciseError(error.toString()));
    }
  }

  Future<void> _onUpdateExercise(event, emit) async {
    try {
      emit(ExerciseUpdating());
      await exerciseRepository.updateExercise(event.exercise);
      final List<Exercise> exercises = await exerciseRepository.getExercises();
      emit(ExercisesLoaded(exercises));
    } catch (error) {
      emit(ExerciseError(error.toString()));
    }
  }

  Future<void> _onDeleteExercise(event, emit) async {
    try {
      emit(ExerciseDeleting());
      await exerciseRepository.deleteExercise(event.id);
      final List<Exercise> exercises = await exerciseRepository.getExercises();
      emit(ExercisesLoaded(exercises));
    } catch (error) {
      emit(ExerciseError(error.toString()));
    }
  }
}
