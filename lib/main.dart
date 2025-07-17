import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_theme.dart';
import 'package:stack_food/features/Home/Presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Food',
      theme: AppTheme.lightTheme,
      home: const StackFoodHome(),
    );
  }
}
