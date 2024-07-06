import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent/core/constants/colors.dart';

class DrawerItem extends StatelessWidget {
  final String iconSVG;
  final String title;
  final Function? onTap;
  final bool isDistinctColor;

  const DrawerItem(
      {required this.title,
      required this.iconSVG,
      required this.onTap,
      this.isDistinctColor = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap == null?null:onTap!(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: SvgPicture.asset(
                iconSVG,
                color: isDistinctColor ? AppColors.secondary : AppColors.white,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color:
                        isDistinctColor ? AppColors.secondary : AppColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
