import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gym_mirror/domain/entities/user.dart';
import 'package:gym_mirror/domain/repositories/user_repository.dart';
import 'package:gym_mirror/presentation/bloc/user/user_bloc.dart';
import 'package:gym_mirror/presentation/widgets/background_container.dart';
import 'package:health/health.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  List<HealthDataPoint> steps = [];
  List<HealthDataPoint> weight = [];
  List<HealthDataPoint> height = [];
  List<HealthDataPoint> activeEnergy = [];
  List<HealthDataPoint> hearthRate = [];
  List<HealthDataPoint> water = [];
  int totalSteps = 0;
  int stepsProgress = 0;
  final double stepsGoal = 2500;
  final _userBloc = UserBloc(GetIt.I<UserRepository>());

  List<_ChartData> chartData = <_ChartData>[];
  // Future<void> _fetchStepData() async {
  //   final health = Health();
  //   health.configure(useHealthConnectIfAvailable: true);

  //   try {
  //     var types = [
  //       HealthDataType.STEPS,
  //       HealthDataType.WEIGHT,
  //       HealthDataType.HEIGHT,
  //       HealthDataType.ACTIVE_ENERGY_BURNED,
  //       HealthDataType.HEART_RATE,
  //       HealthDataType.WATER
  //     ];

  //     var permissions = [
  //       HealthDataAccess.READ,
  //       HealthDataAccess.READ_WRITE,
  //       HealthDataAccess.READ_WRITE,
  //       HealthDataAccess.READ_WRITE,
  //       HealthDataAccess.READ,
  //       HealthDataAccess.READ,
  //     ];

  //     DateTime now = DateTime.now();
  //     DateTime start = DateTime(now.year, now.month, now.day);

  //     bool authorized = await health.requestAuthorization(types, permissions: permissions);
  //     PermissionStatus activityPermissionStatus =  await Permission.activityRecognition.request();

  //     // if (authorized) {
  //     //   // List<HealthDataPoint> _steps = await health.getHealthDataFromTypes(
  //     //   //   startTime: start, endTime: now, types: [HealthDataType.STEPS]
  //     //   // );
  //     //   // List<HealthDataPoint> _weight = await health.getHealthDataFromTypes(
  //     //   //   startTime: start, endTime: now, types: [HealthDataType.WEIGHT]
  //     //   // );
  //     //   // List<HealthDataPoint> _height = await health.getHealthDataFromTypes(
  //     //   //   startTime: start, endTime: now, types: [HealthDataType.HEIGHT]
  //     //   // );
  //     //   // List<HealthDataPoint> _active_energy_burbed = await health.getHealthDataFromTypes(
  //     //   //   startTime: start, endTime: now, types: [HealthDataType.ACTIVE_ENERGY_BURNED]
  //     //   // );
  //     //   // List<HealthDataPoint> _hearth_rate = await health.getHealthDataFromTypes(
  //     //   //   startTime: start, endTime: now, types: [HealthDataType.HEART_RATE]
  //     //   // );
  //     //   // List<HealthDataPoint> _water = await health.getHealthDataFromTypes(
  //     //   //   startTime: start, endTime: now, types: [HealthDataType.WATER]
  //     //   // );

        
  //     //   int? todaySteps = await health.getTotalStepsInInterval(start, now);

  //     //   setState(() {
  //     //     //log(_weight.toString());
  //     //     totalSteps = todaySteps ?? 0;
  //     //     // steps = _steps;
  //     //     // weight = _weight;
  //     //     // height = _height;
  //     //     // activeEnergy = _active_energy_burbed;
  //     //     // hearthRate = _hearth_rate;
  //     //     // water = _water;
  //     //     stepsProgress = ((todaySteps ?? 0) / stepsGoal * 100).toInt();
  //     //     Color stepsColor = _getStepsColor(stepsProgress);
  //     //     chartData = [_ChartData("Steps", todaySteps ?? 0, stepsColor)];
  //     //   });
  //     // } else {
  //     //   log("Authorization not granted");
  //     // }

  //     if (Platform.isIOS || activityPermissionStatus == PermissionStatus.granted) {
  //        List<HealthDataPoint> healthData =
  //           await health.getHealthDataFromTypes(startTime: start, endTime: now, types: types);
  //       final userData = healthData
  //         .where((dataPoint) => dataPoint.type == HealthDataType.WEIGHT);
  //         if (userData.isNotEmpty) {
  //             for (var item in userData) {
  //             print(item);
  //          }
  //         } else {}
  //     }

  //   } catch (e) {
  //     log("Error: $e");
  //   }
  // }

  Future<void> getSleepData() async{
    final types = [
      HealthDataType.WEIGHT,
      HealthDataType.HEIGHT
    ];

    final permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    DateTime now = DateTime.now();
    DateTime start = DateTime(now.year, now.month, now.day);

    Health health = Health();

    await health.requestAuthorization(types, permissions: permissions);

    PermissionStatus activityPermissionStatus =  await Permission.activityRecognition.request();

    if (Platform.isIOS || activityPermissionStatus == PermissionStatus.granted) {
         List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(startTime: start, endTime: now, types: types);
        final weightData = healthData
          .where((dataPoint) => dataPoint.type == HealthDataType.WEIGHT);
          if (weightData.isNotEmpty) {
              for (var item in weightData) {
              print(item);
           }
      } else {
        print('No sleep data available for the specified day.');
      }
    }
  }

  Color _getStepsColor(int stepsProgress) {
          if (stepsProgress < 10) {
            return Colors.blue;
          } else if (stepsProgress < 30) {
            return const Color.fromARGB(255, 223, 96, 87);
          } else if (stepsProgress < 50) {
            return Colors.yellow;
          } else if (stepsProgress < 70) {
            return Colors.orange;
          } else if (stepsProgress > 99) {
            return Colors.green;
          }
          return Colors.grey;
      }

  

  @override
  void initState() {
    //_fetchStepData();
    getSleepData();
    _userBloc.add(GetUserEvent());
    log(weight.toString());
    log(height.toString());
    super.initState();
  }

  void _showEditBottomSheet(BuildContext context, User user,
      double deviceHeight, double deviceWidth) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final TextEditingController nameController =
            TextEditingController(text: user.name);
        final TextEditingController weightController =
            TextEditingController(text: user.weight.toString());
        final TextEditingController heightController =
            TextEditingController(text: user.height.toString());
        final _formKey = GlobalKey<FormState>();

        return Container(
          height: deviceHeight * 0.5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 218, 218, 218),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    style: const TextStyle(
                        fontSize: 22,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                        prefixText: "Name: ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 3))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 22,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.normal),
                    controller: weightController,
                    decoration: InputDecoration(
                        prefixText: "Weight: ",
                        suffixText: "kg",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 3))),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a weight';
                      }
                      final weight = double.tryParse(value);
                      if (weight == null || weight < 30 || weight > 250) {
                        return 'Weight must be between 30 and 250';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 22,
                        fontFamily: "Outer-Sans",
                        fontWeight: FontWeight.normal),
                    controller: heightController,
                    decoration: InputDecoration(
                        prefixText: "Height: ",
                        suffixText: "cm",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 3))),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a height';
                      }
                      final height = double.tryParse(value);
                      if (height == null || height < 100 || height > 250) {
                        return 'Height must be between 100 and 250';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 14, 70, 168),
                      shadowColor: Colors.transparent,
                      animationDuration: const Duration(milliseconds: 0),
                      enableFeedback: false,
                      minimumSize: Size(deviceWidth * 0.45, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        User updatedUser = User(
                          id: user.id,
                          name: nameController.text,
                          weight: double.parse(weightController.text).toInt(),
                          height: double.parse(heightController.text).toInt(),
                        );
                        _userBloc.add(UpdateUserEvent(updatedUser));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Save changes',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return BackgroundContainer(
        backgroundImage:
            const AssetImage("assets/background/third_gradient.png"),
        child: BlocProvider(
          create: (context) => _userBloc,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoaded) {
                  var date = DateTime.now();
                  return Column(
                    children: [
                      Container(
                        height: deviceHeight * 0.1,
                        width: deviceWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    DateFormat('EEEE, MMM d')
                                        .format(date)
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: "Outer-Sans",
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                "Day 21 - Leg Day".toUpperCase(),
                                style: const TextStyle(
                                    fontFamily: "Outer-Sans",
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileInfoContainer(
                              deviceWidth: deviceWidth,
                              deviceHeight: deviceHeight,
                              gradientColors: const [Colors.blue, Colors.white],
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            "assets/icons/profile_icon.png"),
                                        Expanded(
                                          child: AutoSizeText(
                                            state.user.name ?? "",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Outer-Sans",
                                                fontSize: 20),
                                            maxLines: 1,
                                            minFontSize: 12,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              _showEditBottomSheet(
                                                  context,
                                                  state.user,
                                                  deviceHeight,
                                                  deviceWidth);
                                            },
                                            icon: Icon(
                                              Icons.settings,
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Weight: ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Outer-Sans",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 22),
                                          ),
                                          AutoSizeText(
                                            state.user.weight.toString(),
                                            maxLines: 1,
                                            minFontSize: 16,
                                            presetFontSizes: const [20],
                                            maxFontSize: 22,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Outer-Sans",
                                              fontWeight: FontWeight.bold,
                                              
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Height: ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Outer-Sans",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 22),
                                          ),
                                          AutoSizeText(
                                            state.user.height.toString(),
                                             maxLines: 1,
                                            minFontSize: 16,
                                            presetFontSizes: const [20],
                                            maxFontSize: 22,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Outer-Sans",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          ProfileInfoContainer(
                            deviceWidth: deviceWidth,
                            deviceHeight: deviceHeight,
                            gradientColors: const [Colors.white, Colors.blue],
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SfCircularChart(
                                margin: const EdgeInsets.all(5),
                                legend: Legend(
                                  isVisible: true,
                                  itemPadding: 0,
                                  textStyle: TextStyle(color: Colors.white),
                                  position: LegendPosition.bottom
                                  ),
                                title: const ChartTitle(text: "Today steps", textStyle: TextStyle(color: Colors.white, fontFamily: "Outer-Sans")),
                                annotations: [
                                  CircularChartAnnotation(
                                    widget: Text(
                                      stepsProgress.toString() + "%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: "Outer-Sans"
                              
                                      ),
                                      )
                                    )
                                ],
                                series: <CircularSeries<_ChartData, String>>[
                                  RadialBarSeries<_ChartData, String>(
                                    maximumValue: stepsGoal,
                                      radius: '100%',
                                      gap: '2%',
                                      dataSource: chartData,
                                      innerRadius: '70%',
                                      cornerStyle: CornerStyle.bothCurve,
                                      xValueMapper: (_ChartData data, _) => data.title,
                                      yValueMapper: (_ChartData data, _) => data.value,
                                      pointColorMapper: (_ChartData data, _) => data.color),
                                  
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: deviceHeight * 0.4,
                        width: deviceWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${state.user.name ?? ""}, ${state.user.height} cm ${state.user.weight} kg",
                                      style: TextStyle(
                                          fontFamily: "Outer-Sans",
                                          fontSize: 28,
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Steps: ${weight}",
                                    style: TextStyle(
                                        fontFamily: "Outer-Sans",
                                        fontSize: 24,
                                        color: Colors.white.withOpacity(0.7)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
                return Column(
                  children: [
                    Container(
                      height: deviceHeight * 0.4,
                      width: deviceWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: const Row(
                        children: [],
                      ),
                    )
                  ],
                );
              },
            ),
          )),
        ));
  }
}

class _ChartData {
  final String title;
  final int value;
  final Color color;

  _ChartData(this.title, this.value, this.color);
}

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
    required this.child,
    required this.gradientColors,
  });

  final double deviceWidth;
  final double deviceHeight;
  final Widget child;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: deviceWidth * 0.43,
        height: deviceHeight * 0.2,
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 2,
          ),
          color: Colors.white.withOpacity(0.2),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ));
  }
}