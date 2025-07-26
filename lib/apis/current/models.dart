// Request
import 'package:g_weather_forecast/models/forecast_info.dart';
import 'package:g_weather_forecast/models/location_item.dart';

typedef ForecastCurrentRequest = ({String cityName});

// Response
class ForecastCurrentResponse {
  final LocationItem location;
  final ForecastInfo current;

  ForecastCurrentResponse({required this.location, required this.current});

  factory ForecastCurrentResponse.fromJson(Map<String, dynamic> json) {
    return ForecastCurrentResponse(
      location: LocationItem.fromJson(json['location']),
      current: ForecastInfo.fromCurrentJson(json['current']),
    );
  }
}
