import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sativus/screens/screens.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    routes: [
      HomeScreen.navigation.route,
      ErrorScreen.navigation.route,
    ],
    debugLogDiagnostics: kDebugMode,
    errorBuilder: (context, state) => ErrorScreen(routerState: state),
  );
});
