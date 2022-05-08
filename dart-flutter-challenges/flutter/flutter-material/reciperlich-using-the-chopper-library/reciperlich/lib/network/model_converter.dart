import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:reciperlich/network/model_response.dart';
import 'package:reciperlich/network/recipe_model.dart';

class ModelConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    final req = applyHeader(
        request,
        contentTypeKey,
        jsonHeaders,
      override: false,
    );
    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      chopperLogger.info('Starting try');
      final mapData = json.decode(body);
      chopperLogger.info('mapData was created from body');
      if (mapData['status'] != null) {
        chopperLogger.info('Found a status property in mapData');
        return response.copyWith<BodyType>(
          body: Error(Exception(mapData['status'])) as BodyType,
        );
      }
      chopperLogger.info('Starting to create a map from json for API RECIPE');
      final recipeQuery = APIRecipeQuery.fromJson(mapData);
      chopperLogger.info('Created an api recipe from Json');
      return response.copyWith<BodyType>(
        body: Success(recipeQuery) as BodyType,
      );
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(
        body: Error(e as Exception) as BodyType,
      );
    }
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }

}