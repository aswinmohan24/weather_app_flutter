import 'package:flutter/material.dart';

class BgContainerWidget extends StatelessWidget {
  final double startAxisAlign;
  final double yAxisAlign;
  const BgContainerWidget({
    super.key,
    required this.startAxisAlign,
    required this.yAxisAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(startAxisAlign, yAxisAlign),
      child: Container(
        height: 300,
        width: 300,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.indigo[900]),
      ),
    );
  }
}
