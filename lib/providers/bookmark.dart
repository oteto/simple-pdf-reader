import 'dart:async';

import 'package:fdpook/models/bookmark.dart';
import 'package:fdpook/providers/bookmark_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookmarkListProvider = AutoDisposeAsyncNotifierProviderFamily<
    BookmarkListNotifier, List<Bookmark>, int>(
  BookmarkListNotifier.new,
);

class BookmarkListNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Bookmark>, int> {
  @override
  FutureOr<List<Bookmark>> build(arg) {
    final list = ref.watch(bookmarkRepositoryProvider).bookmarks(arg);
    return list;
  }

  void add(Bookmark bookmark) {
    state = state.whenData((value) => [...value, bookmark]);
  }

  void remove(int id) {
    state = state.whenData((value) => value.where((e) => e.id != id).toList());
  }
}
