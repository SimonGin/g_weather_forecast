import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/search_location/models.dart';
import 'package:g_weather_forecast/services/dio_client.dart';

Future<SearchLocationResponse?> searchLocation(
  SearchLocationRequest req,
) async {
  Dio dio = DioClient().dio;

  try {
    Response response = await dio.get(
      "/search.json?q=${req.query}&key=b6301c9f212f4d709ad14708252507",
    );
    switch (response.statusCode) {
      case 200:
        SearchLocationResponse res = SearchLocationResponse.fromJson(
          response.data,
        );
        debugPrint("Search Location Response: $res");
        return res;
      default:
        return null;
    }
  } catch (e) {
    debugPrint("Error: $e");
  }
  return null;
}
