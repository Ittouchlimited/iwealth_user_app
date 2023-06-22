import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/model/PlanTransactionModel.dart';
import 'package:pinext/model/transactionModel.dart';
import 'package:pinext/services/databaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class TransactionController with ChangeNotifier {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;

  List<TransactionModel?> transactionList = [];
  List<PlanTransactionModel?> planTransactionList = [];

  double totalIncome = 0.0;
  double totalExpense = 0.0;
  double total = 0.0;

  bool fetching = false;

  TransactionController() {
    if (databaseHelper != null) fetchTransaction();
  }

  void fetchTransaction() async {
    fetching = true;
    transactionList = [];
    //planTransactionList = [];
    totalIncome = 0.0;
    totalExpense = 0.0;
    total = 0.0;

    final dataList = await databaseHelper!.getData(transactionTable);
    //final planList = await databaseHelper!.getData(planTable);

    transactionList = dataList.map((e) => TransactionModel.fromMap(e)).toList();
    //planTransactionList = planList.map((e) => PlanTransactionModel.fromMap(e)).toList();

    //If you are still having issues with counter reset check this code block
    //$totalIncome
    transactionList.forEach((element) {
      if (element!.isIncome == 1) {
        totalIncome += double.parse(element.amount ?? "0.0");
      } else {
        totalExpense += double.parse(element.amount ?? "0.0");
      }
    });


    /*
    //If you are still having issues with counter reset check this code block
    //$totalIncome
    transactionList.forEach((element) {
      if (element!.isIncome == 1) {
        totalIncome += double.parse(element.amount ?? "0.0");
      } else {
        totalExpense += double.parse(element.amount ?? "0.0");
      }
    });

     */

    total = totalIncome - totalExpense;

    fetching = false;

    notifyListeners();
  }




  void insertTransaction(TransactionModel transactionModel) async =>
      await databaseHelper!
      //.insertData(transactionTable, transactionModel.transactionToMap())
          .insertData(transactionTable, transactionModel.transactionToMap())
          .catchError((onError) => print("Insertion On Error: $onError"));

  void insertPlanTransaction(PlanTransactionModel planTransactionModel) async =>
      await databaseHelper!
      //.insertData(transactionTable, transactionModel.transactionToMap())
          .insertData(planTable, planTransactionModel.transactionToMap())
          .catchError((onError) => print("Insertion On Error: $onError"));

  void updateTransaction(TransactionModel transactionModel) async =>
      await databaseHelper!
          .updateData(transactionTable, transactionModel.transactionToMap(),
          transactionModel.id ?? 0)
          .catchError((onError) => print("Update On Error: $onError"));

  void updatePlanTransaction(PlanTransactionModel planTransactionModel) async =>
      await databaseHelper!
          .updateData(planTable, planTransactionModel.transactionToMap(),
          planTransactionModel.id ?? 0)
          .catchError((onError) => print("Update On Error: $onError"));

  void deleteTransaction(int id) async => await databaseHelper!
      .deleteData(transactionTable, id)
      .catchError((onError) => print("Deletion On Error: $onError"));

  void deletePlanTransaction(int id) async => await databaseHelper!
      .deleteData(planTable, id)
      .catchError((onError) => print("Deletion On Error: $onError"));

  String tileIcon(String departmentName) {
    if (departmentName == bankandcash) return svgPath(bankSvg);
    if (departmentName == stocks) return svgPath(stocksSvg);
    if (departmentName == realestate) return svgPath(realestateSvg);
    if (departmentName == digitalassets) return svgPath(digitalassetSvg);
    if (departmentName == vehicle) return svgPath(vehicleSvg);
    if (departmentName == custom) return svgPath(customSvg);
    if (departmentName == loan) return svgPath(loanSvg);
    //if (departmentName == office) return svgPath(officeSvg);
    return svgPath(othersSvg);
  }
}
