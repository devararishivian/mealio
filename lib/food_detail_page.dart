import 'package:flutter/material.dart';
import 'food_list.dart';

class FoodDetailPage extends StatelessWidget {
  FoodDetailPage(
      {@required this.index,
      @required this.foodCategory,
      @required this.foodId});

  final int index;
  final String foodCategory;
  final String foodId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              FoodList(foodCategory: this.foodCategory).getFoodName(index)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: Hero(
                      tag: this.foodId,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          FoodList(foodCategory: this.foodCategory)
                              .getFoodPicture(index),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('TES'),
                      // child: Text(FoodList(foodCategory: this.foodCategory)
                      // .getFoodDetail(index)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
