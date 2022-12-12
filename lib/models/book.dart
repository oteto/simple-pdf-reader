import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class PdfBook with _$PdfBook {
  factory PdfBook({
    required int id,
    required String title,
    required String path,
  }) = _PdfBook;

  factory PdfBook.fromJson(Map<String, dynamic> json) =>
      _$PdfBookFromJson(json);

  factory PdfBook.dummy(String title, String path) => PdfBook(
        id: -1,
        title: title,
        path: path,
      );

  const PdfBook._();
}
