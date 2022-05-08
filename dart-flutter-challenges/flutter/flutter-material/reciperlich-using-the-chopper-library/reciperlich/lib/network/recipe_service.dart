import 'package:chopper/chopper.dart';
import 'package:reciperlich/network/model_converter.dart';

import 'package:reciperlich/network/recipe_model.dart';
import 'package:reciperlich/network/model_response.dart';
part 'recipe_service.chopper.dart';

const String keky1 = '7ed6f094d8e99a9f';
const String keky2 = 'b3ade39bbc98e84e';
const String apild = '26666772';
const String urlPath = 'https://api.edamam.com';

//Add @ChopperApi() here
@ChopperApi()
abstract class RecipeService extends ChopperService {
  @Get(path: 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
        @Query('q') String query, @Query('from') int from, @Query('to') int to
      );

  //Add create()
  static RecipeService create() {
    final client = ChopperClient(
      baseUrl: urlPath,
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$RecipeService(),
      ]
    );
    return _$RecipeService(client);
  }
}

//Add _addQuery()
Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);
  params['app_id'] = apild;
  params['app_key'] = '$keky1$keky2';
  return req.copyWith(parameters: params);
}



