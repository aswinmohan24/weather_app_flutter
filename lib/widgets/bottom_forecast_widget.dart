import 'package:flutter/material.dart';

class BottomForecastWidget extends StatelessWidget {
  final String image;
  final String mainText;
  final String subText;

  const BottomForecastWidget(
      {super.key,
      required this.image,
      required this.mainText,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              subText,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        )
      ],
    );
  }
}
