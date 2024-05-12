import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:gym_mirror/router/router.dart';

@RoutePage()
class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        GreetingFirstRoute(),
        GreetingSecondRoute(),
        GreetingThirdRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final currentTabIndex = tabsRouter.activeIndex;
        return BackgroundContainer(
          backgroundImage:
              const AssetImage("assets/background/first_gradient.png"),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Expanded(child: child),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Image.asset(
                          "assets/img/greeting.png",
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: GreetingButton(
                                index: currentTabIndex,
                                tabsRouter: tabsRouter)),
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class GreetingButton extends StatelessWidget {
  const GreetingButton(
      {Key? key, required this.index, required this.tabsRouter})
      : super(key: key);

  final int index;
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final isLast = index == tabsRouter.pageCount - 1;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 0),
        enableFeedback: false,
        minimumSize: const Size(double.infinity, 47),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: const BorderSide(
          width: 1,
          color: Color.fromARGB(255, 9, 9, 9),
        ),
      ),
      onPressed: () {
        if (!isLast) {
          tabsRouter.setActiveIndex(index + 1);
        } else {
          AutoRouter.of(context).push(const OnboardingRoute());
        }
      },
      child: Text(
        isLast ? "Start" : "Next",
        style: const TextStyle(color: Color.fromARGB(192, 9, 9, 9)),
      ),
    );
  }
}
