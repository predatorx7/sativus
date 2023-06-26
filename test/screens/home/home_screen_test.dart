import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sativus/screens/home/home.dart';

class _MyTestApp extends StatelessWidget {
  const _MyTestApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

void main() {
  testWidgets('Check appbar label smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: _MyTestApp()));

    // Verify that our appbar title has correct label.
    expect(find.text('Home'), findsOneWidget);
  });
}
