import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';

@RoutePage()
class WikiPage extends StatefulWidget {
  const WikiPage({super.key,});


  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/first_gradient.png"),
      child: SafeArea(
        child: Center(
          child: Text('Wiki Page'),
        ),
      )
    );
  }
}