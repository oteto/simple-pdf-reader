import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageCountProvider = StateProvider.autoDispose((ref) => 0);
final pageProvider = AutoDisposeNotifierProvider<PageNotifier, int>(
  PageNotifier.new,
);

class PageNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() {
    return 1;
  }

  void nextPage(int max) {
    if (max - 1 <= state) {
      state = max - 1;
      return;
    }
    state += 2;
  }

  void prevPage() {
    if (state <= 2) {
      state = 1;
      return;
    }
    state -= 2;
  }

  void goto(int page) {
    state = page;
  }
}
