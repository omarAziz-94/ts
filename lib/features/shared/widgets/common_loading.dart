import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
