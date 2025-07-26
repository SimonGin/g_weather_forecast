import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/current/models.dart';
import 'package:g_weather_forecast/consts/color.dart';

class HistoryCard extends StatelessWidget {
  final ForecastCurrentResponse history;

  const HistoryCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: gViolet,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    "${history.location.name} (${history.location.localtime?.split(" ")[0]})",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [
                      Text(
                        "Temperature: ${history.current.tempC} °C",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Wind: ${history.current.windKph} km/h",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Humidity: ${history.current.humidity} %",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
                      'https:${history.current.condition.icon}',
                      width: 64,
                      height: 64,
                    ),
                    Text(
                      history.current.condition.text,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                Text(
                  "${history.location.localtime?.split(" ")[1]}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Icon(Icons.watch_later_outlined, color: Colors.white, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
