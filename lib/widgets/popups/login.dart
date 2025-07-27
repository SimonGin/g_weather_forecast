import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/widgets/buttons/wide_btn.dart';

class LoggedInPopup extends StatelessWidget {
  final emailCtrler = TextEditingController();
  final subscribeFormKey = GlobalKey<FormState>();
  LoggedInPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: viewport.width * 0.4,
        constraints: BoxConstraints(maxHeight: viewport.height * 0.4),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Form(
          key: subscribeFormKey,
          child: Column(
            spacing: 15,
            children: [
              Icon(Icons.notification_add, color: gViolet, size: 50),
              Text(
                "Successfully subscribed",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              Text(
                "You have successfully subscribed to receive daily weather forecasts directly in your inbox. Stay prepared for any weather conditions!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              WideButton(
                title: "Change email",
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
