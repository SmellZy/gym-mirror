import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';
import 'package:gym_mirror/presentation/bloc/exercise/exercise_bloc.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:gym_mirror/router/router.dart';
import 'package:o3d/o3d.dart';

@RoutePage()
class WorkoutInitialScreen extends StatefulWidget {
  const WorkoutInitialScreen({super.key, required this.workout,});

  final Workout workout;

  @override
  State<WorkoutInitialScreen> createState() => _WorkoutInitialScreenState();
}

class _WorkoutInitialScreenState extends State<WorkoutInitialScreen> {
  O3DController controller = O3DController();
  bool isPaused = false;
  int initialIndex = 0;
  int initialSetIndex = 1;
  List<Exercise> exercises = [];
  bool isBlurred = true;
  int countdown = 0;
  Timer? timer;

  final exerciseBloc = ExerciseBloc(GetIt.I<ExerciseRepository>());
  final userBloc = UserBloc(GetIt.I<UserRepository>());

  @override
  void initState() {
    super.initState();
    _mapExercises();
    _startUnblurTimer(Duration(seconds: 3));
    Timer(Duration(seconds: 3), () {if (exercises.isNotEmpty && exercises.first.modelPath == "bicycle") {
    controller.cameraTarget(0.2, 0.3, -0.1);
    controller.cameraOrbit(35, 45, 90);
  }});
  }

  void _mapExercises() {
    setState(() {
      exercises = widget.workout.exercises!.map((exerciseModel) {
        return Exercise(
            id: exerciseModel.id,
            name: exerciseModel.name,
            description: exerciseModel.description,
            repetitions: exerciseModel.repetitions,
            sets: exerciseModel.sets,
            restTime: exerciseModel.restTime,
            modelPath: exerciseModel.modelPath);
      }).toList();
      log(exercises.toString());
    });
  }

  void _startUnblurTimer(Duration duration) {
    setState(() {
      countdown = duration.inSeconds;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          isBlurred = false;
          timer.cancel();
          controller.play();
        }
      });
    });
  }

  void _startBlurredTimer(int duration) {
    setState(() {
      isBlurred = true;
      countdown = duration;
    });

    _startUnblurTimer(Duration(seconds: duration));
  }

  void _nextExercise() {
    if (initialSetIndex == exercises[initialIndex].sets) {
      if (initialIndex + 1 < exercises.length) {
        setState(() {
          controller.cameraTarget(0, 1, 0);
          controller.cameraOrbit(0, 75, 105);
          initialIndex++;
          initialSetIndex = 1;
        });
      } else {
        AutoRouter.of(context).push(WorkoutFinalRoute(workout: widget.workout));
        return;
      }
    } else {
      setState(() {
        initialSetIndex++;
      });
    }

    setState(() {
      if (exercises[initialIndex].modelPath != "bicycle") {
        
      }
      controller.animationName = exercises[initialIndex].modelPath;
      _startBlurredTimer(exercises[initialIndex].restTime!);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundContainer(
            backgroundImage: const AssetImage("assets/background/third_gradient.png"),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.workout.title.toString(),
                                style: const TextStyle(
                                  fontFamily: "Outer-Sans",
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                exercises.isNotEmpty
                                    ? exercises[initialIndex].name ?? ""
                                    : "",
                                style: const TextStyle(
                                    fontFamily: "Outer-Sans",
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Repetitions: ${exercises.isNotEmpty ? exercises[initialIndex].repetitions ?? "" : ""}",
                                style: const TextStyle(
                                    fontFamily: "Outer-Sans",
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sets: ${initialSetIndex} /${exercises.isNotEmpty ? exercises[initialIndex].sets ?? "" : ""}",
                                style: const TextStyle(
                                    fontFamily: "Outer-Sans",
                                    color: Color.fromARGB(255, 121, 156, 208),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            widget.workout.description ?? "",
                            style: const TextStyle(
                              fontFamily: "Outer-Sans",
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(
                            width: deviceWidth,
                            height: deviceHeight * 0.56,
                            child: O3D.asset(
                              src: "assets/models/test_both_anim.glb",
                              controller: controller,
                              animationName: exercises.isNotEmpty
                                  ? exercises[initialIndex].modelPath ?? ""
                                  : "",
                              autoPlay: false,
                              disableTap: true,
                              disablePan: true,
                              disableZoom: true,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            width: deviceWidth * 0.9,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    AutoRouter.of(context).popUntilRoot();
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    size: 55,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isPaused) {
                                        controller.play();
                                        isPaused = false;
                                      } else {
                                        controller.pause();
                                        isPaused = true;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.pause,
                                    size: 55,
                                    color: isPaused ? Colors.green : Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: _nextExercise,
                                  icon: const Icon(
                                    Icons.skip_next,
                                    size: 55,
                                    color: Color.fromARGB(255, 31, 212, 37),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isBlurred) ...[
            // Timer overlay
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      initialSetIndex == 1 ? "Starting workout in:" : "Next exercise in:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$countdown",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
