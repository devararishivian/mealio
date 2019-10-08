import 'package:flutter/material.dart';
import 'package:mealio/models/food_model.dart';
import 'package:mealio/services/food_service.dart';
import 'food_detail_page.dart';
import 'food_search_delegate.dart';

class SeafoodPage extends StatefulWidget {
  SeafoodPage({
    @required this.foodCategory,
  });

  final String foodCategory;

  @override
  _SeafoodPageState createState() => _SeafoodPageState();
}

class _SeafoodPageState extends State<SeafoodPage> {
  List<Food> foodList;

  @override
  void initState() {
    super.initState();
    _getFoodByCategory();
  }

  Future _getFoodByCategory() async {
    var foodService = FoodService();
    var response = await foodService.getFoodByCategory(widget.foodCategory);
    setState(() {
      foodList = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildCard(context);
  }

  SafeArea buildCard(BuildContext context) {
    if (foodList == null) {
      return SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: FoodSearchDelegate(
                  foodCategory: widget.foodCategory,
                  foodList: foodList,
                ),
              );
            },
            child: Icon(Icons.search),
            tooltip: 'Search',
          ),
          body: GridView.builder(
            itemCount: foodList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
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
                          tag: foodList[index].foodId,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              foodList[index].foodPicture,
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
                              foodList[index].foodName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailPage(
                        foodId: foodList[index].foodId,
                        foodName: foodList[index].foodName,
                        foodPicture: foodList[index].foodPicture,
                      ),
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
}
