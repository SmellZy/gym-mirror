import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userBloc = UserBloc(GetIt.I<UserRepository>());

  getUserInfo() {
    _userBloc.add(GetUserEvent());
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        backgroundImage: AssetImage("assets/background/first_gradient.png"),
        child: SafeArea(
          child: Center(
              child: BlocBuilder<UserBloc, UserState>(
            bloc: _userBloc,
            builder: (context, state) {
              if (state is UserLoaded) {
                return Text(state.user.name!);
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
        ),
      ),
    );
  }
}
