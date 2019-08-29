import 'package:flutter/material.dart';
import 'food_page.dart';

void main() => runApp(MealioApp());

String mainTitle = 'Mealio';

class MealioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: mainTitle,
      home: new FoodPage(),
    );
  }
}
