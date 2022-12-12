import 'package:flutter/material.dart';

const kSpaceXS = 4.0;
const kSpaceSM = 8.0;
const kSpaceMD = 16.0;
const kSpaceLG = 24.0;

const kSideNavWidth = 40.0;

const kThumbnailBorderRadius = BorderRadius.all(Radius.circular(4.0));
const kThumbnailSize = Size(148, 210);

abstract class BookTable {
  static const tableName = 'books';
  static const id = 'id';
  static const title = 'title';
  static const path = 'path';
}

abstract class BookmarkTable {
  static const tableName = 'bookmarks';
  static const id = 'id';
  static const bookId = 'book_id';
  static const page = 'page';
}
