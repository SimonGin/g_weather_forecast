import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/firebase_options.dart';
import 'package:g_weather_forecast/providers/location.dart';
import 'package:g_weather_forecast/screens/home/scr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // required before calling async code
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
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
