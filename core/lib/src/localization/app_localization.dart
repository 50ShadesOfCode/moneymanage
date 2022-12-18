import 'dart:convert';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneymanage/router/router.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();
  static const String englishCode = 'en';
  static const String russianCode = 'ru';
  static const Locale supportedEnglishLocale = Locale(englishCode, '');
  static const Locale supportedRussianLocale = Locale(russianCode, '');
  static const List<String> supportedLanguageCodes = <String>[
    englishCode,
    russianCode
  ];
  static const List<Locale> supportedLocales = <Locale>[
    supportedEnglishLocale,
    supportedRussianLocale
  ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    final String jsonString = await rootBundle
        .loadString('assets/resources/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((String key, dynamic value) {
      return MapEntry<String, String>(key, value.toString());
    });

    return true;
  }

  String? translate(String key) {
    return _localizedStrings![key];
  }

  static String ofGlobalContext(String key) {
    final BuildContext context =
        appLocator.get<AppRouter>().navigatorKey.currentContext!;
    final String? localizedString = AppLocalizations.of(context).translate(key);
    if (localizedString != null) {
      return localizedString;
    } else {
      return 'Unknown key';
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLanguageCodes
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
