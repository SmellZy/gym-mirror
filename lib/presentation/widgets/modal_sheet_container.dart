import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';
import 'package:gym_mirror/presentation/bloc/exercise/exercise_bloc.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/bloc/workout/workout_bloc.dart';
import 'package:gym_mirror/router/router.dart';

class ModalSheetContainer extends StatefulWidget {
  const ModalSheetContainer({
    super.key,
    required this.exerciseBloc, required this.userBloc,
  });

  final ExerciseBloc exerciseBloc;
  final UserBloc userBloc;

  @override
  State<ModalSheetContainer> createState() => _ModalSheetContainerState();
}

class _ModalSheetContainerState extends State<ModalSheetContainer> {
  final workoutBloc = WorkoutBloc(GetIt.I<WorkoutRepository>());
  Workout? selectedWorkout;

  @override
  void initState() {
    workoutBloc.add(GetWorkoutsEvent());
    super.initState();
  }

  Color _getColorForDifficulty(String difficulty) {
  switch (difficulty) {
    case 'Easy':
      return Colors.green;
    case 'Medium':
      return Colors.yellow;
    case 'Hard':
      return Colors.red;
    case 'Expert':
      return Colors.purple;
    default:
      return const Color.fromARGB(255, 169, 169, 169); // Default color
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      decoration: BoxDecoration(
          color: const Color(0xFF2c3135),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          border: Border.all(
              color: const Color.fromARGB(255, 72, 72, 72), width: 2)),
      child: Stack(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Select workout",
                  style: TextStyle(
                      fontFamily: "Outer-Sans",
                      fontSize: 24,
                      color: Color.fromARGB(255, 213, 211, 211),
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          BlocProvider(
            create: (context) => workoutBloc,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 25, left: 8, right: 8, bottom: 8),
              child: BlocBuilder<WorkoutBloc, WorkoutState>(
                builder: (context, state) {
                  if (state is WorkoutLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WorkoutsLoaded) {
                    if (state.workouts.isEmpty) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 30,),
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "You have not created workouts yet",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 140,),
                              Container(
                                  width: 340,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 23, 101, 179),
                                      borderRadius:
                                          BorderRadius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      AutoRouter.of(context).push(WorkoutRoute());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 23, 101, 179),
                                      enableFeedback: false,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    child: const Text(
                                      "Create new workout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Outer-Sans",
                                          fontSize: 18),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              child: SizedBox(
                                height: 350,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.workouts.length,
                                  itemBuilder: (context, index) {
                                    final workout = state.workouts[index];
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          top: 15,
                                          left: 5,
                                          right: 5,
                                          bottom: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          color: const Color(0xFF2c3135),
                                          boxShadow: selectedWorkout == workout
                                              ? [
                                                  const BoxShadow(
                                                    color: Color.fromARGB(255, 106, 67, 172),
                                                    spreadRadius: 4,
                                                    blurRadius: 10,
                                                    offset:  Offset(
                                                          10, 10),
                                                  ),
                                                  const BoxShadow(
                                                    color: Color.fromARGB(255, 74, 58, 104),
                                                    spreadRadius: 7,
                                                    blurRadius: 10,
                                                    offset:  Offset(
                                                          0, 0),
                                                  )
                                                ]
                                              : [
                                                  BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.05)
                                                          .withOpacity(0.03),
                                                      offset: const Offset(
                                                          -10, -10),
                                                      spreadRadius: 0,
                                                      blurRadius: 10),
                                                  BoxShadow(
                                                      color: Colors.black87
                                                          .withOpacity(0.3),
                                                      offset: const Offset(
                                                          10, 10),
                                                      spreadRadius: 0,
                                                      blurRadius: 10)
                                                ]),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (selectedWorkout == workout) {
                                                selectedWorkout = null;
                                              } else {
                                                selectedWorkout = workout;
                                              }
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(0),
                                            backgroundColor: Colors.transparent,
                                            enableFeedback: false,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8),
                                            child: Container(
                                              height: 80,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/workout_logo.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        workout.title ?? "",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "Outer-Sans",
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Text(
                                                        workout.description ??
                                                            "",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Outer-Sans",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text("${workout.difficulty}",
                                                        style:  TextStyle(
                                                          color: _getColorForDifficulty(workout.difficulty ?? "Easy"),
                                                            fontFamily:
                                                                "Outer-Sans",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Text(
                                                        "Exercises: ${workout.exercises?.length ?? 0}",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "Outer-Sans",
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            overflow:
                                                                TextOverflow
                                                                    .visible),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ElevatedButton(
                                onPressed: selectedWorkout != null
                                    ? () {
                                      log(selectedWorkout.toString());
                                        Navigator.pop(context);
                                        AutoRouter.of(context).push(
                                            WorkoutInitialRoute(workout: selectedWorkout!));
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 23, 101, 179),
                                  enableFeedback: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                child: Text(
                                  selectedWorkout != null
                                      ? "Start workout"
                                      : "Select a workout",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Outer-Sans",
                                      fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }
                  return const Text("nothing");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
