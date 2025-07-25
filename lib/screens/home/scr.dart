import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/providers/location.dart';
import 'package:g_weather_forecast/screens/home/sec_current_panel.dart';
import 'package:g_weather_forecast/screens/home/sec_locations.dart';
import 'package:g_weather_forecast/widgets/cards/future_weather_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: gViolet,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Row(
          spacing: viewport.width * 0.03,
          children: [
            LocationSection(),
            SizedBox(
              width: viewport.width * 0.63,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  CurrentWeatherPanel(
                    currentForecast: context
                        .watch<LocationProvider>()
                        .forecastCurrentRes,
                  ),
                  Text(
                    "4-day forecast",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureWeatherCard(
                        ymd: "2023-06-20",
                        temp: "18.71°C",
                        wind: "4.31 M/S",
                        humid: "76%",
                      ),
                      FutureWeatherCard(
                        ymd: "2023-06-20",
                        temp: "18.71°C",
                        wind: "4.31 M/S",
                        humid: "76%",
                      ),
                      FutureWeatherCard(
                        ymd: "2023-06-20",
                        temp: "18.71°C",
                        wind: "4.31 M/S",
                        humid: "76%",
                      ),
                      FutureWeatherCard(
                        ymd: "2023-06-20",
                        temp: "18.71°C",
                        wind: "4.31 M/S",
                        humid: "76%",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
