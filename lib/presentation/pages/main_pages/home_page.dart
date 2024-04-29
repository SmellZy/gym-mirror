import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/first_gradient.png"),
      child: SafeArea(
        child: Center(
          child: Text('Home Page'),
        ),
      )
    );
  }
}