import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class _ErrorScreenNavigation {
  final route = GoRoute(
    path: '/error',
    builder: (context, state) {
      return const ErrorScreen();
    },
  );

  // add other ways create a path for navigating to this screen.
}

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({
    super.key,
    this.routerState,
  });

  final GoRouterState? routerState;

  static final navigation = _ErrorScreenNavigation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rs = routerState;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Something went wrong"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (kDebugMode && rs != null)
              SelectableText(rs.error?.toString() ?? 'unknon'),
            SelectableText(
              "That's an error",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.merge(
                  TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
            SelectableText(
              'The requested page was not found.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SelectableText(
              'That\'s all we know.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.merge(
                    TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('HOME'),
            ),
          ],
        ),
      ),
    );
  }
}
