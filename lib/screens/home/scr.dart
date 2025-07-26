import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/providers/location.dart';
import 'package:g_weather_forecast/screens/home/history_drawer.dart';
import 'package:g_weather_forecast/screens/home/sec_current_panel.dart';
import 'package:g_weather_forecast/screens/home/sec_locations.dart';
import 'package:g_weather_forecast/widgets/cards/future_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.history_sharp, color: Colors.white, size: 35),
            ),
          ),
        ],
      ),
      endDrawer: HistoryDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Row(
          spacing: viewport.width * 0.03,
          children: [
            LocationSection(),
            context.watch<LocationProvider>().selectedLocationStr.isNotEmpty
                ? SizedBox(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${context.watch<LocationProvider>().daysShowing - 1}-day forecast",
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<LocationProvider>()
                                    .changeDaysShowing();
                              },
                              child:
                                  context
                                          .watch<LocationProvider>()
                                          .daysShowing ==
                                      5
                                  ? Text(
                                      "Show more",
                                      style: TextStyle(
                                        color: gViolet,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    )
                                  : Text(
                                      "Show less",
                                      style: TextStyle(
                                        color: gViolet,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [..._buildForecastRows(context)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: viewport.width * 0.63,
                    height: viewport.height * 0.8,
                    alignment: Alignment.center,
                    child: Text(
                      "Select a location to show the forecast information",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildForecastRows(BuildContext context) {
    final forecastList = context.watch<LocationProvider>().forecastDayList;

    List<Widget> rows = [];

    for (int i = 0; i < forecastList.length; i += 4) {
      final sublist = forecastList.skip(i).take(4).toList();

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sublist
              .map(
                (day) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: FutureCard(item: day),
                ),
              )
              .toList(),
        ),
      );
    }

    return rows;
  }
}
