import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/features/settings/controllers/notifications_cubit.dart';
import 'package:parent/l10n/l10n.dart';

import '../../../../core/constants/images.dart';

class NotificationsSwitch extends StatelessWidget {
  const NotificationsSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        context.l10n.notifications,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      leading: SvgPicture.asset(
        Images.notificationsSVG,
        width: 32,
        height: 32,
        fit: BoxFit.cover,
      ),
      trailing: BlocConsumer<NotificationsControllerCubit, NotificationsState>(
        listener: (context, state) {
          if(state is NotificationsUpdateError) {
            AppLog.showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          final NotificationsControllerCubit notificationsCubit =
              context.read<NotificationsControllerCubit>();
          return CupertinoSwitch(
            value: notificationsCubit.isNotificationsEnabled,
            onChanged: state is NotificationsLoading
                ? null
                : (bool newValue) {
                    if (newValue) {
                      notificationsCubit.enableNotifications();
                    } else {
                      notificationsCubit.disableNotifications();
                    }
                  },
          );
        },
      ),
    );
  }
}
