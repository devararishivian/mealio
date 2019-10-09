import 'package:mealio/constant.dart';
import 'package:mealio/models/food_model.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:mealio/services/food_service.dart';

class MockClient extends Mock implements http.Client {}

FoodService fs = FoodService();
String baseApiUrl = "https://www.themealdb.com/api/json/v1/1";

void main() {
  group('FoodServiceTest', () {
    test(
        'returns food list where category is seafood if the http call completes successfully ',
        () async {
      final client = MockClient();
      when(client.get("$baseApiUrl/filter.php?c=Seafood"))
          .thenAnswer((_) async => http.Response(Food().toString(), 200));

      expect(await fs.getFoodByCategory('Seafood'), TypeMatcher<List<Food>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get("$baseApiUrl/filter.php?c=Seafood"))
          .thenAnswer((_) async => http.Response('{"meals":null}', 200));

      expect(fs.getFoodByCategory('RANDOMCATEGORY'), throwsException);
    });

    // test('returns food detail by id if the http call completes successfully ',
    //     () async {
    //   when(client.get(
    //           'https://www.themealdb.com/api/json/v1/1/lookup.php?i=52979'))
    //       .thenAnswer((_) async => http.Response(FoodDetail().toString(), 200));

    //   expect(await fs.getFoodById('52979'), TypeMatcher<List<FoodDetail>>());
    // });
  });
}
