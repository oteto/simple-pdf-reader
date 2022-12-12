import 'package:fdpook/models/bookmark.dart';
import 'package:fdpook/providers/bookmark.dart';
import 'package:fdpook/providers/bookmark_repository.dart';
import 'package:fdpook/providers/page.dart';
import 'package:fdpook/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkButton extends ConsumerWidget {
  const BookmarkButton({
    super.key,
    required this.bookId,
  });

  final int bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(bookmarkListProvider(bookId).select((value) {
      final page = ref.watch(pageProvider);
      return value.value
          ?.firstWhere((e) => e.page == page,
              orElse: () => Bookmark.dummy(-1, -1))
          .id;
    }));
    final bookmarked = id != null && id != -1;

    return AppButton(
      padding: EdgeInsets.zero,
      child: Icon(
        bookmarked ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
      ),
      onPressed: () async {
        if (bookmarked) {
          final cnt = await ref.read(bookmarkRepositoryProvider).delete(id);
          if (cnt == 1) {
            ref.read(bookmarkListProvider(bookId).notifier).remove(id);
          }
        } else {
          final bookmark = await ref
              .read(bookmarkRepositoryProvider)
              .insert(Bookmark.dummy(bookId, ref.read(pageProvider)));
          if (bookmark == null) {
            return;
          }
          ref.read(bookmarkListProvider(bookId).notifier).add(bookmark);
        }
      },
    );
  }
}
