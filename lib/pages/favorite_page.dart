import 'package:flutter/material.dart';
import 'package:mealio/constant.dart';
import 'dessert_page.dart';
import 'seafood_page.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: Container(
              child: TabBar(
                tabs: [
                  Container(
                    height: 50.0,
                    child: Tab(
                      text: kDessert,
                    ),
                  ),
                  Container(
                    height: 50.0,
                    child: Tab(
                      text: kSeafood,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DessertPage(foodCategory: kDessert),
            SeafoodPage(foodCategory: kSeafood),
          ],
        ),
      ),
    );
  }
}
