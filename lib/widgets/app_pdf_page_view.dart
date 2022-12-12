import 'package:fdpook/providers/page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class AppPdfPageView extends ConsumerWidget {
  const AppPdfPageView({
    super.key,
    required this.width,
    this.pdfDocument,
    this.peek = 0,
  });

  final PdfDocument? pdfDocument;
  final double width;
  final int peek;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);

    return PdfPageView(
      pageNumber: page + peek,
      pdfDocument: pdfDocument,
      pageBuilder: (context, textureBuilder, pageSize) {
        return SizedBox.fromSize(
          size: Size(width, width / pageSize.aspectRatio),
          child: textureBuilder(),
        );
      },
    );
  }
}
