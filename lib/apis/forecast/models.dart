import 'package:g_weather_forecast/models/weather_condition.dart';

typedef NearForecastRequest = ({String cityName, int days});

class NearForecastResponse {
  final List<ForecastDay> forecastDay;

  NearForecastResponse({required this.forecastDay});

  factory NearForecastResponse.fromJson(Map<String, dynamic> json) {
    return NearForecastResponse(
      forecastDay: (json['forecast']['forecastday'] as List)
          .map((e) => ForecastDay.fromJson(e))
          .toList(),
    );
  }
}

class ForecastDay {
  final String date;
  final double avgTempC;
  final double maxWindKph;
  final int avgHumidity;
  final WeatherCondition condition;

  ForecastDay({
    required this.date,
    required this.maxWindKph,
    required this.avgTempC,
    required this.avgHumidity,
    required this.condition,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      avgTempC: (json['day']['avgtemp_c'] as num).toDouble(),
      maxWindKph: (json['day']['maxwind_kph'] as num).toDouble(),
      avgHumidity: json['day']['avghumidity'],
      condition: WeatherCondition.fromJson(json['day']['condition']),
    );
  }
}
