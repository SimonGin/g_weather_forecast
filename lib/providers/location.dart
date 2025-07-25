import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/search_location/ctrler.dart';
import 'package:g_weather_forecast/apis/search_location/models.dart';

class LocationProvider extends ChangeNotifier {
  List<LocationItem> locationList;
  String query = "";

  LocationProvider({this.locationList = const []});

  Future<void> getListFromSearchApi() async {
    SearchLocationResponse? res = await searchLocation((query: query));
    if (res != null) {
      locationList = res.data;
    }
  }

  void changeQuery(String query) {
    this.query = query;
    changeLocationList();
    notifyListeners();
  }

  void changeLocationList() async {
    await getListFromSearchApi();
    notifyListeners();
  }
}
