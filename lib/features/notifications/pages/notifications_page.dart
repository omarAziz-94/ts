import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/features/notifications/controller/notifications_cubit.dart';
import 'package:parent/features/notifications/repository/notifications_repository.dart';
import 'package:parent/features/notifications/services/notifications_service.dart';
import 'package:parent/features/notifications/widget/notifications_view.dart';
import 'package:parent/features/shared/widgets/custom_appbar.dart';
import 'package:parent/l10n/l10n.dart';

class NotificationsPage extends StatelessWidget {
  static const String routeName = '/notifications';

  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.notifications,
      ),
      body: BlocProvider(
        create: (_) => NotificationsCubit(
          NotificationsService(NotificationsRepository()),
        )..fetchNotifications(),
        child:const NotificationsView(),
      ),
    );
  }
}
