import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BikgoSplashScreen extends StatefulWidget {
  const BikgoSplashScreen({Key? key}) : super(key: key);

  @override
  State<BikgoSplashScreen> createState() => _BikgoSplashScreenState();
}

class _BikgoSplashScreenState extends State<BikgoSplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 4), () async {
      //send user to main-screens
      FirebaseAuth.instance.currentUser == null
          ? Navigator.pushNamed(context, 'Home.id')
          : Navigator.pushNamed(context, 'Customer.id');
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
        decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/Bikgo-App-Splash.png"),
          fit: BoxFit.contain),
    ));
  }
}
