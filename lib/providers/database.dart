import 'package:fdpook/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final databaseProvider = FutureProvider<Database>((ref) async {
  final databaseDir = await getApplicationSupportDirectory();
  final path = join(databaseDir.path, 'fdpook.db');
  debugPrint(path);
  // await deleteDatabase(path);
  final db = await openDatabase(
    path,
    version: 1,
    onCreate: (database, version) async {
      final batch = database.batch();

      batch.execute('''
        CREATE TABLE IF NOT EXISTS ${BookTable.tableName} (
          ${BookTable.id} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${BookTable.title} TEXT NOT NULL,
          ${BookTable.path} TEXT NOT NULL
        )
      ''');

      batch.execute('''
        CREATE TABLE IF NOT EXISTS ${BookmarkTable.tableName} (
          ${BookmarkTable.id} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${BookmarkTable.page} INTEGER NOT NULL,
          ${BookmarkTable.bookId} INTEGER NOT NULL,
          FOREIGN KEY (${BookmarkTable.bookId}) REFERENCES ${BookTable.tableName}(${BookTable.id})
        )
      ''');
      await batch.commit();
    },
  );
  return db;
});
