import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';
import 'package:gym_mirror/presentation/bloc/workout/workout_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:gym_mirror/presentation/widgets/create_workout_modal_sheet.dart';

@RoutePage()
class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final workoutBloc = WorkoutBloc(GetIt.I<WorkoutRepository>());

  @override
  void initState() {
    super.initState();
    workoutBloc.add(GetWorkoutsEvent());
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
      return Color.fromARGB(255, 169, 169, 169); // Default color
  }
}

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BackgroundContainer(
        backgroundImage:
            const AssetImage("assets/background/first_gradient.png"),
        child: SafeArea(
          child: BlocProvider(
            create: (context) => workoutBloc,
            child: BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                if (state is WorkoutsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WorkoutsLoaded) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 2, color: Colors.grey),
                          ),
                          child: Text(
                            state.workouts.isEmpty
                                ? "No workouts available"
                                : "Available Workouts",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Outer-Sans",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (state.workouts.isNotEmpty)
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.workouts.length,
                                  itemBuilder: (context, index) {
                                    final workout = state.workouts[index];
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                              //color: Colors.grey.withOpacity(0.3),
                                          gradient:  LinearGradient(
                                            colors: [
                                              Colors.grey.withOpacity(0.3),
                                              Color.fromARGB(255, 80, 29, 220).withOpacity(0.3),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.05)
                                                    .withOpacity(0.03),
                                                offset: const Offset(-10, -10),
                                                spreadRadius: 0,
                                                blurRadius: 10),
                                            BoxShadow(
                                                color: Colors.black87
                                                    .withOpacity(0.3),
                                                offset: const Offset(10, 10),
                                                spreadRadius: 0,
                                                blurRadius: 10)
                                          ]),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            // Handle workout selection
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor: Colors.transparent,
                                          enableFeedback: false,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Container(
                                            height: 120,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                            "Exercise count",
                                                            style: TextStyle(
                                                              color: Color.fromARGB(255, 195, 197, 168),
                                                              fontSize: 18,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontFamily:
                                                                  "Outer-Sans",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${workout.exercises?.length ?? 0}",
                                                            style:
                                                                const TextStyle(
                                                              color: Color.fromARGB(255, 221, 227, 137),
                                                              fontSize: 18,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontFamily:
                                                                  "Outer-Sans",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            "Difficulty",
                                                            style: TextStyle(
                                                              color: Color.fromARGB(255, 195, 197, 168),
                                                              fontSize: 18,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontFamily:
                                                                  "Outer-Sans",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${workout.difficulty}",
                                                            style:
                                                                 TextStyle(
                                                              color: _getColorForDifficulty(workout.difficulty ?? "Easy"),
                                                              fontSize: 18,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                      fontFamily:
                                                                  "Outer-Sans",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: deviceHeight * 0.08),
                        child: Container(
                          color: Colors.transparent,
                          width: deviceWidth * 0.8,
                          height: deviceHeight * 0.045,
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return CreateWorkoutModalSheet(
                                      workoutBloc: workoutBloc);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 83, 145, 207),
                              enableFeedback: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Create new workout",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Outer-Sans",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("Error"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
