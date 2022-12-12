import 'dart:async';

import 'package:fdpook/models/book.dart';
import 'package:fdpook/providers/book_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currntBookProvider = StateProvider<PdfBook?>((ref) => null);

final bookListProvider =
    AutoDisposeAsyncNotifierProvider<BookListNotifier, List<PdfBook>>(
  BookListNotifier.new,
);

class BookListNotifier extends AutoDisposeAsyncNotifier<List<PdfBook>> {
  @override
  FutureOr<List<PdfBook>> build() {
    final list = ref.watch(bookRepositoryProvider).books();
    return list;
  }

  void add(PdfBook book) {
    state = state.whenData((value) => [...value, book]);
  }
}
