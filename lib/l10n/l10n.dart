import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/constants/strings.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  String localizeError(String key) {
    switch (key) {
      case AppStrings.someThingWentWrong:
        return l10n.somethingWentWrong;
      case AppStrings.invalidCredentials:
        return l10n.invalidCredentials;
      case AppStrings.cannotFetchUser:
        return l10n.cannotFetchUser;
      case AppStrings.cannotStartTour:
        return l10n.cannotStartTour;
      case AppStrings.cannotFetchLines:
        return l10n.cannotFetchLines;
      case AppStrings.tourAlreadyStarted:
        return l10n.tourAlreadyStarted;
      case AppStrings.tourFailedToStart:
        return l10n.tourFailedToStart;
      case AppStrings.tourNotStarted:
        return l10n.tourNotStarted;
      case AppStrings.tourAlreadyEnded:
        return l10n.tourAlreadyEnded;
      case AppStrings.cannotEndTour:
        return l10n.cannotEndTour;
      case AppStrings.cannotAttendStudent:
        return l10n.cannotAttendStudent;
      case AppStrings.cannotStartStation:
        return l10n.cannotStartStation;
      case AppStrings.cannotFetchStudents:
        return l10n.cannotFetchStudents;
      case AppStrings.studentAlreadyAttended:
        return l10n.studentAlreadyAttended;
      case AppStrings.invalidDriverCard:
        return l10n.invalidDriverCard;
      case AppStrings.checkConnection:
        return l10n.checkConnection;
      case AppStrings.notAllowedToAccess:
        return l10n.notAllowedToAccess;
      case AppStrings.cannotFindData:
        return l10n.cannotFindData;
      case AppStrings.someThingWentWrongTryAgain:
        return l10n.someThingWentWrongTryAgain;
      case AppStrings.cannotFetchTrips:
        return l10n.cannotFetchTrips;
      case AppStrings.cannotFetchTripsHistory:
        return l10n.cannotFetchTripsHistory;
      case AppStrings.noActiveTrips:
        return l10n.noActiveTrips;
      case AppStrings.noHistory:
        return l10n.noHistory;
      case 'internal_error':
        return l10n.internal_error;
      case 'invalid_email':
        return l10n.invalid_email;
      case 'invalid_credential':
        return l10n.invalid_credential;
      case 'wrong_password':
        return l10n.wrong_password;
      case 'timeout':
        return l10n.timeout;
      case 'too_many_requests':
        return l10n.too_many_requests;
      case 'unverified_email':
        return l10n.unverified_email;
      case 'user_cancelled':
        return l10n.user_cancelled;
      case 'user_not_found':
        return l10n.user_not_found;
      case 'user_disabled':
        return l10n.user_disabled;

      default:
        return l10n.somethingWentWrong;
    }
  }
}
