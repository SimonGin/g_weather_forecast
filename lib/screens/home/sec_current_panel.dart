import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/current/models.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentWeatherPanel extends StatelessWidget {
  final ForecastCurrentResponse? currentForecast;

  const CurrentWeatherPanel({super.key, this.currentForecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: gViolet,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      "${currentForecast?.location.name} (${currentForecast?.location.localtime?.split(" ")[0]})",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 10,
                      children: [
                        Text(
                          "Temperature: ${currentForecast?.current.tempC} °C",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                        Text(
                          "Wind: ${currentForecast?.current.windKph} km/h",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                        Text(
                          "Humidity: ${currentForecast?.current.humidity}%",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Image.network(
                        'https:${currentForecast?.current.condition.icon.replaceAll("64x64", "128x128")}',
                        width: 128,
                        height: 128,
                      ),
                      Text(
                        "${currentForecast?.current.condition.text}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final jsonString = prefs.getString('weather_history');
                List<dynamic> jsonData = [];
                if (jsonString != null) {
                  jsonData = jsonDecode(jsonString);
                }
                jsonData.add(currentForecast?.toJson());

                // Save updated list
                await prefs.setString('weather_history', jsonEncode(jsonData));
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Saved to history",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: Icon(Icons.save, color: Colors.white, size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
