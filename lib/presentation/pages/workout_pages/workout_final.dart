import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/data/models/finished_workout/finished_workout_model.dart';
import 'package:gym_mirror/data/models/workout/workout_model.dart';
import 'package:gym_mirror/domain/entities/finished_workout.dart';
import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/finished_workout_repository.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';
import 'package:gym_mirror/presentation/bloc/finished_workout/finished_workout_bloc.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_mirror/router/router.dart';

@RoutePage()
class WorkoutFinalScreen extends StatefulWidget {
  const WorkoutFinalScreen({super.key, required this.workout});

  final Workout workout;

  @override
  State<WorkoutFinalScreen> createState() => _WorkoutFinalScreenState();
}

class _WorkoutFinalScreenState extends State<WorkoutFinalScreen> {
  final userBloc = UserBloc(GetIt.I<UserRepository>());
  final finishedWorkoutBloc =
      FinishedWorkoutBloc(GetIt.I<FinishedWorkoutRepository>());
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userBloc.add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userBloc,
        ),
        BlocProvider(
          create: (context) => finishedWorkoutBloc,
        ),
      ],
      child: Scaffold(
        body: BackgroundContainer(
          backgroundImage:
              const AssetImage("assets/background/third_gradient.png"),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoaded) {
                    final currentUser = state.user;
                    final List<FinishedWorkoutModel> workoutList =
                        List.from(state.user.workoutHistory ?? []);
                    final List<int> weightHistory =
                        List.from(state.user.weightHistory ?? []);
                    int dayStreak = state.user.dayStreak ?? 0;

                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Workout: ${widget.workout.title ?? ""}",
                                style: const TextStyle(
                                  fontFamily: "Outer-Sans",
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Successfully finished",
                            style: TextStyle(
                              fontFamily: "Outer-Sans",
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "*Please enter your weight\nafter workout",
                                style: TextStyle(
                                    fontFamily: "Outer-Sans",
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.clip),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                suffixText: "kg",
                                suffixStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: 25,
                                    fontFamily: "Outer-Sans",
                                    fontWeight: FontWeight.w200),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white.withOpacity(0.75))),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white.withOpacity(0.75))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.white.withOpacity(0.75))),
                                hintText: "Your weight",
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: 25,
                                    fontFamily: "Outer-Sans",
                                    fontWeight: FontWeight.w200),
                                hintMaxLines: 1,
                                hintTextDirection: TextDirection.ltr,
                              ),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontFamily: "Outer-Sans"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your weight";
                                }
                                final weight = int.tryParse(value);
                                if (weight == null) {
                                  return "Please enter a valid integer";
                                }
                                if (weight < 40 || weight > 250) {
                                  return "Please enter a weight between 40 and 250";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: deviceWidth * 0.4,
                              height: deviceHeight * 0.05,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xFF2c3135),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 106, 67, 172),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: Offset(10, 10),
                                    ),
                                    BoxShadow(
                                      color: Color.fromARGB(255, 74, 58, 104),
                                      spreadRadius: 7,
                                      blurRadius: 10,
                                      offset: Offset(0, 0),
                                    )
                                  ]),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    final weight =
                                        int.parse(_weightController.text);
                                    log(weight.toString());

                                    int nextId = (finishedWorkoutBloc.state
                                                is FinishedWorkoutsLoaded &&
                                            (finishedWorkoutBloc.state
                                                    as FinishedWorkoutsLoaded)
                                                .workouts
                                                .isNotEmpty)
                                        ? (finishedWorkoutBloc.state
                                                    as FinishedWorkoutsLoaded)
                                                .workouts
                                                .last
                                                .id +
                                            1
                                        : 1;

                                    final now = DateTime.now();
                                    final finishedDate = DateTime(
                                      now.year,
                                      now.month,
                                      now.day,
                                      now.hour,
                                      now.minute,
                                    );

                                    final workoutModel = WorkoutModel(
                                      id: widget.workout.id,
                                      title: widget.workout.title,
                                      description: widget.workout.description,
                                      calories: widget.workout.calories,
                                      duration: widget.workout.duration,
                                      difficulty: widget.workout.difficulty,
                                      exercises: widget.workout.exercises,
                                    );
                                    log(workoutModel.difficulty.toString());

                                    final finishedWorkout = FinishedWorkoutModel(
                                        id: nextId,
                                        workout: workoutModel,
                                        date: finishedDate);

                                    
                                    workoutList.add(finishedWorkout);
                                    log(finishedWorkout.date.toString());
                                    weightHistory.add(weight);
                                    dayStreak += 1;
                                    User user = User(
                                      id: currentUser.id,
                                      name: state.user.name,
                                      birthday: state.user.birthday,
                                      initialWeight: state.user.initialWeight,
                                      currentWeight: weight,
                                      goalWeight: state.user.goalWeight,
                                      height: state.user.height,
                                      dayStreak: dayStreak,
                                      fitnessLevel: state.user.fitnessLevel,
                                      workoutHistory: workoutList,
                                      weightHistory: weightHistory,
                                    );
                                    userBloc.add(UpdateUserEvent(user));
                                    userBloc.stream.listen((state) {
                                      if (state is UserLoading) {
                                        log("user updating");
                                      } else if (state is UserLoaded) {
                                        log("user updated successfully");
                                        AutoRouter.of(context).popAndPush(const MainRoute());
                                      } else if (state is UserError) {
                                        log(state.message);
                                      }
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  enableFeedback: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                child: const Text("Finish"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(
                        child: Text("Failed to load user data"));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
