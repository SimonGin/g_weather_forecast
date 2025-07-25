import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/forecast/models.dart';
import 'package:g_weather_forecast/consts/color.dart';

class FutureWeatherCard extends StatelessWidget {
  final ForecastDay item;

  const FutureWeatherCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    return Container(
      width: viewport.width * 0.15,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: gDarkGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Text(
            "(${item.date})",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network('https:${item.condition.icon}', width: 64, height: 64),
          Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              Text(
                "Temp: ${item.avgTempC} °C",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Wind: ${item.maxWindKph} K/H",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Humidity: ${item.avgHumidity} %",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
