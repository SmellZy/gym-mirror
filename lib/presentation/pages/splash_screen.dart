import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
 import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:gym_mirror/cache_container.dart';
import 'package:gym_mirror/router/router.dart';
import 'package:o3d/o3d.dart';

Future<void> initializeO3D() async {
  final cache = CacheContainer();
  // Load your O3D model and configure the controller here
  final controller = O3DController();
  final modelFile = await cache.loadCachedModel();
  final src = modelFile!.path;
  // ... other O3D configuration
  return;
}

 @RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Image backgroundImage;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset("assets/background/first_gradient.png");
  }

@override
  void didChangeDependencies(){
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
    Timer(const Duration(seconds: 5),
        () => AutoRouter.of(context).pushAll([          
          const HomeRoute(),
          const GreetingRoute(),
        ]
      )
    );
  }

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
    );
  }
}