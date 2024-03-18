import 'package:flutter/material.dart';

class HomeScreenLoadingWidget extends StatelessWidget {
  const HomeScreenLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_screen_logo.png',
              scale: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: LinearProgressIndicator(
                minHeight: 3,
              ),
            )
          ],
        ),
      )),
    );
  }
}
