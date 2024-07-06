import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/shared/widgets/common_loading.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double size;
  final bool shrink;
  final bool enabled;
  final bool outlined;

  const CustomButton(
      {required this.title,
      required this.onPressed,
      this.size = double.infinity,
      this.shrink = false,
      this.enabled = true,
      this.outlined = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: shrink ? null : double.infinity,
      height: shrink ? 42 : 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: outlined ? AppColors.white : AppColors.primary,
          minimumSize: const Size(100, 42),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          side: !outlined ? null : const BorderSide(color: AppColors.primary),
          textStyle: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: outlined ? AppColors.primary : AppColors.white),
        ),
        onPressed: enabled ? onPressed : null,
        child: enabled
            ? Text(
                title,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: outlined ? AppColors.primary : AppColors.white),
              )
            : const CommonLoading(),
      ),
    );
  }
}
