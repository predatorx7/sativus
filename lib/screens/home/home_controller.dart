import 'package:riverpod/riverpod.dart';

import 'home_state.dart';

class HomeController extends StateNotifier<HomeScreenState> {
  HomeController(this.ref) : super(const HomeScreenState());

  final Ref ref;

  void doSomething() {}
}
