import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaffoldControllerProvider =
    StateNotifierProvider<ScaffoldController, int>((ref) {
  return ScaffoldController(0);
});

class ScaffoldController extends StateNotifier<int> {
  ScaffoldController(super._state);

  void setPosition(int value) {
    state = value;
  }
}
