import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/presentation/pages/enter_name_screen.dart';
import 'package:gym_mirror/presentation/pages/greeting_screen.dart';
import 'package:gym_mirror/presentation/pages/home_screen.dart';
import 'package:gym_mirror/presentation/pages/splash_screen.dart';
import 'package:gym_mirror/presentation/pages/test_anim_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: "/",
      initial: true
      ),
    CustomRoute(
      page: GreetingRoute.page,
      path: "/greeting",
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 0
      ),
    CustomRoute(
      page: EnterNameRoute.page,
      path: "/createUserName",
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 1000
      ),
    CustomRoute(
      page: AnimationRoute.page,
      path: "/animTest",
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 2000
      ),
    CustomRoute(
      page: HomeRoute.page, 
      path: "/home",
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade
      ), 
  ];
}