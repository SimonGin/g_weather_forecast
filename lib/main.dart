import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/providers/location.dart';
import 'package:g_weather_forecast/screens/home/scr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'G Weather Forecast',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: gViolet),
          textTheme: GoogleFonts.rubikTextTheme(),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
