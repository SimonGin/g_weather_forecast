// Request
import 'package:g_weather_forecast/models/location_item.dart';

typedef SearchLocationRequest = ({String query});

// Response
class SearchLocationResponse {
  final List<LocationItem> data;

  SearchLocationResponse({required this.data});

  factory SearchLocationResponse.fromJson(List<dynamic> json) {
    return SearchLocationResponse(
      data: json.map((e) => LocationItem.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'SearchLocationResponse(locations: $data)';
  }
}
