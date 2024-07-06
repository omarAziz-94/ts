import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final double height;

  const CustomAppBar({
    required this.title,
    this.leading,
    this.trailing,
    this.height = 110,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Container(
        height: preferredSize.height,
        color: AppColors.primary,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Center(child: leading ?? defaultLeading(context))),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.white),
            ),
            SizedBox(width: 24, height: 24, child: Center(child: trailing)),
          ],
        ),
      ),
    );
  }

  Widget defaultLeading(BuildContext context) {
    return GestureDetector(
      child: const SizedBox(
          width: 24,
          height: 24,
          child: Icon(Icons.arrow_back_rounded, color: AppColors.white)),
      onTap: () => Navigator.of(context).pop(),
    );
  }
}
