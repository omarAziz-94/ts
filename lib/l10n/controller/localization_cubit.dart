import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:parent/l10n/l10n.dart';

import '../l10n.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  Locale _locale = AppLocalizations.supportedLocales.firstWhere(
    (element) => element.languageCode == 'en',
    orElse: () => AppLocalizations.supportedLocales.last,
  );

  List<Locale> supportedLocales = AppLocalizations.supportedLocales;
  Locale get locale => _locale;

  set locale(Locale value) {
    AppLocalizations.supportedLocales.contains(value) ? _locale = value : null;
    emit(LocalizationChanged());
  }
}
