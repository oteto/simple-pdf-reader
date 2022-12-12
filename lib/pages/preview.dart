import 'package:fdpook/constants.dart';
import 'package:fdpook/providers/book.dart';
import 'package:fdpook/providers/bookmark.dart';
import 'package:fdpook/providers/page.dart';
import 'package:fdpook/providers/pdf.dart';
import 'package:fdpook/widgets/app_pdf_viewer.dart';
import 'package:fdpook/widgets/bookmark_button.dart';
import 'package:fdpook/widgets/button.dart';
import 'package:fdpook/widgets/page_jump_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreviewPage extends ConsumerWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfDocment = ref.watch(pdfProvider);
    final book = ref.watch(currntBookProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(book!.title),
        padding: EdgeInsetsDirectional.zero,
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (pdfDocment.value != null) ...[
              PageJumpText(
                page: ref.watch(pageProvider),
                maxPage: pdfDocment.value!.pageCount,
              ),
              const SizedBox(width: kSpaceMD),
              BookmarkListButton(bookId: book.id),
              const SizedBox(width: kSpaceMD),
              BookmarkButton(bookId: book.id),
              const SizedBox(width: kSpaceXS),
            ],
          ],
        ),
      ),
      child: SafeArea(
        child: pdfDocment.when(
          data: (data) => data == null
              ? Container()
              : Stack(
                  children: [
                    AppPdfViewer(pdfDocument: data),
                    BookmarkList(bookId: book.id),
                  ],
                ),
          error: (e, s) => Container(),
          loading: () => Container(),
        ),
      ),
    );
  }
}

final keyProvider = Provider((ref) => GlobalKey());
final offsetProvider = StateProvider<Offset?>((ref) => null);
final openProvider = StateProvider((ref) => false);

class BookmarkList extends ConsumerWidget {
  const BookmarkList({
    super.key,
    required this.bookId,
  });

  final int bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final open = ref.watch(openProvider);
    final list = ref.watch(
      bookmarkListProvider(bookId).select((value) => value.value),
    );

    if (!open || list == null || list.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      right: 56.0,
      top: 0.0,
      child: SizedBox(
        height: 300.0,
        width: 120,
        child: SingleChildScrollView(
          child: CupertinoFormSection(
            children: list
                .map(
                  (e) => GestureDetector(
                    onTap: () => ref.read(pageProvider.notifier).goto(e.page),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.all(kSpaceXS),
                        child: Text(
                          '${e.page}ページ',
                          style: const TextStyle(
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class BookmarkListButton extends ConsumerWidget {
  const BookmarkListButton({
    super.key,
    required this.bookId,
  });

  final int bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(bookmarkListProvider(bookId));

    return AppButton(
      padding: EdgeInsets.zero,
      onPressed: (list.value?.isNotEmpty ?? false)
          ? () => ref.read(openProvider.notifier).update((state) => !state)
          : null,
      child: const Text(
        'ブックマーク一覧',
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }
}
