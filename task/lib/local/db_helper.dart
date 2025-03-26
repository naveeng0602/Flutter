import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //singleton
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();
  //table note
  static final String TABLE_NOTE = "note";
  static final String TABLE_NOTE_SNO = "s_no";
  static final String TABLE_NOTE_TITLE = "title";
  static final String TABLE_NOTE_DESC = "desc";

  Database? myDB;

  /// db Open (Path -> if exits then open else create db)
  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;
    // if (myDB != null) {
    //   return myDB!;
    // } else {
    //   myDB = await openDB();
    //   return myDB!;
    // }
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");
    return await openDatabase(
      dbPath,
      onCreate: (db, version) {
        db.execute(
          "create table $TABLE_NOTE ($TABLE_NOTE_SNO integer primary key autoincrement, $TABLE_NOTE_TITLE text, $TABLE_NOTE_DESC text )",
        );
      },
      version: 1,
    );
  }

  /// all queries
  /// insertion
  Future<bool> addNote({required String mTitle, required String mDesc}) async {
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_NOTE, {
      TABLE_NOTE_TITLE: mTitle,
      TABLE_NOTE_DESC: mDesc,
    });
    return rowsEffected > 0;
  }

  // Reading all data
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }

  /// Update Data
  Future<bool> updateNote({
    required String mTitle,
    required String mDesc,
    required int sno,
  }) async {
    var db = await getDB();

    int rowEffected = await db.update(TABLE_NOTE, {
      TABLE_NOTE_TITLE: mTitle,
      TABLE_NOTE_DESC: mDesc,
    }, where: "$TABLE_NOTE_SNO= $sno");
    return rowEffected > 0;
  }
  ///Delete Data
Future<bool> deleteNote({required int sno}) async {
  var db = await getDB();
  int rowEffected = await db.delete(
    TABLE_NOTE,
    where: "$TABLE_NOTE_SNO = ?",
    whereArgs: ["$sno"],
  );
  return rowEffected > 0;
}
}



