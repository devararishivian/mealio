import 'package:flutter/material.dart';
import 'pages/food_page.dart';
import 'package:mealio/constant.dart';

void main() => runApp(MealioApp());

class MealioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: kMainTitle,
      home: FoodPage(),
    );
  }
}
