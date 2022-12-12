import 'package:fdpook/constants.dart';
import 'package:fdpook/models/bookmark.dart';
import 'package:fdpook/providers/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final bookmarkRepositoryProvider = Provider((ref) => BookmarkRepository(ref));

class BookmarkRepository {
  const BookmarkRepository(this.ref);

  final Ref ref;

  Future<Database> get _db async => await ref.read(databaseProvider.future);

  Future<List<Bookmark>> bookmarks(int bookId) async {
    final db = await _db;
    final rows = await db.query(
      BookmarkTable.tableName,
      where: '${BookmarkTable.bookId} = ?',
      whereArgs: [bookId],
    );

    return rows.map((e) => Bookmark.fromJson(e)).toList();
  }

  Future<Bookmark?> insert(Bookmark bookmark) async {
    final db = await _db;
    final exists = await db.query(
      BookmarkTable.tableName,
      where: '${BookmarkTable.bookId} = ? AND ${BookmarkTable.page} = ?',
      whereArgs: [bookmark.bookId, bookmark.page],
    );
    if (exists.isNotEmpty) {
      return null;
    }
    final id = await db.insert(
      BookmarkTable.tableName,
      {
        BookmarkTable.bookId: bookmark.bookId,
        BookmarkTable.page: bookmark.page,
      },
    );
    return bookmark.copyWith(id: id);
  }

  Future<int> delete(int id) async {
    final db = await _db;
    final cnt = await db.delete(
      BookmarkTable.tableName,
      where: '${BookmarkTable.id} = ?',
      whereArgs: [id],
    );
    return cnt;
  }
}
