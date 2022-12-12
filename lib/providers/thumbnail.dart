import 'dart:ui' as ui;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final bookThumbnailProvider = AutoDisposeAsyncNotifierProviderFamily<
    BookThumbnailNotifier, ui.Image?, String>(
  BookThumbnailNotifier.new,
);

class BookThumbnailNotifier
    extends AutoDisposeFamilyAsyncNotifier<ui.Image?, String> {
  @override
  FutureOr<ui.Image?> build(arg) async {
    ref.onDispose(() {
      print('dispose!!!!!!!!!!');
      if (state.value != null) {
        state.value!.dispose();
      }
    });

    final doc = await PdfDocument.openFile(arg);
    final page = await doc.getPage(1);
    final pageImage = await page.render();
    final image = await pageImage.createImageIfNotAvailable();
    await doc.dispose();
    return image;
  }
}
