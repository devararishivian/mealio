import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mealio/models/food_model.dart';

class FoodService {
  String url;

  Future<Food> getFoodByCategory() async {
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Food.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Food> getFoodById() async {
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Food.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
