import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';

import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';
export 'controller/locale.dart';
export 'controller/provider.dart';
export 'utils/locale.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  FirebaseUILocalizationLabels get l10nFirebase {
    return FirebaseUILocalizations.labelsOf(this);
  }

  MaterialLocalizations get l10nMaterial {
    return MaterialLocalizations.of(this);
  }
}
