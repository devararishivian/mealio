import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'models/food_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodDetailPage extends StatefulWidget {
  FoodDetailPage({
    @required this.foodId,
  });

  final String foodId;

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  List<FoodDetail> foodDetail;

  @override
  void initState() {
    super.initState();
    getFoodById(widget.foodId);
  }

  getFoodById(String foodId) async {
    String url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$foodId";
    http.Response response = await http.get(url);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        foodDetail = (responseJson['meals'] as List)
            .map((p) => FoodDetail.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (foodDetail == null) {
      return SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            title: Text(
              foodDetail[0].foodName,
            ),
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
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 25.0),
                        child: Hero(
                          tag: foodDetail[0].foodId,
                          child: CircleAvatar(
                              radius: 75.0,
                              backgroundImage: NetworkImage(
                                foodDetail[0].foodPicture,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            foodDetail[0].foodDetail,
                          ),
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
}
