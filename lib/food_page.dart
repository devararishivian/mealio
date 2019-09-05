import 'package:flutter/material.dart';
import 'food_detail_page.dart';
import 'food_list.dart';
import 'models/food_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String mainTitle = 'Mealio';
const String seafood = 'Seafood';
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
                text: seafood,
              ),
              Tab(
                text: dessert,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            new FoodGridView(foodCategory: seafood),
            new FoodGridView(foodCategory: dessert),
          ],
        ),
      ),
    );
  }
}

class FoodGridView extends StatelessWidget {
  const FoodGridView({
    Key key,
    @required this.foodCategory,
  }) : super(key: key);

  final String foodCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        itemCount: FoodList(foodCategory: seafood).countFoodList(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: new FoodCard(
              foodCategory: foodCategory,
              index: index,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(
                    index: index,
                    foodCategory: this.foodCategory,
                    foodId: FoodList(foodCategory: this.foodCategory)
                        .getFoodId(index),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FoodCard extends StatefulWidget {
  FoodCard({
    Key key,
    @required this.foodCategory,
    @required this.index,
  }) : super(key: key);

  final String foodCategory;
  final int index;

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  List<Food> foodList;
  List<FoodDetail> foodDetailList;

  @override
  void initState() {
    super.initState();
    getFoodById();
    getFoodByCategory(widget.foodCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: foodList[widget.index].foodId,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  foodList[widget.index].foodPicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  foodList[widget.index].foodName,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getFoodById() async {
    String url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52855";
    http.Response response = await http.get(url);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        foodDetailList = (responseJson['meals'] as List)
            .map((p) => FoodDetail.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  getFoodByCategory(String foodCategory) async {
    String url =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$foodCategory";
    http.Response response = await http.get(url);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        foodList = (responseJson['meals'] as List)
            .map((p) => Food.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
