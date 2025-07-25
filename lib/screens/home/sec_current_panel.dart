import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/current/models.dart';
import 'package:g_weather_forecast/consts/color.dart';

class CurrentWeatherPanel extends StatelessWidget {
  final ForecastCurrentResponse? currentForecast;

  const CurrentWeatherPanel({super.key, this.currentForecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
      decoration: BoxDecoration(
        color: gViolet,
        borderRadius: BorderRadius.circular(10),
      ),
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
    );
  }
}
