import 'package:flutter/material.dart';
import 'package:intro_to_rest_api_2/screens/food_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FoodScreen(),
    );
  }
}
