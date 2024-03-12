import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';

class GetWorkoutById {

  final WorkoutRepository repository;

  GetWorkoutById(this.repository);

  Future<Workout> call(int id) {
    return repository.getWorkoutById(id);
  }
}