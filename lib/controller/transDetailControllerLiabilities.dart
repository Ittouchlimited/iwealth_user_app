import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/services/databaseHelper.dart';
import 'package:flutter/cupertino.dart';

class TransDetailControllerLiabilities with ChangeNotifier {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;

  TextEditingController titleField = TextEditingController();
  TextEditingController amountField = TextEditingController();
  TextEditingController descriptionField = TextEditingController();

  //bool isIncomeSelected = false;
  bool isExpenseSelected = true;
  bool savedTransaction = false;

  String selectedDepartment = loan;

  int? transactionId;
  String? date;

  bool buttonSelected = true;

  void changeHomeNdReportSection(bool value) {
    buttonSelected = value;
    notifyListeners();
  }

  void changeCategory() {
    isExpenseSelected = !isExpenseSelected;
    notifyListeners();
  }

  void changeDepartment(String name) {
    selectedDepartment = name;
    notifyListeners();
  }

  String titleIcon() {
    if (selectedDepartment == bankandcash) return svgPath(bankSvg);
    if (selectedDepartment == stocks) return svgPath(stocksSvg);
    if (selectedDepartment == realestate) return svgPath(realestateSvg);
    if (selectedDepartment == digitalassets) return svgPath(digitalassetSvg);
    if (selectedDepartment == vehicle) return svgPath(vehicleSvg);
    if (selectedDepartment == custom) return svgPath(customSvg);
    if (selectedDepartment == loan) return svgPath(loanSvg);
    if (selectedDepartment == others) return svgPath(othersSvg);
    return svgPath(othersSvg);
  }

  void toTransactionDetail({
    required bool isSaved,
    int? id,
    String? title,
    String? description,
    String? amount,
    bool? isIncome,
    String? department,
    String? dateTime,
  }) {
    savedTransaction = isSaved;
    transactionId = id;
    titleField.text = title ?? "";
    descriptionField.text = description ?? "";
    amountField.text = amount ?? "";
    isExpenseSelected = isIncome ?? false;
    selectedDepartment = department ?? loan;
    date = dateTime ?? DateTime.now().toString();
    notifyListeners();
  }
}
