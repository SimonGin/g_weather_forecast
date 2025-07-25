import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/current/models.dart';
import 'package:g_weather_forecast/services/dio_client.dart';

Future<ForecastCurrentResponse?> forecastCurrentWeather(
  ForecastCurrentRequest req,
) async {
  Dio dio = DioClient().dio;

  try {
    Response response = await dio.get(
      "/current.json?q=${req.cityName}&key=b6301c9f212f4d709ad14708252507",
    );
    switch (response.statusCode) {
      case 200:
        ForecastCurrentResponse res = ForecastCurrentResponse.fromJson(
          response.data,
        );
        return res;
      default:
        return null;
    }
  } catch (e) {
    debugPrint("Error: $e");
  }
  return null;
}
