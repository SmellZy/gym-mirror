import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:o3d/o3d.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  O3DController controller = O3DController();
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      backgroundImage: const AssetImage("assets/background/third_gradient.png"),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [ //main column
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Monday, ".toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Outer-Sans", fontWeight: FontWeight.w400),),
                          Text("April 23".toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Outer-Sans", fontWeight: FontWeight.w400),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("day 21 - ".toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Outer-Sans", fontWeight: FontWeight.w900),),
                          const Text("Leg Day", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Outer-Sans", fontWeight: FontWeight.w900),)
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.settings, color: Colors.white, size: 24,)
                ], // date row
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 28, 28, 30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("16", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Outer-Sans", fontWeight: FontWeight.w900),),
                              Text("Day Streak", style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Outer-Sans", fontWeight: FontWeight.w400),),
                              Text("Record - 32", style: TextStyle(color: Color.fromARGB(255, 173, 173, 173), fontSize: 10, fontFamily: "Outer-Sans", fontWeight: FontWeight.w400),),
                            ],
                          ),
                          Image.asset("assets/icons/flame_icon.png")
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 28, 28, 30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("4/7", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "Outer-Sans", fontWeight: FontWeight.w900),),
                              Text("Week goal", style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Outer-Sans", fontWeight: FontWeight.w400),),
                              Text("Max Streak - 4", style: TextStyle(color: Color.fromARGB(255, 173, 173, 173), fontSize: 10, fontFamily: "Outer-Sans", fontWeight: FontWeight.w400),),
                            ],
                          ),
                          Image.asset("assets/icons/note_icon.png")
                        ],
                      ),
                    ),
                  ),
                ], //day streak row
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.66,
                width: MediaQuery.of(context).size.width,
                child: O3D.asset(
                  controller: controller,
                  src: "assets/models/body.glb",
                  autoPlay: false,
                  loading: Loading.eager,
                  disableTap: true,
                  disableZoom: false,
                  cameraControls: true,
                  ),
              )
            ],
          ),
        ),
      )
    );
  }
}