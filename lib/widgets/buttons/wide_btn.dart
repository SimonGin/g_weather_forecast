import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';

class WideButton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Function onTap;

  const WideButton({
    super.key,
    required this.title,
    this.bgColor = gViolet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => onTap(),
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
          backgroundColor: WidgetStatePropertyAll(bgColor),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ), // Sharp corners
            ),
          ),
        ),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
