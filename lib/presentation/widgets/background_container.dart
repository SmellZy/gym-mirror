import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    required this.child,
    required this.backgroundImage,
    super.key,
  });

  final Widget child;
  final AssetImage backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
     width: MediaQuery.of(context).size.width,
     height: double.infinity,
     decoration: BoxDecoration(
       image: DecorationImage(
         image: backgroundImage,
         fit: BoxFit.cover
       )
     ),
     child: child
    );
  }
}