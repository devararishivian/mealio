import 'package:mealio/constant.dart';
import 'package:mealio/models/food_model.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:mealio/services/food_service.dart';

class MockClient extends Mock implements http.Client {}

FoodService fs = FoodService();

void main() {
  final client = MockClient();
  group('FoodServiceTest', () {
    test(
        'returns food list where category is seafood if the http call completes successfully ',
        () async {
      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'))
          .thenAnswer((_) async => http.Response(Food().toString(), 200));

      expect(await fs.getFoodByCategory(kSeafood), TypeMatcher<List<Food>>());
    });
    test('returns food detail by id if the http call completes successfully ',
        () async {
      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/lookup.php?i=52979'))
          .thenAnswer((_) async => http.Response(FoodDetail().toString(), 200));

      expect(await fs.getFoodById('52979'), TypeMatcher<List<FoodDetail>>());
    });
  });
}
