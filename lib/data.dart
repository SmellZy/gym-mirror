import 'package:gym_mirror/domain/entities/exercise.dart';

class ExercisesData{
 Exercise exercise1 = Exercise(
    id: 0,
    name: "Присідання",
    description: "Вправа для тренування м'язів ніг, сідниць і спини.",
    repetitions: 15,
    sets: 4,
    restTime: 60,
    modelPath: "exercise2");

 Exercise exercise2 = Exercise(
    id: 1,
    name: "Велосипед",
    description: "Вправа для тренування м'язів ніг, серцево-судинної системи.",
    repetitions: 45,
    sets: 2,
    restTime: 30,
    modelPath: "exercise1");
}
