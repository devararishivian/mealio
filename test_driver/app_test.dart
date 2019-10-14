// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:mealio/constant.dart';
import 'package:test/test.dart';
import 'package:mealio/key_finder.dart';

void main() {
  group('Mealio App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Food Screen Test', () async {
      await driver.waitFor(foodScreen);
      print('Food screen found');
    });

    test('Food Page AppBar Test', () async {
      await driver.waitFor(foodScreen);
      await driver.waitFor(appBar);
      print('Food screen appbar found');
      expect(await driver.getText(appBarTitle), kMainTitle);
      print('App Bar Title = Mealio');
      print('Done Food Page AppBar Test');
    });

    test('Bottom Navbar Item Test', () async {
      await driver.waitFor(bottomNavbarFoodPageFinder);
      print('Bottom Navbar Food Page found!');

      await driver.tap(bottomNavbarFoodPageDessertFinder);
      await driver.waitFor(scaffoldDessertPage);
      print('Dessert Page Scaffold');
      await driver.waitFor(fabDessertPage);
      print('Dessert Page FAB');
      await driver.waitFor(gridViewDessertPage);
      await driver.waitFor(cardDessertPage0);
      expect(await driver.getText(cardTextDessertPage0), TypeMatcher<String>());
      await driver.waitFor(cardImageDessertPage0);
      print('Done Dessert section');

      await driver.tap(bottomNavbarFoodPageSeafoodFinder);
      print('Clicked Seafood Bottom Navbar');
      await driver.waitFor(scaffoldSeafoodPage);
      print('Seafood Page Scaffold');
      await driver.waitFor(fabSeafoodPage);
      print('Seafood Page FAB');
      await driver.waitFor(gridViewSeafoodPage);
      await driver.waitFor(cardSeafoodPage0);
      expect(await driver.getText(cardTextSeafoodPage0), TypeMatcher<String>());
      await driver.waitFor(cardImageSeafoodPage0);
      print('Done Seafood section');

      await driver.tap(bottomNavbarFoodPageFavoriteFinder);
      await driver.waitFor(favoriteTabbar);
      print('Favorite Page Tabbar');
      await driver.waitFor(favoriteDessertTab);
      print('Favorite Page Dessert Tab');
      await driver.waitFor(favoriteSeafoodTab);
      print('Favorite Page Seafood Tab');
      await driver.waitFor(favoriteFutureBuilder);
      print('Favorite Page');
      print('Done Favorite section');
    });

    test('Food Detail Test', () async {
      await driver.tap(bottomNavbarFoodPageDessertFinder);
      print('Dessert Food Page');
      await driver.waitFor(scaffoldDessertPage);
      await driver.waitFor(gridViewDessertPage);
      await driver.waitFor(cardDessertPage0);
      String dessertFoodTextIndex0 = await driver.getText(cardTextDessertPage0);
      await driver.tap(cardDessertPage0);
      print('Dessert Food Index 0 Tapped');
      await driver.waitFor(scaffoldFoodDetail);
      expect(await driver.getText(appBarDetailTitle), dessertFoodTextIndex0);
      await driver.waitFor(imageFoodDetail);
      print('Food Detail Image');
      await driver.waitFor(textFoodDetail);
      print('Food Detail Text');
      await driver.tap(favoriteButton);
      print('Food added to favorite');
      await driver.tap(detailBackButton);
      print('Back to previous page');
      await driver.waitFor(gridViewDessertPage);
      print('Dessert Page');

      await driver.tap(bottomNavbarFoodPageSeafoodFinder);
      print('Seafood Food Page');
      await driver.waitFor(scaffoldSeafoodPage);
      await driver.waitFor(gridViewSeafoodPage);
      await driver.waitFor(cardSeafoodPage0);
      String seafoodFoodTextIndex0 = await driver.getText(cardTextSeafoodPage0);
      await driver.tap(cardSeafoodPage0);
      print('Seafood Food Index 0 Tapped');
      await driver.waitFor(scaffoldFoodDetail);
      expect(await driver.getText(appBarDetailTitle), seafoodFoodTextIndex0);
      await driver.waitFor(imageFoodDetail);
      print('Food Detail Image');
      await driver.waitFor(textFoodDetail);
      print('Food Detail Text');
      await driver.tap(favoriteButton);
      print('Food added to favorite');
      await driver.tap(detailBackButton);
      print('Back to previous page');
      await driver.waitFor(gridViewSeafoodPage);
      print('Seafood Page');
    });

    Future<String> getDessertFoodTextIndex0() async {
      return "Apple & Blackberry Crumble";
    }

    Future<String> getSeafoodFoodTextIndex0() async {
      return "Baked salmon with fennel & tomatoes";
    }

    test('Favorite Page Test', () async {
      print(
          'We have favorited some dessert and seafood food before, so we check if there is that favorited food exists in favorite view');
      Future<String> dessertFoodTextIndex0 = getDessertFoodTextIndex0();
      Future<String> seafoodFoodTextIndex0 = getSeafoodFoodTextIndex0();
      await driver.tap(bottomNavbarFoodPageFavoriteFinder);
      print('Favorite Page');

      await driver.waitFor(scaffoldFavorite);
      await driver.waitFor(favoriteTabbar);
      await driver.waitFor(favoriteTabbarView);

      await driver.tap(favoriteDessertTab);
      await driver.waitFor(favoriteFutureBuilder);
      await driver.waitFor(favoriteGridView);
      expect(
          await driver.getText(favoriteCardText0), await dessertFoodTextIndex0);
      print('match');
      await driver.tap(favoriteCard0);
      print('Card tapped');
      await driver.tap(favoriteButton);
      print('removed from favorite');
      await driver.tap(detailBackButton);
      print('back');

      await driver.tap(favoriteSeafoodTab);
      await driver.waitFor(favoriteFutureBuilder);
      await driver.waitFor(favoriteGridView);
      expect(
          await driver.getText(favoriteCardText0), await seafoodFoodTextIndex0);
      print('match');
      await driver.tap(favoriteCard0);
      print('Card tapped');
      await driver.tap(favoriteButton);
      print('removed from favorite');
      await driver.tap(detailBackButton);
      print('back');
    });

    test('Search function test', () async {
      // --- Dessert ---
      await driver.tap(bottomNavbarFoodPageDessertFinder);
      print('Dessert Food Page');
      await driver.waitFor(fabDessertPage);
      print('Dessert Page FAB');
      await driver.tap(fabDessertPage);
      print('FAB Tapped');

      await driver.waitFor(foodSearchSuggestionsList);
      print('Search suggestions loaded');
      await driver.waitFor(foodSearchSuggestionsListTileIndex0);
      expect(await driver.getText(foodSearchSuggestionsListTileTextIndex0),
          await getDessertFoodTextIndex0());
      await driver.tap(foodSearchSuggestionsListTileTextIndex0);
      print('1st Suggestions tapped');
      await driver.waitFor(scaffoldFoodDetail);
      expect(await driver.getText(appBarDetailTitle),
          await getDessertFoodTextIndex0());
      print('match');
      await driver.tap(detailBackButton);
      print('back');

      print('DONE');

      // await driver.waitFor(fabDessertPage);
      // print('Dessert Page FAB');
      // await driver.tap(fabDessertPage);
      // print('FAB Tapped again');

      // await driver.enterText('ap');
      // await driver.waitFor(foodSearchResultTextShortQuery);
      // print('search query is too short');
    });
  });
}
