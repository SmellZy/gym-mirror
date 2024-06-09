import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/domain/entities/workout.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/pages/greeting_pages/greeting_first_screen.dart';
import 'package:gym_mirror/presentation/pages/greeting_pages/greeting_second_screen.dart';
import 'package:gym_mirror/presentation/pages/greeting_pages/greeting_third_screen.dart';
import 'package:gym_mirror/presentation/pages/main_pages/analytics_page.dart';
import 'package:gym_mirror/presentation/pages/main_pages/home_page.dart';
import 'package:gym_mirror/presentation/pages/main_pages/wiki_page.dart';
import 'package:gym_mirror/presentation/pages/main_pages/workout_page.dart';
import 'package:gym_mirror/presentation/pages/onboarding_screen.dart';
import 'package:gym_mirror/presentation/pages/greeting_screen.dart';
import 'package:gym_mirror/presentation/pages/main_screen.dart';
import 'package:gym_mirror/presentation/pages/splash_screen.dart';
import 'package:gym_mirror/presentation/pages/workout_pages/workout_final.dart';
import 'package:gym_mirror/presentation/pages/workout_pages/workout_initial.dart';
//import 'package:gym_mirror/presentation/pages/test_anim_screen.dart';
import 'package:gym_mirror/router/guard/onboarding_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: "/",
      initial: true,
      ),
    CustomRoute(
      page: GreetingRoute.page,
      path: "/greeting",
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 0,
      children: [
        AutoRoute(
          page: GreetingFirstRoute.page,
          path: "first"
        ),
        AutoRoute(
          page: GreetingSecondRoute.page,
          path: "second"
        ),
        AutoRoute(
          page: GreetingThirdRoute.page,
          path: "third"
        ),
      ]
      
      ),
    CustomRoute(
      page: OnboardingRoute.page,
      path: "/createUserName",
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 1000,
      ),
    CustomRoute(
      page: MainRoute.page, 
      path: "/main",
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [OnboardingGuard()],
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: "home",
          ),
        AutoRoute(
          page: WorkoutRoute.page,
          path: "workout",
          ),
        AutoRoute(
          page: WikiRoute.page,
          path: "wiki",
          ),
        AutoRoute(
          page: AnalyticsRoute.page,
          path: "analytics",
          ),
      ]
      ), 
      CustomRoute(
        page: WorkoutInitialRoute.page,
        path: "/workoutInitial",
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
      ),
      CustomRoute(
        page: WorkoutFinalRoute.page,
        path: "/workoutFinal",
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
      ),
  ];
}