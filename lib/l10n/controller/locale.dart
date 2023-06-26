import 'package:flutter/material.dart';
import 'package:hydrated_state_notifier/hydrated_state_notifier.dart';

class LocaleController extends HydratedStateNotifier<Locale?> {
  LocaleController([Locale? locale]) : super(locale);

  Future<void> update(Locale? Function(Locale? state) updator) async {
    state = updator(state);
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json['language_code'], json['country_code']);
  }

  @override
  Map<String, dynamic>? toJson(Locale? state) {
    return {
      'language_code': state?.languageCode,
      'country_code': state?.countryCode,
    };
  }
}
