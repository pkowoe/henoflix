import 'package:henoflix/pages/onboarding_page.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MyLoadingPage extends StatefulWidget {
  const MyLoadingPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoadingPage> createState() => _MyLoadingPageState();
}

class _MyLoadingPageState extends State<MyLoadingPage> {
  @override
  void initState() {
    // demarre le Timer qui est en bas
    super.initState();
    loadAnimation();
  }

  Future<Timer> loadAnimation() async {
    return Timer(
      Duration(seconds: 3),
      onLoaded,
    ); // le timer attend 3s et appelle le onLoaded
  }

  dynamic onLoaded() {
    // apres les 3s affiche maintenant la page MyHomePage
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => OnboardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(
          'assets/lotties/netflix.json',
          repeat: false,
        ), // package lottie pour mettre des animations
      ),
    );
  }
}
