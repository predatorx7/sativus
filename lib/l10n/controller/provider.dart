import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/locale.dart';
import 'locale.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeController, ThemeMode>((ref) {
  return ThemeModeController(ThemeMode.light);
});

class ThemeModeController extends StateNotifier<ThemeMode> {
  ThemeModeController(super.state);

  void update(ThemeMode mode) {
    state = mode;
  }
}

final localeControllerProvider =
    StateNotifierProvider<LocaleController, Locale?>((ref) {
  return LocaleController();
});

final localeProvider = StateNotifierProvider<SelectedLocaleController, Locale>(
  (ref) {
    return SelectedLocaleController(LocaleUtil().supportedLocales().first);
  },
);

class SelectedLocaleController extends StateNotifier<Locale> {
  SelectedLocaleController(super.state);

  void update(Locale locale) {
    state = locale;
  }
}
