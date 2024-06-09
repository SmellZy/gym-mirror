import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/repositories/finished_workout_repository.dart';

class GetFinishedWorkouts {
  
  final FinishedWorkoutRepository repository;
  
  GetFinishedWorkouts(this.repository);

  Future<List<FinishedWorkout>> call() {
    return repository.getFinishedWorkouts();
  }
}