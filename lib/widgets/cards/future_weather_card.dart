import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';

class FutureWeatherCard extends StatelessWidget {
  final String ymd;
  final String temp;
  final String wind;
  final String humid;

  const FutureWeatherCard({
    super.key,
    required this.ymd,
    required this.temp,
    required this.wind,
    required this.humid,
  });

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
            "($ymd)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            'https://cdn.weatherapi.com/weather/64x64/day/302.png',
            width: 64,
            height: 64,
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              Text(
                "Temp: $temp",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Wind: $wind",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Humidity: $humid",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
