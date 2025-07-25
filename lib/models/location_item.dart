class LocationItem {
  final int? id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String? url;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  LocationItem({
    this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    this.url,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
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
      tzId: json['tz_id'],
      localtimeEpoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }

  factory LocationItem.placeholder() {
    return LocationItem(
      id: 0,
      name: 'placeholder',
      region: 'placeholder',
      country: 'placeholder',
      lat: 0,
      lon: 0,
      url: 'placeholder',
    );
  }
}
