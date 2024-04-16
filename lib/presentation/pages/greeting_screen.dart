import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:o3d/o3d.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}


class _GreetingPageState extends State<GreetingPage> {
  final O3DController controller = O3DController();
  List<String> logs = [];
  bool cameraControls = false;
  final PageController _pageController = PageController(initialPage: 0);
  bool _canScroll = true;
  
  @override
void initState(){
  super.initState();
  controller.logger = (data) {
      logs.add(data.toString());
    }; 
  Future.delayed(const Duration(seconds: 2), () {
      if (_canScroll) {
        _pageController.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.linearToEaseOut);
        setState(() {
          _canScroll = false;
        });
      }
  });
}

@override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/first_gradient.png"),
          fit: BoxFit.cover
        )
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 105,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: (index) {
                  if (index == 1) {
                    setState(() {
                      _canScroll = false;
                    });
                  }
                },
                physics: _canScroll ? const PageScrollPhysics() : const NeverScrollableScrollPhysics(),
                children: const [
                HiMyNameIsIOText(),
                IWillHellpYouText()
                  ]),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              child: O3D(
                controller: controller,
                src: "assets/models/glass2.glb",
                autoPlay: false,
                cameraControls: cameraControls,
                loading: Loading.eager,
                )
              )
          ],
        ),
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