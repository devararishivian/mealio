import 'package:flutter/material.dart';
import 'pages/food_page.dart';
import 'package:mealio/constant.dart';
import 'package:mealio/config.dart';

void main() => runApp(MealioApp());

class MealioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Config.appTheme,
      title: kMainTitle,
      home: FoodPage(),
    );
  }
}
