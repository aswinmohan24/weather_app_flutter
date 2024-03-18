import 'package:flutter/material.dart';

class GetWeatherIcon extends StatelessWidget {
  const GetWeatherIcon({
    super.key,
    required this.weatherConditionCode,
  });

  final int weatherConditionCode;

  @override
  Widget build(BuildContext context) {
    switch (weatherConditionCode) {
      case >= 200 && < 300:
        return Image.asset('assets/images/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/images/2.png');

      case >= 500 && < 600:
        return Image.asset('assets/images/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/images/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/images/5.png');
      case == 800:
        return Image.asset('assets/images/6.png');
      case > 800 && <= 900:
        return Image.asset('assets/images/8.png');
      default:
        return Image.asset('assets/images/7.png');
    }
  }
}
