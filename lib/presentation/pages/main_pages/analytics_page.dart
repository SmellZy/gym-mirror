import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';

@RoutePage()
class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/first_gradient.png"),
      child: SafeArea(
        child: Center(
          child: Text('Analytics Page'),
        ),
      )
    );
  }
}