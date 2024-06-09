import 'package:gym_mirror/domain/entities/exercise.dart';

class ExercisesData{
 Exercise exercise1 = Exercise(
    id: 0,
    name: "Мельниця",
    description: "Вправа для тренування м'язів ніг, сідниць і спини.",
    repetitions: 20,
    sets: 3,
    restTime: 10,
    modelPath: "melnica");

 Exercise exercise2 = Exercise(
    id: 1,
    name: "Велосипед",
    description: "Вправа для тренування м'язів ніг, серцево-судинної системи.",
    repetitions: 15,
    sets: 3,
    restTime: 10,
    modelPath: "bicycle");
}
