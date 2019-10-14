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
  });
}
