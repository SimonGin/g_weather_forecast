import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/current/ctrler.dart';
import 'package:g_weather_forecast/apis/current/models.dart';
import 'package:g_weather_forecast/apis/search_location/ctrler.dart';
import 'package:g_weather_forecast/apis/search_location/models.dart';
import 'package:g_weather_forecast/models/location_item.dart';

class LocationProvider extends ChangeNotifier {
  String selectedLocationStr = "";
  List<LocationItem> locationList;
  ForecastCurrentResponse? forecastCurrentRes;
  String query = "";

  LocationProvider({this.locationList = const []});

  Future<void> getListFromSearchApi() async {
    SearchLocationResponse? res = await searchLocation((query: query));
    if (res != null) {
      locationList = res.data;
    }
  }

  Future<void> getCurrentForecast() async {
    ForecastCurrentResponse? res = await forecastCurrentWeather((
      cityName: selectedLocationStr,
    ));
    if (res != null) {
      forecastCurrentRes = res;
    }
  }

  void changeQuery(String query) {
    this.query = query;
    updateLocationList();
    notifyListeners();
  }

  void updateLocationList() async {
    await getListFromSearchApi();
    notifyListeners();
  }

  void selectLocation(String location) async {
    selectedLocationStr = location;
    await getCurrentForecast();
    notifyListeners();
  }
}
