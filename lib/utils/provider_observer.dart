import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/logger.dart';

class ProviderFailureObserver extends ProviderObserver {
  const ProviderFailureObserver();

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    assert(() {
      // report failures only in debug mode
      $logger.child('providerDidFail').severe(
            'provider "${provider.name ?? provider.runtimeType}" failed',
            error,
            stackTrace,
          );

      return true;
    }());
  }
}
