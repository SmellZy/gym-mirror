import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';

class GetWorkouts {
  
  final WorkoutRepository repository;
  
  GetWorkouts(this.repository);

  Future<List<Workout>> call() {
    return repository.getWorkouts();
  }
}