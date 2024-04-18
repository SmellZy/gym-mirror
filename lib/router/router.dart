import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:gym_mirror/presentation/pages/enter_name_screen.dart';
import 'package:gym_mirror/presentation/pages/greeting_screen.dart';
import 'package:gym_mirror/presentation/pages/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: "/",
      initial: true),
    AutoRoute(
      page: EnterNameRoute.page,
      path: "/createUserName"),
    AutoRoute(
      page: GreetingRoute.page,
      path: "/greeting"),
  ];
}