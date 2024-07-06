
import 'package:flutter/material.dart';

class AuthBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.15, 0, size.width * 0.6, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
