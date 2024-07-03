import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  factory AppColors() => _instance ??= AppColors._();

  AppColors._();
  static const primaryColor = Color(0xFF5F33E1);
  static const darkGrey = Color.fromARGB(255, 124, 124, 124);
}
