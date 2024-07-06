import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';

class CircleMarker extends StatelessWidget {
  final Color color;
final double size;
  const CircleMarker({this.color = AppColors.fail, this.size = 10, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
    );
  }
}
