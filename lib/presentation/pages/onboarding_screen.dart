import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';
import 'package:gym_mirror/generated/l10n.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:gym_mirror/presentation/widgets/onboarding_info.dart';
import 'package:gym_mirror/presentation/widgets/onboarding_input_field.dart';
import 'package:gym_mirror/presentation/widgets/onboarding_progress_bar.dart';
import 'package:gym_mirror/router/router.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController goalWeightController = TextEditingController();
  final _userBloc = UserBloc(GetIt.I<UserRepository>());
  double proggressPercent = 0.1;
  int? currentValue;
  final PageController _pageController = PageController(initialPage: 0);
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _isLastPage = _pageController.page!.toInt() == 3;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void userCreate() {
    _userBloc.add(CreateUserEvent(User(
        id: 1,
        name: nameController.text,
        height: int.parse(heightController.text),
        initialWeight: int.parse(weightController.text),
        currentWeight: int.parse(weightController.text),
        goalWeight: int.parse(goalWeightController.text))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/third_gradient.png"),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: ProgressBar(
                  percent: proggressPercent,
                ),
              ),
              const SizedBox(height: 200),
              SizedBox(
                height: 200,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OnboardingName(nameController: nameController),
                    OnboardingHeight(heightController: heightController),
                    OnboardingWeight(weightController: weightController,),
                    OnboardingGoalWeight(goalWeightController: goalWeightController, weightController: weightController)
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      animationDuration: const Duration(milliseconds: 0),
                      enableFeedback: false,
                      minimumSize: const Size(double.infinity, 47),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      side: BorderSide(
                        width: 1,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    onPressed: () {
                      proggressPercent += 0.15;
                      if (!_isLastPage) {
                        _pageController.nextPage(
                            duration: const Duration(microseconds: 10),
                            curve: Curves.linear);
                      } else {
                        setState(() {
                          userCreate();
                          SharedPreferences.getInstance().then((prefs) => prefs.setBool('onboarded', true));
                          Future.delayed(const Duration(milliseconds: 1500), () {
                            context.router.push(const MainRoute());
                          });
                        });
                      }
                    },
                    child: Text(
                      _isLastPage ? S.of(context).startOnboarding : S.of(context).nextOnboarding,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 195, 195, 195)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}

class OnboardingName extends StatelessWidget {
  const OnboardingName({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return OnboardingInfoInput(
      heightOfSizedBox: 30,
      labelText: S.of(context).whatsYourName,
      child: OnboardingInputField(
        hintText: S.of(context).enterYourName,
        keyboardType: TextInputType.name,
        controller: nameController,
        suffixText: "",
      ),
    );
  }
}

class OnboardingHeight extends StatelessWidget {
  const OnboardingHeight({
    super.key,
    required this.heightController,
  });

  final TextEditingController heightController;

  @override
  Widget build(BuildContext context) {
    return OnboardingInfoInput(
      heightOfSizedBox: 30,
      labelText: S.of(context).whatsYourHeight,
      child: OnboardingInputField(
        hintText: S.of(context).cm160,
        keyboardType: TextInputType.number,
        suffixText: "cm",
        controller: heightController,
      ),
    );
  }
}

class OnboardingWeight extends StatefulWidget {
  const OnboardingWeight({
    required this.weightController,
    super.key,
  });

  final TextEditingController weightController;

  @override
  State<OnboardingWeight> createState() => _OnboardingWeightState();
}

class _OnboardingWeightState extends State<OnboardingWeight> {
  @override
  Widget build(BuildContext context) {
    return OnboardingInfoInput(
      heightOfSizedBox: 28,
      labelText: S.of(context).whatsYourWeight,
      child: NumberPicker(
        axis: Axis.horizontal,
        textStyle: const TextStyle(
            color: Color.fromARGB(193, 255, 255, 255),
            fontSize: 25,
            fontFamily: "Outer-Sans"),
        selectedTextStyle: const TextStyle(
            color: Colors.white, fontSize: 50, fontFamily: "Outer-Sans"),
        itemCount: 3,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        haptics: true,
        itemHeight: 90,
        itemWidth: 100,
        minValue: 45,
        maxValue: 250,
        value: widget.weightController.text != ""
            ? int.parse(widget.weightController.text)
            : 70,
        onChanged: ((value) =>
            setState(() => widget.weightController.text = value.toString())),
      ),
    );
  }
}

class OnboardingGoalWeight extends StatefulWidget {
  const OnboardingGoalWeight({
    required this.goalWeightController,
    super.key, required this.weightController,
  });

  final TextEditingController goalWeightController;
  final TextEditingController weightController;

  @override
  State<OnboardingGoalWeight> createState() => _OnboardingGoalWeightState();
}

class _OnboardingGoalWeightState extends State<OnboardingGoalWeight> {
  @override
  Widget build(BuildContext context) {
    return OnboardingInfoInput(
      heightOfSizedBox: 28,
      labelText: S.of(context).whatsYourGoal,
      child: NumberPicker(
        axis: Axis.horizontal,
        textStyle: const TextStyle(
            color: Color.fromARGB(193, 255, 255, 255),
            fontSize: 25,
            fontFamily: "Outer-Sans"),
        selectedTextStyle: const TextStyle(
            color: Colors.white, fontSize: 50, fontFamily: "Outer-Sans"),
        itemCount: 3,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        haptics: true,
        itemHeight: 90,
        itemWidth: 100,
        minValue: 45,
        maxValue: 250,
        value: widget.goalWeightController.text != ""
            ? int.parse(widget.goalWeightController.text)
            : 70,
        onChanged: ((value) =>
            setState(() => widget.goalWeightController.text = value.toString())),
      ),
    );
  }
}
