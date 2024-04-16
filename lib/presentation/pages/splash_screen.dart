import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:gym_mirror/presentation/pages/greeting_screen.dart';
 @RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      duration: const Duration(seconds: 5),
      splashScreenBody: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/third_gradient.png"),
            fit: BoxFit.cover
          )
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/img/logo.png', width: 250, height: 250,),
            ),
            const SizedBox(height: 20,),
            const AutoSizeText(
              "Gym Mirror",
              style: TextStyle(color: Colors.white, fontFamily: "Outer-Sans", fontWeight: FontWeight.bold),
              minFontSize: 35,
              maxFontSize: 40,
            ),
          ],
        ),
      ),
      nextScreen: GreetingPage(),
    );
  }
}