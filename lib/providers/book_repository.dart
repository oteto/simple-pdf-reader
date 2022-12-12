import 'package:fdpook/constants.dart';
import 'package:fdpook/models/book.dart';
import 'package:fdpook/providers/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final bookRepositoryProvider = Provider((ref) => BookRepository(ref));

class BookRepository {
  const BookRepository(this.ref);

  final Ref ref;

  Future<Database> get _db async => await ref.read(databaseProvider.future);

  Future<List<PdfBook>> books() async {
    final db = await _db;
    final rows = await db.query(BookTable.tableName);

    return rows.map((e) => PdfBook.fromJson(e)).toList();
  }

  Future<PdfBook> insert(PdfBook book) async {
    final db = await _db;
    final id = await db.insert(BookTable.tableName, {
      BookTable.title: book.title,
      BookTable.path: book.path,
    });
    return book.copyWith(id: id);
  }
}
