import 'package:fdpook/constants.dart';
import 'package:fdpook/providers/book.dart';
import 'package:fdpook/providers/pdf.dart';
import 'package:fdpook/providers/router.dart';
import 'package:fdpook/widgets/book_card.dart';
import 'package:fdpook/widgets/file_read_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookListProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Fdpook'),
        padding: EdgeInsetsDirectional.zero,
        trailing: FileReadButton(),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(kSpaceLG),
          child: Wrap(
            spacing: kSpaceLG,
            children: books.when(
              data: (data) => data
                  .map(
                    (book) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onDoubleTap: () async {
                          final push = context.push;
                          await ref.read(pdfProvider.notifier).set(book.path);
                          ref.read(currntBookProvider.notifier).state = book;
                          push(AppRoute.preview.path);
                        },
                        child: BookCard(book: book),
                      ),
                    ),
                  )
                  .toList(),
              error: (e, s) => [],
              loading: () => [],
            ),
          ),
        ),
      ),
    );
  }
}
