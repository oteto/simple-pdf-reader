import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf_render/pdf_render.dart';

final pdfProvider = AsyncNotifierProvider<PdfNotifier, PdfDocument?>(
  PdfNotifier.new,
);

class PdfNotifier extends AsyncNotifier<PdfDocument?> {
  @override
  FutureOr<PdfDocument?> build() {
    return null;
  }

  Future<void> set(String path) async {
    if (state.value != null) {
      await state.value!.dispose();
    }
    final doc = await PdfDocument.openFile(path);
    state = AsyncData(doc);
  }
}
