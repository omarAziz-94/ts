import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/features/auth/controller/auth_cubit.dart';
import 'package:parent/features/auth/pages/auth_page.dart';
import 'package:parent/features/home/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/features/splash/controller/splash_cubit.dart';
import 'package:parent/features/splash/widgets/splash_view.dart';
import 'package:parent/l10n/l10n.dart';

/// This is the entry point of the app.
/// Shows the splash animation while fetching the user local data to check if
/// the user is already logged in. If the user is logged in, the app will
/// navigate to the home page. If the user is not logged in, the app will
/// navigate to the login page.
///
///
class SplashPage extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
      ],
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // wait until the splash animation is finished
    Future.delayed(const Duration(seconds: 2), () {
      context.read<SplashCubit>().initSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      listener: (context, state) {
        AppLog.i('Auth state in Splash page: $state');
        if (state is LoginCompleted) {
          // user already logged in
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        } else if (state is AuthNotFound) {
          // no user found in local storage
          Navigator.of(context).pushReplacementNamed(AuthPage.routeName);
        }else if(state is LoginError){
          AppLog.showSnackBar(context,context.localizeError(state.message));
        }
      },
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashCompleted) {
            context.read<AuthCubit>().checkAuth();
          }
        },
       buildWhen: (_, __) => false,
        builder: (context, state) {
          return const Scaffold(
            backgroundColor: AppColors.primary,
            body: SplashAnimation(),
          );
        },
      ),
    );
  }
}
