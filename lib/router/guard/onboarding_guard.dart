import 'package:auto_route/auto_route.dart';
import 'package:gym_mirror/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboarded = prefs.getBool("onboarded") ?? false;
    if (onboarded == true) {
      resolver.next(true);
    } else {
      router.push(const OnboardingRoute());
    }
  }
}
