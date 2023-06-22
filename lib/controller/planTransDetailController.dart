import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/services/databaseHelper.dart';
import 'package:flutter/cupertino.dart';

class PlanTransDetailController with ChangeNotifier {
  DatabaseHelper? databaseHelper = DatabaseHelper.instance;

  TextEditingController planField = TextEditingController();
  TextEditingController planStartDateTimeField = TextEditingController();
  TextEditingController planEndDateTimeField = TextEditingController();

  //bool isIncomeSelected = true;
  //bool isExpenseSelected = false;
  bool savedTransaction = false;

  //String selectedDepartment = others;

  int? planId;
  //String? plan;
  String? planStartDateTimeString;
  String? planEndDateTimeString;

  bool buttonSelected = true;

  void changeHomeNdReportSection(bool value) {
    buttonSelected = value;
    notifyListeners();
  }

  /*
  void changeCategory() {
    isIncomeSelected = !isIncomeSelected;
    notifyListeners();
  }

   */

  /*
  void changeDepartment(String name) {
    selectedDepartment = name;
    notifyListeners();
  }

   */

  /*
  String titleIcon() {
    if (selectedDepartment == bankandcash) return svgPath(bankSvg);
    if (selectedDepartment == stocks) return svgPath(stocksSvg);
    if (selectedDepartment == realestate) return svgPath(realestateSvg);
    if (selectedDepartment == digitalassets) return svgPath(digitalassetSvg);
    if (selectedDepartment == vehicle) return svgPath(vehicleSvg);
    if (selectedDepartment == custom) return svgPath(customSvg);
    if (selectedDepartment == loan) return svgPath(loanSvg);
    //if (selectedDepartment == office) return svgPath(officeSvg);
    return svgPath(othersSvg);
  }
  String title() {
    if (selectedDepartment == bankandcash) return svgPath(bankSvg);
    if (selectedDepartment == stocks) return svgPath(stocksSvg);
    if (selectedDepartment == realestate) return svgPath(realestateSvg);
    if (selectedDepartment == digitalassets) return svgPath(digitalassetSvg);
    if (selectedDepartment == vehicle) return svgPath(vehicleSvg);
    if (selectedDepartment == custom) return svgPath(customSvg);
    if (selectedDepartment == loan) return svgPath(loanSvg);
    //if (selectedDepartment == office) return svgPath(officeSvg);
    return svgPath(othersSvg);
  }

   */

  void toTransactionDetail({
    required bool isSaved,
    int? id,
    String? plan,
    String? planStartDateTime,
    String? planEndDateTime,
  }) {
    savedTransaction = isSaved;
    planId = id;
    planField.text = plan ?? "";
    planStartDateTimeString = planStartDateTime ?? DateTime.now().toString();
    planEndDateTimeString = planEndDateTime ?? DateTime.now().toString();
    notifyListeners();
  }
}
