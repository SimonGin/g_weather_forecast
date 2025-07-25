// Request
typedef SearchLocationRequest = ({String query});

// Response
class SearchLocationResponse {
  final List<LocationItem> locations;

  SearchLocationResponse({required this.locations});

  factory SearchLocationResponse.fromJson(List<dynamic> json) {
    return SearchLocationResponse(
      locations: json.map((e) => LocationItem.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'SearchLocationResponse(locations: $locations)';
  }
}

class LocationItem {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  LocationItem({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  @override
  String toString() {
    return 'LocationItem(id: $id, name: $name, region: $region, country: $country, lat: $lat, lon: $lon, url: $url)';
  }

  factory LocationItem.fromJson(Map<String, dynamic> json) {
    return LocationItem(
      id: json['id'],
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      url: json['url'],
    );
  }
}
