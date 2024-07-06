import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/constants/images.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/features/home/pages/home_page.dart';
import 'package:parent/features/settings/pages/settings_page.dart';
import 'package:parent/features/splash/pages/splash_page.dart';
import 'package:parent/l10n/l10n.dart';

import '../../auth/controller/auth_cubit.dart';
import 'drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 64),
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 40,
            backgroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser?.photoURL ?? ''),
          ),
          const SizedBox(height: 16),
          Text(
            context.read<AuthCubit>().userService.userName,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: AppColors.white,
                ),
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.lightGrey),
          DrawerItem(
            iconSVG: Images.childrenSVG,
            title: context.l10n.myChildren,
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false),
          ),
          DrawerItem(
            iconSVG: Images.settingsSVG,
            title: context.l10n.settings,
            onTap: () =>
                Navigator.popAndPushNamed(context, SettingsPage.routeName),
          ),
          const Spacer(),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LogoutCompleted) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SplashPage.routeName, (route) => false);
              } else if (state is LogoutError) {
                AppLog.showSnackBar(
                    context, context.localizeError(state.message));
              }
            },
            builder: (context, state) {
              return DrawerItem(
                iconSVG: Images.logoutSVG,
                title: context.l10n.logout,
                isDistinctColor: true,
                onTap: (state is LogoutLoading)
                    ? null
                    : () async {
                        context.read<AuthCubit>().logout();
                      },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
