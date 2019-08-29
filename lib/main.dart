import 'package:flutter/material.dart';
import 'food_page.dart';

void main() => runApp(MakananKhasIndoApp());

String mainTitle = 'Makanan Khas Indonesia';

class MakananKhasIndoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: mainTitle,
      home: new FoodPage(),
    );
  }
}
