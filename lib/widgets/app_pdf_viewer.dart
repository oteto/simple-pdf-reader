import 'package:fdpook/constants.dart';
import 'package:fdpook/providers/page.dart';
import 'package:fdpook/widgets/app_pdf_page_view.dart';
import 'package:fdpook/widgets/side_page_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf_render/pdf_render.dart';

class AppPdfViewer extends ConsumerWidget {
  const AppPdfViewer({
    super.key,
    required this.pdfDocument,
  });

  final PdfDocument pdfDocument;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);

    return LayoutBuilder(builder: (context, constraints) {
      final pageWidth = (constraints.maxWidth - kSideNavWidth * 2) / 2;
      return Row(
        children: [
          SidePageNavigation(
            onTap: () {
              ref.read(pageProvider.notifier).prevPage();
            },
            icon: CupertinoIcons.arrowtriangle_left_fill,
            enabled: page != 1,
          ),
          Expanded(
            child: AppPdfPageView(
              pdfDocument: pdfDocument,
              width: pageWidth,
            ),
          ),
          Expanded(
            child: AppPdfPageView(
              pdfDocument: pdfDocument,
              width: pageWidth,
              peek: 1,
            ),
          ),
          SidePageNavigation(
            onTap: () {
              ref.read(pageProvider.notifier).nextPage(pdfDocument.pageCount);
            },
            icon: CupertinoIcons.arrowtriangle_right_fill,
            enabled: page < pdfDocument.pageCount - 1,
          ),
        ],
      );
    });
  }
}
