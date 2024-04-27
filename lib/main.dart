
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_mirror/data/models/exercise/exercise_model.dart';
import 'package:gym_mirror/data/models/user/user_model.dart';
import 'package:gym_mirror/data/models/workout/workout_model.dart';
import 'package:gym_mirror/generated/l10n.dart';
import 'package:gym_mirror/injection_container.dart';
import 'package:gym_mirror/router/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(WorkoutModelAdapter());
  Hive.registerAdapter(ExerciseModelAdapter());
  await Hive.openBox<UserModel>('userBox');
  await Hive.openBox<ExerciseModel>('exerciseBox');
  await Hive.openBox<WorkoutModel>('workoutBox');
  init();
  runApp(const MainApp()); 
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
        
        routerConfig: _router.config()
        
    );
  }
}
