import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/current/ctrler.dart';
import 'package:g_weather_forecast/apis/current/models.dart';
import 'package:g_weather_forecast/apis/forecast/ctrler.dart';
import 'package:g_weather_forecast/apis/forecast/models.dart';
import 'package:g_weather_forecast/apis/search_location/ctrler.dart';
import 'package:g_weather_forecast/apis/search_location/models.dart';
import 'package:g_weather_forecast/models/forecast_info.dart';
import 'package:g_weather_forecast/models/location_item.dart';

class LocationProvider extends ChangeNotifier {
  String selectedLocationStr = "";
  List<LocationItem> locationList;
  ForecastCurrentResponse? forecastCurrentRes;
  List<ForecastInfo> forecastDayList = [];
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

  Future<void> getNearForecast() async {
    NearForecastResponse? res = await forecastNearWeather((
      cityName: selectedLocationStr,
      days: 5,
    ));
    if (res != null) {
      forecastDayList = res.forecastDay;
      forecastDayList.removeAt(0);
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
    await getNearForecast();
    notifyListeners();
  }
}
