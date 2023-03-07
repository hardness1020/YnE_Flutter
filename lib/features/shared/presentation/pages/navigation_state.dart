import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationState extends StateNotifier<int> {
  NavigationState() : super(0);

  void updateIndex(int index) {
    if (state == index) {
      return;
    }
    state = index;
  }
}

final navigationStateProvider = StateNotifierProvider<NavigationState, int>((ref) {
  return NavigationState();
});
