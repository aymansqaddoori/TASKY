import 'package:flutter/material.dart';
import 'package:to_do/screens/intro/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasky App',
      home: SplashScreen(),
    );
  }
}
