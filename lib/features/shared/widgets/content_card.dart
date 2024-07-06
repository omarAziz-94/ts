import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';

class ContentCard extends StatelessWidget {
  final Widget child;

  const ContentCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Material(
        color: AppColors.white,
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
