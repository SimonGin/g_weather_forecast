import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/providers/location.dart';
import 'package:g_weather_forecast/widgets/buttons/wide_btn.dart';
import 'package:provider/provider.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    return SizedBox(
      width: viewport.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Enter a City Name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "E.g., New York, London, Tokyo",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(fontSize: 24),
            onChanged: (value) =>
                context.read<LocationProvider>().changeQuery(value),
          ),
          WideButton(
            title: "Search",
            onTap: () {
              context.read<LocationProvider>().changeLocationList();
            },
          ),
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
    );
  }
}
