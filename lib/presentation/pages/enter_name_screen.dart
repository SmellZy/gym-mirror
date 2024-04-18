import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class EnterNamePage extends StatefulWidget {
  const EnterNamePage({super.key});

  @override
  State<EnterNamePage> createState() => _EnterNamePage();
}

class _EnterNamePage extends State<EnterNamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/third_gradient.png"),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("And what`s your name?", 
                style: TextStyle(
                  color: Colors.white, 
                  fontFamily: "Outer-Sans", 
                  fontWeight: FontWeight.bold, 
                  fontSize: 27,
                  decoration: TextDecoration.none
                  )),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: const TextStyle(color: Colors.white, fontSize: 25, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200),
                  textAlign: TextAlign.start,
                   decoration: InputDecoration(
                     focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.white.withOpacity(0.75))),
                     disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.white.withOpacity(0.75))),
                     enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.white.withOpacity(0.75))),
                     hintText: 'Enter your name',
                     hintStyle: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 25, fontFamily: "Outer-Sans", fontWeight: FontWeight.w200),
                     hintMaxLines: 1,
                     hintTextDirection: TextDirection.ltr
                   ),
                 ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  onPressed: (){AutoRouter.of(context).maybePop();}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    animationDuration: const Duration(milliseconds: 0),
                    enableFeedback: false,
                    minimumSize: const Size(double.infinity, 47),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    side:  BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  child: const Text("Start", style: TextStyle(color: Color.fromARGB(255, 195, 195, 195)),), 
                ),
              )
            ],
            
          ),
        ),
      ),
    );
  }
}