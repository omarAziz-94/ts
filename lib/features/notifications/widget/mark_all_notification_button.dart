import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/notifications/controller/notifications_cubit.dart';
import 'package:parent/l10n/l10n.dart';

class MarkAllNotificationButton extends StatelessWidget {
  const MarkAllNotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<NotificationsCubit>().markAllAsRead(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          context.l10n.markAllAsRead,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: AppColors.lightGrey),
        ),
      ),
    );
  }
}
