import 'package:mealio/models/food_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodService {
  getFoodByCategory(String foodCategory) async {
    String url =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$foodCategory";

    http.Response response = await http.get(url);
    var responseJson = json.decode(response.body);

    return response.statusCode == 200
        ? (responseJson['meals'] as List).map((p) => Food.fromJson(p)).toList()
        : throw Exception('Failed to load food');
  }

  getFoodById(String foodId) async {
    String url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$foodId";

    http.Response response = await http.get(url);
    var responseJson = json.decode(response.body);
    var resData = response.statusCode == 200
        ? (responseJson['meals'] as List)
            .map((p) => FoodDetail.fromJson(p))
            .toList()
        : throw Exception('Failed to load food');
    return resData;
  }
}
