import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';

@RoutePage()
class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/first_gradient.png"),
      child: SafeArea(
        child: Center(
          child: Text('Workout Page'),
        ),
      )
    );
  }
}