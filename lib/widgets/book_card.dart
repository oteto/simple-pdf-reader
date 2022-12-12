import 'dart:math';
import 'dart:ui' as ui;

import 'package:fdpook/constants.dart';
import 'package:fdpook/models/book.dart';
import 'package:fdpook/providers/thumbnail.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookCard extends ConsumerWidget {
  const BookCard({
    super.key,
    required this.book,
  });

  final PdfBook book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(bookThumbnailProvider(book.path));

    return CustomPaint(
      size: kThumbnailSize,
      painter: _ThumbnailPainter(thumbnail),
    );
  }
}

class _ThumbnailPainter extends CustomPainter {
  const _ThumbnailPainter(this.thumbnail);

  final AsyncValue<ui.Image?> thumbnail;

  @override
  void paint(Canvas canvas, Size size) {
    final image = thumbnail.value;
    if (image == null) {
      return;
    }

    canvas.clipRRect(
      kThumbnailBorderRadius.toRRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
      ),
    );

    final scaleX = size.width / image.width;
    final scaleY = size.height / image.height;
    final scale = min(scaleX, scaleY);
    canvas.scale(scale);
    canvas.drawImage(
      image,
      Offset.zero,
      Paint(),
    );
  }

  @override
  bool shouldRepaint(_ThumbnailPainter oldDelegate) =>
      thumbnail != oldDelegate.thumbnail;
}
