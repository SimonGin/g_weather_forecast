import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/widgets/cards/future_weather_card.dart';
import 'package:g_weather_forecast/widgets/buttons/wide_btn.dart';

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
            SizedBox(
              width: viewport.width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 20,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter a City Name",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "E.g., New York, London, Tokyo",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                  WideButton(title: "Search", onTap: () {}),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey, // Line color
                          thickness: 1, // Line thickness
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or",
                          style: TextStyle(
                            color: Colors.grey, // Text color
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey, // Line color
                          thickness: 1, // Line thickness
                        ),
                      ),
                    ],
                  ),
                  WideButton(
                    title: "Use Current Location",
                    bgColor: gDarkGrey,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              width: viewport.width * 0.63,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 25,
                    ),
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
                          children: const [
                            Text(
                              "London (2023-06-19)",
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
                                  "Temperature: 18.71°C",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Wind: 4.31 M/S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Humidity: 76%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
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
                                'https://cdn.weatherapi.com/weather/128x128/day/113.png',
                                width: 128,
                                height: 128,
                              ),

                              Text(
                                "Moderate rain",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
