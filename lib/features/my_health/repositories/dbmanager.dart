import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "ss.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE student(id INTEGER PRIMARY KEY autoincrement, relation TEXT, name TEXT, course TEXT,course2 TEXT)",

        );
      } );
    }
  }

  Future<int> insertStudent(SwitchAccounts student) async {
    await openDb();
    return await _database.insert('student', student.toMap());
  }

  Future<List<SwitchAccounts>> getAccountList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('student');
    return List.generate(maps.length, (i) {
      return SwitchAccounts(
        id: maps[i]['id'], relation : maps[i]['relation'], username: maps[i]['name'], password: maps[i]['course'], name: maps[i]['course2']);
    });
  }

  Future<int> updateStudent(SwitchAccounts student) async {
    await openDb();
    return await _database.update('student', student.toMap(),
        where: "id = ?", whereArgs: [student.id]);
  }

  Future<void> deleteStudent(int id) async {
    await openDb();
    await _database.delete(
        'student',
        where: "id = ?", whereArgs: [id]
    );
  }
  Future<void> readStudent(SwitchAccounts student) async {
    await openDb();
    return await _database.rawQuery(
      "SELECT * from student where course= ? AND course2= ?",
    );
  }

}

class SwitchAccounts {
  int id;
  String username;
  String password;
  String name;
  String relation;
  SwitchAccounts({@required this.username,@required this.relation, @required this.password,@required this.name, this.id});
  Map<String, dynamic> toMap() {
    return {'name': username, 'course': password, 'course2' : name, 'relation' : relation};
  }
}