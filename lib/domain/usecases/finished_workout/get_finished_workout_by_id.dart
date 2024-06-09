import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/repositories/finished_workout_repository.dart';

class GetFinishedWorkoutById {

  final FinishedWorkoutRepository repository;

  GetFinishedWorkoutById(this.repository);

  Future<FinishedWorkout> call(int id) {
    return repository.getFinishedWorkoutById(id);
  }
}