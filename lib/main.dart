import 'package:flutter/material.dart';
import 'package:food_app/home/main_food_page.dart';

void main() {
  runApp(const foodApp());
}
class foodApp extends StatelessWidget {
  const foodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
    );
  }
}

