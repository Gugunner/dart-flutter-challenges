import 'package:http/http.dart';

const String keky1 = '7ed6f094d8e99a9f';
const String keky2 = 'b3ade39bbc98e84e';
const String apild = '26666772';
const String urlPath = 'https://api.edamam.com/search';

class RecipeService {
  Future getData(String url) async {
    print('Calling url: $url');
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
      '$urlPath?app_id=$apild&app_key=$keky1&q=$query&from=$from&to-$to'
    );
    return recipeData;
  }
}