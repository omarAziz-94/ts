import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/shared/clippers/auth_packground_clipper.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primary,
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: AuthBackgroundClipper(),
            child: Container(
              color: AppColors.secondary,
              width: double.infinity,
              height: 400,
            ),
          ),
        ),
      ],
    );
  }
}
