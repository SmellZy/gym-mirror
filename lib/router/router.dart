import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/presentation/pages/main_pages/analytics_page.dart';
import 'package:gym_mirror/presentation/pages/main_pages/home_page.dart';
import 'package:gym_mirror/presentation/pages/main_pages/wiki_page.dart';
import 'package:gym_mirror/presentation/pages/main_pages/workout_page.dart';
import 'package:gym_mirror/presentation/pages/onboarding_screen.dart';
import 'package:gym_mirror/presentation/pages/greeting_screen.dart';
import 'package:gym_mirror/presentation/pages/main_screen.dart';
import 'package:gym_mirror/presentation/pages/splash_screen.dart';
import 'package:gym_mirror/presentation/pages/test_anim_screen.dart';
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
      
      ),
    CustomRoute(
      page: OnboardingRoute.page,
      path: "/createUserName",
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 1000,
      ),
    CustomRoute(
      page: AnimationRoute.page,
      path: "/animTest",
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 2000
      ),
    CustomRoute(
      page: MainRoute.page, 
      path: "/main",
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
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
  ];
}