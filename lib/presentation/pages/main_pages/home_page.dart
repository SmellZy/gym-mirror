import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/data/models/exercise/exercise_model.dart';
import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';
import 'package:gym_mirror/domain/usecases/workout/create_workout.dart';
import 'package:gym_mirror/domain/usecases/workout/get_workouts.dart';
import 'package:gym_mirror/presentation/bloc/exercise/exercise_bloc.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/bloc/workout/workout_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:o3d/o3d.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isBottomSheet = false;

class _HomePageState extends State<HomePage> {
  O3DController controller = O3DController();

  final _workoutBloc = WorkoutBloc(GetIt.I<WorkoutRepository>());
  final _exerciseBloc = ExerciseBloc(GetIt.I<ExerciseRepository>());

  @override
  void initState() {
    _workoutBloc.add(GetWorkoutsEvent());
    _exerciseBloc.add(LoadExercisesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/third_gradient.png"),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(seconds: 3),
                  child: isBottomSheet
                      ? const _topPanelSheetTrue()
                      : const _topPanelSheetFalse()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.56,
                width: MediaQuery.of(context).size.width,
                child: O3D.asset(
                  controller: controller,
                  src: "assets/models/body_anim.glb",
                  autoPlay: false,
                  loading: Loading.eager,
                  disableTap: true,
                  disableZoom: false,
                  cameraControls: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 28, 28, 64),
                      shadowColor: Colors.transparent,
                      animationDuration: const Duration(milliseconds: 0),
                      enableFeedback: false,
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      side: const BorderSide(
                        width: 1,
                        color: Color.fromARGB(102, 167, 167, 167),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isBottomSheet = true;
                      });
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => ModalSheetContainer(
                                exerciseBloc: _exerciseBloc,
                              )).then((_) => setState(() {
                            isBottomSheet = false;
                          }));
                    },
                    child: const Text(
                      "Start Workout",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Outer-Sans",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalSheetContainer extends StatefulWidget {
  const ModalSheetContainer({
    super.key,
    required this.exerciseBloc,
  });

  final ExerciseBloc exerciseBloc;

  @override
  State<ModalSheetContainer> createState() => _ModalSheetContainerState();
}

class _ModalSheetContainerState extends State<ModalSheetContainer> {
  final workoutBloc = WorkoutBloc(GetIt.I<WorkoutRepository>());
  @override
  void initState() {
    workoutBloc.add(GetWorkoutsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Stack(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select workout",
                style: TextStyle(fontFamily: "Outer-Sans", fontSize: 24),
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
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "You have not created workouts yet",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 107, 110, 113),
                                    borderRadius: BorderRadius.circular(15)),
                                child: ListTile(
                                  title: const Text("Create new workout"),
                                  trailing: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) =>
                                                CreateWorkoutModalSheet(
                                                  exerciseBloc:
                                                      widget.exerciseBloc,
                                                ));
                                      },
                                      icon: const Icon(Icons.add)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Column(
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
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: ListTile(
                                      title: Text(workout.title ?? ""),
                                      subtitle: Text(workout.description ?? ""),
                                      trailing: IconButton(icon: Icon(Icons.play_arrow),
                                      onPressed: () {}
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: Container(
                              width: 340,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 23, 101, 179),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                title: const Text("Create new workout", style: TextStyle(color: Colors.white, fontFamily: "Outer-Sans", fontSize: 18),),
                                trailing: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CreateWorkoutModalSheet(
                                                  exerciseBloc:
                                                      widget.exerciseBloc,
                                                ),
                                              ));
                                    },
                                    icon: Icon(Icons.add)),
                              ),
                            ),
                          )
                        ],
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

class CreateWorkoutModalSheet extends StatefulWidget {
  CreateWorkoutModalSheet({
    Key? key,
    required this.exerciseBloc,
  }) : super(key: key);

  final ExerciseBloc exerciseBloc;

  @override
  State<CreateWorkoutModalSheet> createState() =>
      _CreateWorkoutModalSheetState();
}

class _CreateWorkoutModalSheetState extends State<CreateWorkoutModalSheet> {
  List<Exercise> selectedExercises = [];
  final workoutBloc = WorkoutBloc(GetIt.I<WorkoutRepository>());

  String workoutName = "";
  Difficulty selectedDifficulty = Difficulty.easy;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // Adjusted height to accommodate new fields
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create workout",
                style: TextStyle(fontFamily: "Outer-Sans", fontSize: 24),
              )
            ],
          ),
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: widget.exerciseBloc),
              BlocProvider.value(value: workoutBloc),
            ],
            child: BlocListener<WorkoutBloc, WorkoutState>(
              listener: (context, state) {
                if (state is WrokoutCreated) {
                  print("Workout created successfully");
                  workoutBloc.add(GetWorkoutsEvent());
                  Navigator.pop(
                      context); // Close the modal sheet after creation
                } else if (state is WorkoutError) {
                  print("Workout creation failed: ${state.message}");
                }
              },
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BlocBuilder<ExerciseBloc, ExerciseState>(
                      builder: (context, state) {
                        if (state is ExercisesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ExercisesLoaded) {
                          if (state.exercises.isEmpty) {
                            return const Center(
                                child: Text(
                                    "Nothing")); // Centered text for empty state
                          } else {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        workoutName = value;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Workout Name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField<Difficulty>(
                                    value: selectedDifficulty,
                                    onChanged: (Difficulty? newValue) {
                                      setState(() {
                                        selectedDifficulty = newValue!;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Select Difficulty",
                                      border: OutlineInputBorder(),
                                    ),
                                    items: Difficulty.values
                                        .map((Difficulty difficulty) {
                                      return DropdownMenuItem<Difficulty>(
                                        value: difficulty,
                                        child: Text(difficulty
                                            .toString()
                                            .split('.')
                                            .last),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state.exercises.length,
                                    itemBuilder: (context, index) {
                                      final exercise = state.exercises[index];
                                      final isSelected =
                                          selectedExercises.contains(exercise);
                                      return ListTile(
                                        title: Text(exercise.name ?? ""),
                                        subtitle:
                                            Text(exercise.description ?? ""),
                                        trailing: IconButton(
                                          icon: isSelected
                                              ? const Icon(Icons.check_circle)
                                              : const Icon(
                                                  Icons.add_circle_outline),
                                          color:
                                              isSelected ? Colors.green : null,
                                          onPressed: () {
                                            setState(() {
                                              if (isSelected) {
                                                selectedExercises
                                                    .remove(exercise);
                                              } else {
                                                selectedExercises.add(exercise);
                                              }
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    gradient: SweepGradient(colors: [
                                      Colors.grey,
                                      Colors.black.withOpacity(0.4)
                                    ]),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Selected: ${selectedExercises.length}/${state.exercises.length}",
                                      style: const TextStyle(
                                          fontFamily: "Outer-Sans",
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: selectedExercises.isEmpty ||
                                          workoutName.isEmpty
                                      ? null
                                      : () {
                                          int nextId = (workoutBloc.state
                                                      is WorkoutsLoaded &&
                                                  (workoutBloc.state
                                                          as WorkoutsLoaded)
                                                      .workouts
                                                      .isNotEmpty)
                                              ? (workoutBloc.state
                                                          as WorkoutsLoaded)
                                                      .workouts
                                                      .last
                                                      .id +
                                                  1
                                              : 1;

                                          List<ExerciseModel> exerciseModels =
                                              selectedExercises
                                                  .map((exercise) =>
                                                      ExerciseModel.fromEntity(
                                                          exercise))
                                                  .toList();

                                          workoutBloc
                                              .add(CreateWorkoutEvent(Workout(
                                            id: nextId,
                                            title: workoutName,
                                            description:
                                                "Difficulty: ${selectedDifficulty.toString().split('.').last}",
                                            exercises: exerciseModels,
                                          )));
                                        },
                                  child: const Text("Create workout"),
                                ),
                              ],
                            );
                          }
                        }
                        return const Center(
                            child: Text(
                                "Nothing"));
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _topPanelSheetFalse extends StatelessWidget {
  const _topPanelSheetFalse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //main column
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Monday, ".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "April 23".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "day 21 - ".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w900),
                  ),
                  const Text(
                    "Leg Day",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w900),
                  )
                ],
              )
            ],
          ),
          const Icon(
            Icons.settings,
            color: Colors.white,
            size: 24,
          )
        ], // date row
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 28, 28, 30),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "16",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "Outer-Sans",
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Day Streak",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Outer-Sans",
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Record - 32",
                        style: TextStyle(
                            color: Color.fromARGB(255, 173, 173, 173),
                            fontSize: 10,
                            fontFamily: "Outer-Sans",
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Image.asset("assets/icons/flame_icon.png")
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 28, 28, 30),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4/7",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "Outer-Sans",
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Week goal",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Outer-Sans",
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Max Streak - 4",
                        style: TextStyle(
                            color: Color.fromARGB(255, 173, 173, 173),
                            fontSize: 10,
                            fontFamily: "Outer-Sans",
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Image.asset("assets/icons/note_icon.png")
                ],
              ),
            ),
          ),
        ], //day streak row
      ),
    ]);
  }
}

class _topPanelSheetTrue extends StatelessWidget {
  const _topPanelSheetTrue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //main column
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Monday, ".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "April, 23".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "day 21 - ".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w900),
                  ),
                  const Text(
                    "Leg Day",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.w900),
                  )
                ],
              )
            ],
          ),
          const Icon(
            Icons.settings,
            color: Colors.white,
            size: 24,
          )
        ], // date row
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
