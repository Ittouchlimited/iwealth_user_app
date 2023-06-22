import 'package:pinext/constFiles/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io' show Directory;
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'dart:async';

import 'package:path/path.dart';
import '../model/userPlans.dart';


class DatabaseHelperPlan {
  static final DatabaseHelperPlan _DatabaseHelperPlan = DatabaseHelperPlan._();

  DatabaseHelperPlan._();

  late Database db;

  factory DatabaseHelperPlan() {
    return _DatabaseHelperPlan;
  }


  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'iWealth_plans.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              plan_name TEXT NOT NULL,
              plan_start_date_time TEXT NOT NULL,
              plan_end_date_time TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertUser(UserPlan user) async {
    int result = await db.insert('users', user.toMap());
    return result;
  }

  Future<int> updateUser(UserPlan user) async {
    int result = await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }

  Future<List<UserPlan>> retrieveUsers() async {
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => UserPlan.fromMap(e)).toList();
  }

  Future<void> deleteUser(int id) async {
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }


  Future<int> insertUserPlan(UserPlan user) async {
    int result = await db.insert('users', user.toMap());
    return result;
  }

  Future<int> updateUserPlan(UserPlan user) async {
    int result = await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }

  Future<List<UserPlan>> retrieveUsersPlan() async {
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => UserPlan.fromMap(e)).toList();
  }

  Future<void> deleteUserPlan(int id) async {
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }


}