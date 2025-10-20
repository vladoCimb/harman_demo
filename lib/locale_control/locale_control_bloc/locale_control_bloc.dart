import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../l10n/app_localizations.dart';

part 'locale_control_event.dart';

/// Keeps track of and allows changing the application's [Locale]
class LocaleControlBloc extends HydratedBloc<LocaleControlEvent, Locale> {
  // Get device locale if supported, otherwise fallback to English
  static Locale _getInitialLocale() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    final deviceLanguageCode = deviceLocale.languageCode;

    // Check if device locale is supported by looking at AppLocalizations.supportedLocales
    final supportedLanguageCodes = AppLocalizations.supportedLocales
        .map((locale) => locale.languageCode)
        .toList();

    if (supportedLanguageCodes.contains(deviceLanguageCode)) {
      return Locale(deviceLanguageCode);
    }

    return const Locale('en');
  }

  LocaleControlBloc() : super(_getInitialLocale()) {
    on<LocaleChanged>((event, emit) => emit(event.locale ?? state));
  }

  @override
  Locale fromJson(Map<String, dynamic> json) {
    var languageCode = json['languageCode'] as String?;
    var countryCode = json['countryCode'] as String?;

    // Get supported language codes from AppLocalizations
    final supportedLanguageCodes = AppLocalizations.supportedLocales
        .map((locale) => locale.languageCode)
        .toList();

    // If we have a saved language code, use it if supported, otherwise fallback to device locale
    if (languageCode != null && supportedLanguageCodes.contains(languageCode)) {
      return Locale.fromSubtags(
        languageCode: languageCode,
        countryCode: countryCode,
      );
    }

    // If no saved language or unsupported, use device locale if supported, otherwise English
    return _getInitialLocale();
  }

  @override
  Map<String, dynamic> toJson(Locale state) {
    return {
      'languageCode': state.languageCode,
      'countryCode': state.countryCode,
    };
  }
}
