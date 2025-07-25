// Request
import 'package:g_weather_forecast/models/location_item.dart';
import 'package:g_weather_forecast/models/weather_condition.dart';

typedef ForecastCurrentRequest = ({String cityName});

// Response
class ForecastCurrentResponse {
  final LocationItem location;
  final ForecastItem current;

  ForecastCurrentResponse({required this.location, required this.current});

  factory ForecastCurrentResponse.fromJson(Map<String, dynamic> json) {
    return ForecastCurrentResponse(
      location: LocationItem.fromJson(json['location']),
      current: ForecastItem.fromJson(json['current']),
    );
  }
}

class ForecastItem {
  final double tempC;
  final double windKph;
  final int humidity;
  final WeatherCondition condition;

  ForecastItem({
    required this.tempC,
    required this.windKph,
    required this.humidity,
    required this.condition,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      tempC: json['temp_c'].toDouble(),
      windKph: json['wind_kph'].toDouble(),
      humidity: json['humidity'],
      condition: WeatherCondition.fromJson(json['condition']),
    );
  }
}
