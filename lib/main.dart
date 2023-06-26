import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sativus/config/serializers.dart';
import 'package:sativus/utils/provider_observer.dart';

import 'app.dart';
import 'config/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setLogging();
  setSerializers();

  runApp(const ProviderScope(
    observers: [ProviderFailureObserver()],
    child: MyApp(),
  ));
}
