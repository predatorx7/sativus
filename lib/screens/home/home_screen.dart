import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'home_provider.dart';
import 'home_state.dart';

class _HomeScreenNavigation {
  final route = GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomeScreen();
    },
  );

  // add other ways create a path for navigating to this screen.
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static final navigation = _HomeScreenNavigation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<HomeScreenState>(
      homeControllerProvider,
      (prev, next) {
        // do something
      },
    );

    final screenState = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(screenState.toString()),
      ),
      body: ElevatedButton(
        onPressed: () {
          final controller = ref.read(homeControllerProvider.notifier);
          controller.doSomething();
        },
        child: const Placeholder(),
      ),
    );
  }
}
