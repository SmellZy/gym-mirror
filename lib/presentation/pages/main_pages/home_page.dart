import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/data.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';
import 'package:gym_mirror/presentation/bloc/exercise/exercise_bloc.dart';
import 'package:gym_mirror/presentation/bloc/workout/workout_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:gym_mirror/presentation/widgets/modal_sheet_container.dart';
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
  final exercisesData = ExercisesData();

  @override
  void initState() {
    _workoutBloc.add(GetWorkoutsEvent());
    _exerciseBloc.add(CreateExerciseEvent(exercisesData.exercise1));
    _exerciseBloc.add(CreateExerciseEvent(exercisesData.exercise2));
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
