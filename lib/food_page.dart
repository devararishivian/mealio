import 'package:flutter/material.dart';
import 'food_detail_page.dart';
import 'food_list.dart';

String mainTitle = 'Mealio';
const String breakfast = 'Breakfast';
const String dessert = 'Dessert';

class FoodPage extends StatelessWidget {
  const FoodPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(mainTitle),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: breakfast,
              ),
              Tab(
                text: dessert,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            new FoodGridView(),
            Text('OK'),
          ],
        ),
      ),
    );
  }
}

class FoodGridView extends StatelessWidget {
  const FoodGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        itemCount: FoodList(foodCategory: breakfast).countFoodList(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: GridTile(
              child: Card(
                margin: EdgeInsets.all(20.0),
                child: Hero(
                  tag: FoodList(foodCategory: breakfast).getFoodName(index),
                  child: Image.network(
                    FoodList(foodCategory: breakfast).getFoodPicture(index),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              footer: Padding(
                padding: EdgeInsets.all(20.0),
                child: GridTileBar(
                  backgroundColor: Colors.black45,
                  title: Text(
                    FoodList(foodCategory: breakfast).getFoodName(index),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.open_in_new),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FoodDetailPage(index: index, foodCategory: breakfast),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
