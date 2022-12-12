import 'package:fdpook/constants.dart';
import 'package:fdpook/models/book.dart';
import 'package:fdpook/providers/book.dart';
import 'package:fdpook/providers/book_repository.dart';
import 'package:fdpook/widgets/button.dart';
import 'package:fdpook/widgets/title_input_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FileReadButton extends ConsumerWidget {
  const FileReadButton({super.key});

  VoidCallback _saveBook(BuildContext context, WidgetRef ref) => () async {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) {
          return;
        }
        final title = await showCupertinoModalPopup<String?>(
          context: context,
          builder: (context) => const TitleInputDialog(),
        );
        if (title == null || title.isEmpty) {
          return;
        }
        final book = await ref
            .read(bookRepositoryProvider)
            .insert(PdfBook.dummy(title, result.files.single.path!));
        ref.read(bookListProvider.notifier).add(book);
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton.filled(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceSM),
      onPressed: _saveBook(context, ref),
      child: const Text(
        'ファイルを読み込む',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
