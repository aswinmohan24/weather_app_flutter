import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/widgets/bg_container_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 1.2 * kToolbarHeight, 35, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BgContainerWidget(
                startAxisAlign: 9,
                yAxisAlign: -0.2,
              ),
              const BgContainerWidget(startAxisAlign: -9, yAxisAlign: -0.2),
              Align(
                alignment: const AlignmentDirectional(0, -1.3),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(color: Colors.lightBlueAccent[700]),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/splash_screen_logo.png',
                  scale: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
