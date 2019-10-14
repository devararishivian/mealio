import 'package:flutter/material.dart';
import 'food_detail_page.dart';

class FoodSearchDelegate extends SearchDelegate {
  FoodSearchDelegate({@required this.foodCategory, @required this.foodList});
  final String foodCategory;
  final List foodList;

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      key: Key('FOOD_SEARCH_BACK_BUTTON'),
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              key: Key('FOOD_SEARCH_CLEAR_QUERY'),
              tooltip: 'Clear',
              icon: Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : Container(),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
              key: Key('FOOD_SEARCH_RESULT_TEXT_SHORT_QUERY'),
            ),
          )
        ],
      );
    }

    final results = foodList
        .where(
            (food) => food.foodName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "No Results Found.",
              key: Key('FOOD_SEARCH_RESULT_TEXT_NO_RESULT'),
            ),
          )
        ],
      );
    }

    return ListView.builder(
      key: Key('FOOD_SEARCH_RESULT_LIST'),
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: Key('FOOD_SEARCH_RESULT_LIST_TILE_INDEX_$index'),
          contentPadding: EdgeInsets.all(20),
          leading: Image.network(results[index].foodPicture),
          title: Text(
            results[index].foodName,
            key: Key('FOOD_SEARCH_RESULT_LIST_TILE_TEXT_INDEX_$index'),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailPage(
                  foodId: results[index].foodId,
                  foodName: results[index].foodName,
                  foodPicture: results[index].foodPicture,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? foodList
        : foodList
            .where((food) =>
                food.foodName.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      key: Key('FOOD_SEARCH_SUGGESTIONS_LIST'),
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: Key('FOOD_SEARCH_SUGGESTIONS_LIST_TILE_INDEX_$index'),
          contentPadding: EdgeInsets.all(20),
          leading: Image.network(suggestions[index].foodPicture),
          title: Text(
            suggestions[index].foodName,
            key: Key('FOOD_SEARCH_SUGGESTIONS_LIST_TILE_TEXT_INDEX_$index'),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailPage(
                  foodId: suggestions[index].foodId,
                  foodName: suggestions[index].foodName,
                  foodPicture: suggestions[index].foodPicture,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
