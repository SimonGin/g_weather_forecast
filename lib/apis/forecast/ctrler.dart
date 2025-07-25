import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/forecast/models.dart';
import 'package:g_weather_forecast/services/dio_client.dart';

Future<NearForecastResponse?> forecastNearWeather(
  NearForecastRequest req,
) async {
  Dio dio = DioClient().dio;

  try {
    Response response = await dio.get(
      "/forecast.json?q=${req.cityName}&days=${req.days}&key=b6301c9f212f4d709ad14708252507",
    );
    switch (response.statusCode) {
      case 200:
        NearForecastResponse res = NearForecastResponse.fromJson(response.data);
        debugPrint(res.forecastDay[0].condition.code.toString());
        return res;
      default:
        return null;
    }
  } catch (e) {
    debugPrint("Error: $e");
  }
  return null;
}
