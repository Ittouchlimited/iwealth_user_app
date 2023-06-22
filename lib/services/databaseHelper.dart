import 'package:pinext/constFiles/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io' show Directory;
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;


class DatabaseHelper {


DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Future<Database?> initializeDatabase() async =>
      await openDatabase(join(await getDatabasesPath(), databaseName),
          version: 1,
          onCreate: (Database db, int version) => onCreate(db, version));

  onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $transactionTable('
          'id INTEGER PRIMARY KEY,'
          'title TEXT,'
          'description TEXT,'
          'amount TEXT,'
          'isIncome INTEGER,'
          'category TEXT,'
          'dateTime TEXT'
          ');',
    );

    await db.execute(
      //subscription plans
      'CREATE TABLE $planTable('
          'id INTEGER PRIMARY KEY,'
          'plan TEXT,'
          'planStartDateTime TEXT,'
          'planEndDateTime TEXT'
          ');',
    );
  }


Future<void> insertData(String tableName, Map<String, Object?> data) async {
  final db = await initializeDatabase();
  await db!.insert(tableName, data);
}

Future<void> insertPlanData(String planTable, Map<String, Object?> data) async {
  final db = await initializeDatabase();
  await db!.insert(planTable, data);
}

Future<void> updateData(
    String tableName, Map<String, Object?> data, int id) async {
  final db = await initializeDatabase();
  await db!.update(tableName, data, where: 'id = ?', whereArgs: [id]);
}

Future<void> updatePlanData(
    String planTable, Map<String, Object?> data, int id) async {
  final db = await initializeDatabase();
  await db!.update(planTable, data, where: 'id = ?', whereArgs: [id]);
}

Future<void> deleteData(String tableName, int id) async {
  final db = await initializeDatabase();
  await db!.delete(tableName, where: 'id = ?', whereArgs: [id]);
}

Future<void> deletePlanData(String planTable, int id) async {
  final db = await initializeDatabase();
  await db!.delete(planTable, where: 'id = ?', whereArgs: [id]);
}

Future<List<Map<String, dynamic>>> getData(String tableName) async {
  final db = await initializeDatabase();
  return await db!.query(tableName, orderBy: "dateTime DESC");
}

Future<List<Map<String, dynamic>>> getPlanData(String planTable) async {
  final db = await initializeDatabase();
  return await db!.query(planTable, orderBy: "dateTime DESC");
}

  //If you are still having issues with counter reset check this code block
  //remove the date range
Future<List<Map<String, dynamic>>> getDateRangeData(
    String tableName, String fromDate, String toDate) async {
  final db = await initializeDatabase();
  return await db!.query(transactionTable,
      where: "dateTime BETWEEN ? AND ?",
      whereArgs: ['$fromDate 00:00:00', '$toDate 23:59:59']);
}
Future<List<Map<String, dynamic>>> getPlanDateRangeData(
    String tableName, String fromDate, String toDate) async {
  final db = await initializeDatabase();
  return await db!.query(transactionTable,
      where: "dateTime BETWEEN ? AND ?",
      whereArgs: ['$fromDate 00:00:00', '$toDate 23:59:59']);
}
}
