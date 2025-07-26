import 'package:g_weather_forecast/models/forecast_info.dart';

typedef NearForecastRequest = ({String cityName, int days});

class NearForecastResponse {
  final List<ForecastInfo> forecastDay;

  NearForecastResponse({required this.forecastDay});

  factory NearForecastResponse.fromJson(Map<String, dynamic> json) {
    return NearForecastResponse(
      forecastDay: (json['forecast']['forecastday'] as List)
          .map((e) => ForecastInfo.fromForecastJson(e))
          .toList(),
    );
  }
}
