import 'package:riverpod/riverpod.dart';

import 'home_controller.dart';
import 'home_state.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeScreenState>((ref) {
  return HomeController(ref);
});
