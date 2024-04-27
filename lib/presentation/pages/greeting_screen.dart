import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:gym_mirror/presentation/widgets/onboarding_button.dart';
import 'package:gym_mirror/router/router.dart';

@RoutePage()
class GreetingPage extends StatefulWidget {

  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}


class _GreetingPageState extends State<GreetingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  bool _canScroll = true;
  
  @override
void initState(){
  super.initState();
  _pageController.addListener(() {
      setState(() {
        _canScroll = _pageController.page!.toInt() != 2; // Disable scroll on last page (index 2)
      });
    });
  // Future.delayed(const Duration(seconds: 8), () {
  //     if (_canScroll) {
  //       _pageController.animateToPage(1, duration: const Duration(seconds: 5), curve: Curves.linearToEaseOut);
  //       setState(() {
  //         _canScroll = false;
  //       });
  //     }
  // });
  // Future.delayed(Duration(seconds: 10), () {
  //   AutoRouter.of(context).maybePop();
  // });
}

@override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
     return BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/first_gradient.png"),
      child: SafeArea(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             const SizedBox(height: 20),
             SizedBox(
               width: MediaQuery.of(context).size.width * 1,
               height: 145,
               child: PageView(
                 scrollDirection: Axis.horizontal,
                 controller: _pageController,
                 physics: const NeverScrollableScrollPhysics(),
                 children: const [
                 HiMyNameIsIOText(),
                 IWillHellpYouText(),
                 AnswerQuestions()
                   ]),
             ),
             SizedBox(
               width: double.infinity,
               height: MediaQuery.of(context).size.height * 0.71,
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
                     child: GreetingButton(canScroll: _canScroll, pageController: _pageController)
                   )
                 ],
               ),
             )
           ],
         ),
      ),
     );
  }
}

class GreetingButton extends StatelessWidget {
  const GreetingButton({
    super.key,
    required bool canScroll,
    required PageController pageController,
  }) : _canScroll = canScroll, _pageController = pageController;

  final bool _canScroll;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 0),
        enableFeedback: false,
        minimumSize: const Size(double.infinity, 47),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        side: const BorderSide(
          width: 1,
          color: Color.fromARGB(255, 9, 9, 9),
        ),
      ),
      onPressed: () {
        if (_canScroll) {
          _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.linearToEaseOut);
        } else {
          AutoRouter.of(context).push(EnterNameRoute());
        }
      },
      child: Text(
        _canScroll ? "Next" : "Start",
        style: TextStyle(
            color: Color.fromARGB(192, 9, 9, 9)),
        ),
    );
  }
}

class HiMyNameIsIOText extends StatelessWidget {
  const HiMyNameIsIOText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(textAlign: TextAlign.center, text: const TextSpan(
        children: [
          TextSpan(text: "Hi!\n", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200)),
          TextSpan(text: "My name is ", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200)),
          TextSpan(text: "IO.", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.bold))
        ]
      )
    );
  }
}

class IWillHellpYouText extends StatelessWidget {
  const IWillHellpYouText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(textAlign: TextAlign.center, text: const TextSpan(
      children: [
        TextSpan(text: "I will help you \n", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200)),
        TextSpan(text: "with ", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200)),
        TextSpan(text: "exercises!", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.bold))
        ]
      )
    );
  }
}

class AnswerQuestions extends StatelessWidget {
  const AnswerQuestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(textAlign: TextAlign.center, text: const TextSpan(
        children: [
          TextSpan(text: "Answer ", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200)),
          TextSpan(text: "5 questions \n", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.bold)),
          TextSpan(text: "before we start our \n", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200)),
          TextSpan(text: "first training", style: TextStyle(fontSize: 36, fontFamily: "Outer-Sans", fontWeight: FontWeight.bold))
        ]
      )
    );
  }
}