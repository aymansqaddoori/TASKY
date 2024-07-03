import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/screens/intro/welcome_screen.dart';
import 'package:to_do/widgets/color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay = Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) {
        return const WelcomeScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Task',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy-Regular',
            fontSize: 45.0,
          ),
        ),
        Text(
          'y',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontFamily: 'Gilroy-Bold',
            fontWeight: FontWeight.bold,
            fontSize: 45.0,
          ),
        ),
      ]),
    ],
  );
}
