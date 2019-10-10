// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
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
      print('Food Screen');
    });

    test('Food Page AppBar Test', () async {
      await driver.waitFor(foodScreen);
      print('Food Screen');
      await driver.waitFor(appBar);
      print('Food Screen App Bar');
      expect(await driver.getText(appBarTitle), 'Mealio');
      print('App Bar Title Mealio');
    });

    test('Bottom Navbar Item Test', () async {
      await driver.waitFor(bottomNavbarFoodPageFinder);
      print('Bottom Navbar Food Page found!');

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
      await driver.tap(bottomNavbarFoodPageSeafoodFinder);
      print('Food Page');
      await driver.waitFor(scaffoldSeafoodPage);
      print('Food Scaffold');
      await driver.waitFor(gridViewSeafoodPage);
      print('Food GridView');
      await driver.waitFor(cardSeafoodPage0);
      print('Food Card');
      await driver.tap(cardSeafoodPage0);
      print('CARD INDEX 0 TAPPED');
      expect(await driver.getText(appBarDetailTitle), TypeMatcher<String>());
      await driver.waitFor(imageFoodDetail);
      print('Food Detail Image');
      await driver.waitFor(textFoodDetail);
      print('Food Detail Text');
      await driver.tap(detailBackButton);
      print('Back to previous page');
      await driver.waitFor(gridViewSeafoodPage);
      print('previous page');
    });
  });
}
