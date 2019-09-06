import 'package:flutter/material.dart';
import 'food_list.dart';

class FoodDetailPage extends StatefulWidget {
  FoodDetailPage(
      {@required this.index,
      @required this.foodCategory,
      @required this.foodId});

  final int index;
  final String foodCategory;
  final String foodId;

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(FoodList(foodCategory: this.widget.foodCategory)
              .getFoodName(widget.index)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: SingleChildScrollView(
        child: Column(
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
                        tag: this.widget.foodId,
                        child: CircleAvatar(
                            radius: 75.0,
                            backgroundImage: NetworkImage(
                                FoodList(foodCategory: this.widget.foodCategory)
                                    .getFoodPicture(widget.index))),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        // child: Text('TES'),
                        child: Text(
                            FoodList(foodCategory: this.widget.foodCategory)
                                .getFoodDetail(widget.index)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
