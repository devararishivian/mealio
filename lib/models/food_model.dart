class Food {
  final String foodId;
  final String foodName;
  final String foodPicture;

  Food({this.foodId, this.foodName, this.foodPicture});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodId: json['idMeal'],
      foodName: json['strMeal'],
      foodPicture: json['strMealThumb'],
    );
  }
}

class FoodDetail {
  final String foodId;
  final String foodName;
  final String foodCategory;
  final String foodDetail;
  final String foodPicture;

  FoodDetail(
      {this.foodId,
      this.foodName,
      this.foodCategory,
      this.foodDetail,
      this.foodPicture});

  factory FoodDetail.fromJson(Map<String, dynamic> json) {
    return FoodDetail(
      foodId: json['idMeal'],
      foodName: json['strMeal'],
      foodCategory: json['strCategory'],
      foodDetail: json['strInstructions'],
      foodPicture: json['strMealThumb'],
    );
  }
}
