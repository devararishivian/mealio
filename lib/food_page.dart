import 'package:flutter/material.dart';
import 'food_detail_page.dart';
import 'food_list.dart';

String mainTitle = 'Makanan Khas Indonesia';

class FoodPage extends StatelessWidget {
  const FoodPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainTitle),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: FoodList().countFoodList(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: GridTile(
                child: Card(
                  margin: EdgeInsets.all(20.0),
                  child: Hero(
                    tag: FoodList().getFoodName(index),
                    child: Image.asset(
                      'images/' + FoodList().getFoodPicture(index),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                footer: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(
                      FoodList().getFoodName(index),
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
                    builder: (context) => FoodDetailPage(index: index),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
