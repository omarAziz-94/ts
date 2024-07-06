import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/auth/controller/auth_cubit.dart';
import 'package:parent/features/home/controller/home_cubit.dart';
import 'package:parent/features/home/widgets/home_view.dart';
import 'package:parent/features/shared/widgets/app_drawer.dart';
import 'package:parent/features/shared/widgets/custom_appbar.dart';
import 'package:parent/features/shared/widgets/notifications_counter.dart';
import 'package:parent/l10n/l10n.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  dispose() {
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      appBar: CustomAppBar(
        title: context.l10n.welcomeText(
            context.read<AuthCubit>().userService.user?.lastName ?? ''),
        trailing: const NotificationsCounter(),
        leading: GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu, color: AppColors.white)),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..fetchSonsList(),
        child: const HomeView(),
      ),
    );
  }
}
