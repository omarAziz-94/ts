import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/theme/theme.dart';
import 'package:parent/core/utils/navigation_log.dart';
import 'package:parent/features/auth/controller/auth_cubit.dart';
import 'package:parent/features/auth/repositories/user_repository/user_repository.dart';
import 'package:parent/features/auth/services/user_service.dart';
import 'package:parent/features/student_details/controllers/active_trips/active_trips_cubit.dart';
import 'package:parent/features/student_details/controllers/details/student_details_cubit.dart';
import 'package:parent/features/student_details/controllers/trips_history/trips_history_cubit.dart';
import 'package:parent/l10n/controller/localization_cubit.dart';
import 'package:parent/l10n/l10n.dart';
import 'package:parent/router/routes.dart';

import 'features/splash/pages/splash_page.dart';

class ParentApp extends StatelessWidget {
  const ParentApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(UserService(UserRepository())),
        ),
        BlocProvider<StudentDetailsCubit>(create: (context) => StudentDetailsCubit()),
        BlocProvider<ActiveTripsCubit>(create: (context) => ActiveTripsCubit()),
        BlocProvider<TripsHistoryCubit>(create: (context) => TripsHistoryCubit()),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: MaterialApp(
              title: 'Parent',
              theme: AppTheme.themeData,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
               locale: context.read<LocalizationCubit>().locale,
              initialRoute: SplashPage.routeName,
              navigatorKey: Routes.navigatorKey,
              navigatorObservers: [NavigationLogger()],
              scaffoldMessengerKey: Routes.scaffoldMessengerKey,
              routes: Routes.routes,
            ),
          );
        },
      ),
    );
  }
}
