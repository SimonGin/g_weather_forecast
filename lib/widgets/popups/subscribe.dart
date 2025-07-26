import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/widgets/buttons/wide_btn.dart';
import 'package:validatorless/validatorless.dart';

class SubscribePopup extends StatelessWidget {
  final subscribeFormKey = GlobalKey<FormState>();
  SubscribePopup({super.key});

  Future<void> subscibeEmail() async {
    if (subscribeFormKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: viewport.width * 0.4,
        constraints: BoxConstraints(maxHeight: viewport.height * 0.5),
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
                "Daily Weather Forecast",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              Text(
                "Subscribe to receive daily weather forecasts directly in your inbox. Stay prepared for any weather conditions!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Email Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "example123@site.com",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required("Email is required"),
                  Validatorless.email("Please enter a valid email"),
                ]),
                style: TextStyle(fontSize: 24),
              ),
              WideButton(title: "Subscribe", onTap: () => subscibeEmail()),
              Text(
                "You can unsubscribe at any time. We respect your privacy.",
                style: TextStyle(color: Colors.grey, fontSize: 18),
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
