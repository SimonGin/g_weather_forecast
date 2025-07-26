import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g_weather_forecast/apis/current/models.dart';
import 'package:g_weather_forecast/widgets/cards/history_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryDrawer extends StatefulWidget {
  const HistoryDrawer({super.key});

  @override
  State<HistoryDrawer> createState() => _HistoryDrawerState();
}

class _HistoryDrawerState extends State<HistoryDrawer> {
  List<ForecastCurrentResponse> history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('weather_history');
    if (jsonString != null) {
      final List<dynamic> decoded = jsonDecode(jsonString);
      final List<ForecastCurrentResponse> models = decoded
          .map((json) => ForecastCurrentResponse.fromJson(json))
          .toList();

      if (!mounted) return; // <- Prevents setState if widget is disposed
      setState(() {
        history = models;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    return Drawer(
      width: viewport.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Weather History",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  history.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              history.clear();
                            });
                            final prefs = SharedPreferences.getInstance();
                            prefs.then(
                              (value) => value.remove('weather_history'),
                            );
                          },
                          icon: Icon(Icons.clear_all, size: 35),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            Expanded(
              child: history.isEmpty
                  ? Center(
                      child: Text(
                        "No history available",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: HistoryCard(history: history[index]),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
