import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/data/models/exercise/exercise_model.dart';
import 'package:gym_mirror/domain/entities/exercise.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/domain/repositories/exercise_repository.dart';
import 'package:gym_mirror/domain/repositories/workout_repository.dart';
import 'package:gym_mirror/presentation/bloc/exercise/exercise_bloc.dart';
import 'package:gym_mirror/presentation/bloc/workout/workout_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CreateWorkoutModalSheet extends StatefulWidget {
  final WorkoutBloc workoutBloc;
  CreateWorkoutModalSheet({
    Key? key,
    required this.workoutBloc,
  }) : super(key: key);

  @override
  State<CreateWorkoutModalSheet> createState() =>
      _CreateWorkoutModalSheetState();
}

class _CreateWorkoutModalSheetState extends State<CreateWorkoutModalSheet> {
  List<Exercise> selectedExercises = [];
  final exerciseBloc = ExerciseBloc(GetIt.I<ExerciseRepository>());

  String workoutName = "";
  Difficulty selectedDifficulty = Difficulty.easy;

  @override
  void initState() {
    super.initState();
    exerciseBloc.add(GetExercisesEvent());
  }

  String difficultyToString(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return "Easy";
      case Difficulty.medium:
        return "Medium";
      case Difficulty.hard:
        return "Hard";
      case Difficulty.expert:
        return "Expert";
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.85,
      decoration: BoxDecoration(
          color: const Color(0xFF2c3135),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          border: Border.all(
              color: const Color.fromARGB(255, 72, 72, 72), width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create workout",
                  style: TextStyle(
                      fontFamily: "Outer-Sans",
                      fontSize: 24,
                      color: Color.fromARGB(255, 213, 211, 211),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: exerciseBloc),
                BlocProvider.value(value: widget.workoutBloc),
              ],
              child: BlocListener<WorkoutBloc, WorkoutState>(
                listener: (context, state) {
                  if (state is WorkoutCreated) {
                    widget.workoutBloc.add(GetWorkoutsEvent());
                    Navigator.pop(context);
                  } else if (state is WorkoutError) {
                    log("Workout creation failed: ${state.message}");
                  }
                },
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<ExerciseBloc, ExerciseState>(
                      builder: (context, state) {
                        if (state is ExercisesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ExercisesLoaded) {
                          if (state.exercises.isEmpty) {
                            return const Center(child: Text("Nothing"));
                          } else {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF2c3135),
                                        borderRadius: BorderRadius.circular(20),
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: TextField(
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        onChanged: (value) {
                                          setState(() {
                                            workoutName = value;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Workout title",
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF2c3135),
                                        borderRadius: BorderRadius.circular(20),
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
                                    child: DropdownButtonFormField<Difficulty>(
                                      dropdownColor: const Color(0xFF2c3135),
                                      value: selectedDifficulty,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      onChanged: (Difficulty? newValue) {
                                        setState(() {
                                          selectedDifficulty = newValue!;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Workout difficulty",
                                        labelStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      items: Difficulty.values
                                          .map((Difficulty difficulty) {
                                        return DropdownMenuItem<Difficulty>(
                                          value: difficulty,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                margin: const EdgeInsets.only(
                                                    right: 8),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: difficulty ==
                                                          Difficulty.easy
                                                      ? Colors.green
                                                      : difficulty ==
                                                              Difficulty.medium
                                                          ? Colors.orange
                                                          : difficulty ==
                                                                  Difficulty
                                                                      .hard
                                                              ? Colors.red
                                                              : Colors.purple,
                                                ),
                                              ),
                                              Text(
                                                difficulty
                                                    .toString()
                                                    .split('.')
                                                    .last
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: deviceHeight * 0.13,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF2c3135),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white
                                                      .withOpacity(0.05)
                                                      .withOpacity(0.03),
                                                  offset:
                                                      const Offset(-10, -10),
                                                  spreadRadius: 0,
                                                  blurRadius: 10),
                                              BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.3),
                                                  offset: const Offset(10, 10),
                                                  spreadRadius: 0,
                                                  blurRadius: 10)
                                            ]),
                                      ),
                                      MultiSelectDropDown(
                                        selectionType: SelectionType.multi,
                                        chipConfig: const ChipConfig(
                                            wrapType: WrapType.scroll,
                                            backgroundColor: Color.fromARGB(255, 63, 71, 77),
                                            radius: 10,
                                            labelColor: Colors.grey,
                                            ),
                                            clearIcon: Icon(Icons.close_outlined, size: 20, color: Colors.grey,),
                                            suffixIcon: Icon(Icons.arrow_drop_down, size: 26, color: Colors.grey,),
                                        dropdownHeight: 100,
                                        optionTextStyle: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: "Outer-Sans"),
                                        selectedOptionIcon:
                                            const Icon(Icons.check_circle),
                                        fieldBackgroundColor:
                                            Colors.transparent,
                                        dropdownBackgroundColor:
                                            const Color(0xFF2c3135),
                                        borderRadius: 20,
                                        borderColor: Colors.transparent,
                                        selectedOptionTextColor:
                                            const Color(0xFF2c3135),
                                        selectedOptionBackgroundColor:
                                            const Color.fromARGB(
                                                255, 89, 97, 104),
                                        optionsBackgroundColor:
                                            const Color.fromARGB(
                                                255, 70, 77, 83),
                                        hint: "Select exercises",
                                        hintStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                        padding: const EdgeInsets.all(8),
                                        dropdownBorderRadius: 20,
                                        onOptionSelected: (options) {
                                          debugPrint(options.toString());
                                          selectedExercises = options
                                              .map((option) =>
                                                  Exercise(id: option.value!))
                                              .toList();
                                          log(selectedExercises.toString());
                                        },
                                        onOptionRemoved: (index, option) =>
                                            setState(() {
                                          selectedExercises.removeWhere(
                                              (exercise) =>
                                                  exercise.id == option.value);
                                        }),
                                        options: state.exercises
                                            .map((exercise) => ValueItem(
                                                label: exercise.name ?? '',
                                                value: exercise.id))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  width: deviceWidth * 0.7,
                                  height: deviceHeight * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          selectedExercises.isEmpty ||
                                                  workoutName.isEmpty
                                              ? Colors.grey
                                              : const Color.fromARGB(
                                                  255, 7, 119, 230),
                                          selectedExercises.isEmpty ||
                                                  workoutName.isEmpty
                                              ? Colors.grey
                                              : Colors.blue,
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
                                            color:
                                                Colors.black87.withOpacity(0.3),
                                            offset: const Offset(10, 10),
                                            spreadRadius: 0,
                                            blurRadius: 10)
                                      ]),
                                  child: ElevatedButton(
                                    onPressed: selectedExercises.isEmpty ||
                                            workoutName.isEmpty
                                        ? null
                                        : () {
                                            int nextId = (widget
                                                            .workoutBloc.state
                                                        is WorkoutsLoaded &&
                                                    (widget.workoutBloc.state
                                                            as WorkoutsLoaded)
                                                        .workouts
                                                        .isNotEmpty)
                                                ? (widget.workoutBloc.state
                                                            as WorkoutsLoaded)
                                                        .workouts
                                                        .last
                                                        .id +
                                                    1
                                                : 1;

                                            List<ExerciseModel> exerciseModels =
                                                selectedExercises
                                                    .map((exercise) =>
                                                        ExerciseModel
                                                            .fromEntity(
                                                                exercise))
                                                    .toList();

                                            widget.workoutBloc
                                                .add(CreateWorkoutEvent(Workout(
                                              id: nextId,
                                              title: workoutName,
                                              difficulty: difficultyToString(
                                                  selectedDifficulty),
                                              description: "",
                                              exercises: exerciseModels,
                                            )));
                                            log(nextId.toString());
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: const Text("Create workout", 
                                    style: TextStyle(color: Colors.white, fontFamily: "Outer-Sans", fontSize: 22, fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return const Center(child: Text("Nothing"));
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
