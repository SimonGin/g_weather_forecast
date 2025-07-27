import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_weather_forecast/consts/color.dart';
import 'package:g_weather_forecast/widgets/buttons/wide_btn.dart';
import 'package:g_weather_forecast/widgets/popups/login.dart';

class EmailVerifyPopup extends StatefulWidget {
  const EmailVerifyPopup({super.key});

  @override
  State<EmailVerifyPopup> createState() => _EmailVerifyPopupState();
}

class _EmailVerifyPopupState extends State<EmailVerifyPopup> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    if (isEmailVerified) return LoggedInPopup();
    return Dialog(
      child: Container(
        width: viewport.width * 0.4,
        constraints: BoxConstraints(maxHeight: viewport.height * 0.5),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          spacing: 15,
          children: [
            Icon(Icons.mark_email_read, color: gViolet, size: 50),
            Text(
              "Email Verification",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Text(
              "A verification email has been sent to your email address. Please click on the link in the email to verify your email address.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            WideButton(
              title: "Resent Email",
              onTap: () {
                sendVerificationEmail();
              },
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
    );
  }
}
