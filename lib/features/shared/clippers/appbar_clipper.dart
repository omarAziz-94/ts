import 'package:flutter/material.dart';

class AppbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(10, size.height - 10, 32, size.height);
    path.lineTo(size.width - 25, size.height);
    path.quadraticBezierTo(
        size.width - 10, size.height - 10, size.width, size.height - 32);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
