import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent/core/constants/images.dart';
import 'package:parent/features/about/pages/about_app_page.dart';
import 'package:parent/features/settings/controllers/notifications_cubit.dart';
import 'package:parent/features/settings/pages/widgets/notifications_switch.dart';
import 'package:parent/features/shared/widgets/custom_appbar.dart';
import 'package:parent/l10n/l10n.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.settings,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ListTile(
            title: Text(
              context.l10n.aboutApp,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            leading: SvgPicture.asset(
              Images.infoSVG,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
            onTap: () =>
                Navigator.of(context).pushNamed(AboutAppPage.routeName),
          ),
          const SizedBox(height: 16),
          BlocProvider<NotificationsControllerCubit>(
            create: (context) =>
                NotificationsControllerCubit()..checkNotifications(),
            child: const NotificationsSwitch(),
          ),
        ],
      ),
    );
  }
}
