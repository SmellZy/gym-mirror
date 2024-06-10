import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gym_mirror/generated/l10n.dart';
import 'package:gym_mirror/router/router.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        WorkoutRoute(),
        WikiRoute(),
        AnalyticsRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final currentTabIndex = tabsRouter.activeIndex;
        return Scaffold(
          body: Stack(children: [
            child,
            Align(
                alignment: Alignment.bottomCenter,
                child: _navigationBar(currentTabIndex, tabsRouter))
          ]),
        );
      },
    );
  }

  Widget _navigationBar(int currentTabIndex, TabsRouter tabsRouter) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 24),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 28, 28, 30),
        borderRadius: const BorderRadius.all(Radius.circular(43)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navigationBarItem("assets/icons/home_icon.png", S.of(context).home, 0,
              currentTabIndex, tabsRouter),
          _navigationBarItem("assets/icons/workout_icon.png", S.of(context).workout, 1,
              currentTabIndex, tabsRouter),
          _navigationBarItem("assets/icons/analytics_icon.png", S.of(context).analytics, 2,
              currentTabIndex, tabsRouter),
          _navigationBarItem("assets/icons/profile_icon.png", S.of(context).profile, 3,
              currentTabIndex, tabsRouter),
        ],
      ),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    setState(() => selectedPageIndex = index);
    tabsRouter.setActiveIndex(index);
  }

  Widget _navigationBarItem(String iconSrc, String text, int index,
      int currentTabIndex, TabsRouter tabsRouter) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: currentTabIndex == index ? 120 : 65,
      height: 40,
      alignment:
          currentTabIndex == index ? Alignment.centerLeft : Alignment.center,
      decoration: BoxDecoration(
        color: currentTabIndex == index
            ? const Color.fromARGB(255, 240, 240, 240)
            : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(43)),
      ),
      child: GestureDetector(
        onTap: (() => _openPage(index, tabsRouter)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset(
                  width: 25,
                  height: 25,
                  iconSrc,
                  color:
                      currentTabIndex == index ? Colors.black : Colors.white),
              onPressed: null, // Remove onPressed from IconButton
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: currentTabIndex == index
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(text,
                            style: TextStyle(
                                color: currentTabIndex == index
                                    ? Colors.black
                                    : Colors.transparent,
                                fontSize: currentTabIndex == index ? 14 : 2,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500)),
                      )
                    : Container(
                        width: 5,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
