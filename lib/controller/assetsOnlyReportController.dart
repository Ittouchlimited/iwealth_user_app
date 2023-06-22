import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/model/transactionModel.dart';
import 'package:pinext/services/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssetsOnlyReportController with ChangeNotifier {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;
  AssetsOnlyReportController() {
    if (databaseHelper != null) fetchTransaction();
  }

  //default report method is income
  String reportMethod = income;
//  String reportMethodAssets = income;
//  String reportMethodLiability = expense;

  List<TransactionModel?> transactionList = [];
  List<TransactionModel?> transactionIncomeList = [];
  List<TransactionModel?> transactionExpenseList = [];

  double total = 0.0;
  double totalIncome = 0.0;
  double totalExpense = 0.0;
  double bankandcashIncomeAmount = 0.0;
  double bankandcashExpenseAmount = 0.0;
  double stocksIncomeAmount = 0.0;
  double stocksExpenseAmount = 0.0;
  double shoppingIncomeAmount = 0.0;
  double shoppingExpenseAmount = 0.0;
  double digitalassetsIncomeAmount = 0.0;
  double digitalassetsExpenseAmount = 0.0;
  double vehicleIncomeAmount = 0.0;
  double vehicleExpenseAmount = 0.0;
  double customIncomeAmount = 0.0;
  double customExpenseAmount = 0.0;
  double loanIncomeAmount = 0.0;
  double loanExpenseAmount = 0.0;
  double officeIncomeAmount = 0.0;
  double officeExpenseAmount = 0.0;
  double othersIncomeAmount = 0.0;
  double othersExpenseAmount = 0.0;

  //select report method is all, income or expense
  void cartButton(String value) {
    reportMethod = value;
    notifyListeners();
  }

  void fetchTransaction(
      {DateTime? customFromDate, DateTime? customToDate}) async {
    DateTime fromDate = customFromDate ?? DateTime.now();
    DateTime toDate = customFromDate ?? DateTime.now();

    transactionList = [];

    String fromDayPattern = 'd';
    String fromMonthPattern = 'M';

    String toDayPattern = 'd';
    String toMonthPattern = 'M';

    //date formatting
    //if date is less than 10, then add 0
    if (fromDate.day < 10) fromDayPattern = '0d';
    if (fromDate.month < 10) fromMonthPattern = '0M';
    if (toDate.day < 10) fromDayPattern = '0d';
    if (toDate.month < 10) fromMonthPattern = '0M';

    //formatted date string
    String fromDateFormat = "y-$fromMonthPattern-$fromDayPattern";
    String toDateFormat = "y-$toMonthPattern-$toDayPattern";

    //get data from database
    final dataList = await databaseHelper!.getDateRangeData(
        transactionTable,
        DateFormat(fromDateFormat).format(fromDate),
        DateFormat(toDateFormat).format(toDate));

    //converting to transactionModel
    transactionList = dataList.map((e) => TransactionModel.fromMap(e)).toList();

    //separating income and expense data
    transactionIncomeList =
        transactionList.where((element) => element!.isIncome == 1).toList();
    transactionExpenseList =
        transactionList.where((element) => element!.isIncome == 0).toList();

    //calculate total amount of income and expense
    totalIncome = transactionIncomeList.fold(
        0,
            (previousValue, element) =>
        previousValue + double.parse(element!.amount ?? "$totalIncome"));

    totalExpense = transactionExpenseList.fold(
        0,
            (previousValue, element) =>
        previousValue + double.parse(element!.amount ?? "$totalExpense"));

    //calculate balance amount
    total = totalIncome - totalExpense;

    //get each category income and expense amount
    bankandcashIncomeAmount = amountCalcAsset(transactionIncomeList, bankandcash);
    bankandcashExpenseAmount = amountCalcLiability(transactionExpenseList, bankandcash);
    //Stocks
    stocksIncomeAmount = amountCalcAsset(transactionIncomeList, stocks);
    stocksExpenseAmount = amountCalcLiability(transactionExpenseList, stocks);
    //Vehicle
    vehicleIncomeAmount = amountCalcAsset(transactionIncomeList, vehicle);
    vehicleExpenseAmount = amountCalcLiability(transactionExpenseList, vehicle);
    //Digital Assets
    digitalassetsIncomeAmount = amountCalcAsset(transactionIncomeList, digitalassets);
    digitalassetsExpenseAmount = amountCalcLiability(transactionExpenseList, digitalassets);
    //Real Estate
    shoppingIncomeAmount = amountCalcAsset(transactionIncomeList, realestate);
    shoppingExpenseAmount = amountCalcLiability(transactionExpenseList, realestate);
    //Custom
    customIncomeAmount = amountCalcAsset(transactionIncomeList, custom);
    customExpenseAmount = amountCalcLiability(transactionExpenseList, custom);
    //Loans
    loanIncomeAmount = amountCalcAsset(transactionIncomeList, loan);
    loanExpenseAmount = amountCalcLiability(transactionExpenseList, loan);
    //officeIncomeAmount = amountCalc(transactionIncomeList, office);
    //officeExpenseAmount = amountCalc(transactionExpenseList, office);
    othersIncomeAmount = amountCalcAsset(transactionIncomeList, others);
    othersExpenseAmount = amountCalcLiability(transactionExpenseList, others);

    notifyListeners();
  }
  double amountCalc(
      List<TransactionModel?> transactionIncomeList, String department) =>
      transactionIncomeList
          .where((element) => element!.category == department)
          .fold(
          0,
              (previousValue, element) =>
          previousValue + double.parse(element!.amount ?? "0.0"));
  double amountCalcAsset(
      List<TransactionModel?> transactionIncomeList, String department) =>
      transactionIncomeList
          .where((element) => element!.category == department)
          .fold(
          0,
              (previousValue, element) =>
          previousValue + double.parse(element!.amount ?? "$totalIncome"));
  double amountCalcLiability(
      List<TransactionModel?> transactionExpenseList, String department) =>
      transactionExpenseList
          .where((element) => element!.category == department)
          .fold(
          0,
              (previousValue, element) =>
          previousValue + double.parse(element!.amount ?? "$totalExpense"));
}
