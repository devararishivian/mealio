import 'package:flutter/material.dart';
import 'package:mealio/constant.dart';
import 'package:mealio/helpers/db_helper.dart';
import 'package:mealio/models/favorite_model.dart';
import 'food_detail_page.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: Container(
              child: TabBar(
                key: Key('FAVORITE_PAGE_TABBAR'),
                tabs: [
                  Container(
                    height: 50.0,
                    child: Tab(
                      text: kDessert,
                      key: Key('FAVORITE_PAGE_DESSERT_TAB'),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    child: Tab(
                      text: kSeafood,
                      key: Key('FAVORITE_PAGE_SEAFOOD_TAB'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          key: Key('FAVORITE_PAGE_TABBAR_VIEW'),
          children: <Widget>[
            FavoriteView(foodCategory: kDessert),
            FavoriteView(foodCategory: kSeafood),
          ],
        ),
      ),
    );
  }
}

class FavoriteView extends StatefulWidget {
  FavoriteView({@required this.foodCategory});

  final String foodCategory;

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  var db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        key: Key('FAVORITE_FUTURE_BUILDER'),
        future: db.getFavorite(widget.foodCategory),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          var data = snapshot.data;
          return snapshot.hasData
              ? FavoriteGridView(data)
              : Center(
                  child: Text("No Data"),
                );
        },
      ),
    );
  }
}

class FavoriteGridView extends StatefulWidget {
  final List<Favorite> favoriteData;

  FavoriteGridView(this.favoriteData);

  @override
  _FavoriteGridViewState createState() => _FavoriteGridViewState();
}

class _FavoriteGridViewState extends State<FavoriteGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.favoriteData.length,
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
                    tag: widget.favoriteData[index].foodId,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        widget.favoriteData[index].foodPicture,
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
                        widget.favoriteData[index].foodName,
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
                  foodId: widget.favoriteData[index].foodId,
                  foodName: widget.favoriteData[index].foodName,
                  foodPicture: widget.favoriteData[index].foodPicture,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
