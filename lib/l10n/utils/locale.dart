import 'package:flutter/widgets.dart';
import 'package:sativus/l10n/gen/app_localizations.dart';

class LocaleUtil {
  List<Locale> supportedLocales() {
    return AppLocalizations.supportedLocales;
  }

  bool isSupportedLocale(Locale locale) {
    return supportedLocales().contains(locale);
  }

  AppLocalizations l10n(BuildContext context) {
    return AppLocalizations.of(context);
  }

  String currentLanguageName(BuildContext context) {
    return l10n(context).languageName;
  }

  AppLocalizations? localizationFor(Locale locale) {
    if (!isSupportedLocale(locale)) return null;

    return lookupAppLocalizations(locale);
  }

  String languageNameFor(Locale locale) {
    return localizationFor(locale)?.languageName ?? locale.toString();
  }

  String localeFullNameFor(Locale locale) {
    return localizationFor(locale)?.localeFullName ?? locale.toString();
  }
}
