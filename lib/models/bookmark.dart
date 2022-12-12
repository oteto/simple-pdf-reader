// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
class Bookmark with _$Bookmark {
  factory Bookmark({
    required int id,
    @JsonKey(name: 'book_id') required int bookId,
    required int page,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);

  factory Bookmark.dummy(int bookId, int page) => Bookmark(
        id: -1,
        bookId: bookId,
        page: page,
      );

  const Bookmark._();
}
