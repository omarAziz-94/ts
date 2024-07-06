import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/constants/images.dart';
import 'package:parent/features/auth/models/student.dart';
import 'package:parent/features/shared/widgets/custom_button.dart';
import 'package:parent/l10n/l10n.dart';

class ChildChekInDialog extends StatelessWidget {
  final String title;
  final Student student;

  const ChildChekInDialog(
      {required this.title, required this.student, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            backgroundImage: NetworkImage(Images.getImage(student.image ?? '')),
            radius: 40,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 24),
          CustomButton(
              title: context.l10n.ok,
              shrink: true,
              onPressed: () => Navigator.of(context).pop()),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
