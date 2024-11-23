import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class NotesDatabase {

  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();

  Future<Database> get database async{
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,version: 1,onCreate: _createDB);
    }
    Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final stringType = 'STRING NOT NULL';
    await db.execute('''
    CREATE TABLE $tableUser (
    ${UserFields.id} $idType,
    ${UserFields.password} $stringType,
    ${UserFields.email} $stringType,
    
    ''')
  }
  
    Future<User> create(User user) async {
    final db = await instance.database;
    final json = await user.toJson()
    final columns =
        '${UserFields.email}, ${UserFields.password}';
    // final values = '${json[UserFields.email]}, ${json[UserFields.password]}';
    // final id = await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
    final id = await db.insert(tableUser, user.toJson())
    return user.copy(id:id)
    }
    Future<User> readUser(int id) async {
      final db = await instance.database;
      final maps = await db.query(
          tableUser,
          columns: UserFields.values,
          where: '${UserFields.id} = ?',
          whereArgs: [id],);

      if (maps.isEmpty) {
        return User.fromJson(maps.first);
      }
    };
    
    Future close() async {
      final db = await instance.database;
      db.close();
    }
}