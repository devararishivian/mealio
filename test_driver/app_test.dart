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

    test('Food Page AppBar Test', () async {
      await driver.waitFor(foodScreen);
      await driver.waitFor(appBar);
      expect(await driver.getText(appBarTitle), 'Mealio');
    });

    test('Food Screen Test', () async {
      await driver.waitFor(bottomNavbarFoodPageFinder);
      print('Bottom Navbar Food Page found!');

      await driver.tap(bottomNavbarFoodPageSeafoodFinder);
      await driver.tap(bottomNavbarFoodPageDessertFinder);

      await driver.waitFor(gridViewDessertPage);

      await driver.waitFor(cardDessertPage0);

      expect(await driver.getText(cardTextDessertPage0), TypeMatcher<String>());
      print('This is Dessert section');
      // expect(
      //     await driver.getText(bottomNavbarFoodPageDessertFinder), "Seafood");
    });
  });
}
