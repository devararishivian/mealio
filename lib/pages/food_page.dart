import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mealio/pages/dessert_page.dart';
import 'package:mealio/pages/seafood_page.dart';
import 'package:mealio/pages/favorite_page.dart';
import 'package:mealio/constant.dart';

class FoodPage extends StatelessWidget {
  FoodPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodScreen(
        key: Key('FOOD_SCREEN'),
      ),
    );
  }
}

class FoodScreen extends StatefulWidget {
  FoodScreen({Key key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DessertPage(foodCategory: kDessert),
    SeafoodPage(foodCategory: kSeafood),
    FavoritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('APP_BAR'),
        title: Text(
          kMainTitle,
          key: Key('APP_BAR_TITLE'),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        key: Key('BOTTOM_NAVBAR_FOODPAGE'),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.iceCream,
              key: Key('BOTTOM_NAVBAR_FOODPAGE_DESSERT'),
            ),
            title: Text('Dessert'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.fish,
              key: Key('BOTTOM_NAVBAR_FOODPAGE_SEAFOOD'),
            ),
            title: Text('Seafood'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidHeart,
              key: Key('BOTTOM_NAVBAR_FOODPAGE_FAVORITE'),
            ),
            title: Text('Favorite'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
