import 'package:pinext/constFiles/colors.dart';
import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/controller/reportController.dart';
import 'package:pinext/controller/transDetailController.dart';
import 'package:pinext/controller/transactionController.dart';
import 'package:pinext/customWidgets/snackbar.dart';
import 'package:pinext/model/transactionModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../controller/transDetailControllerLiabilities.dart';

class TransactionDetail extends StatelessWidget {
  TransactionDetail({Key? key}) : super(key: key);
  static TransDetailController? transDetailController;
  static TransDetailControllerLiabilities? transDetailControllerLiabilities;
  static TransactionController? transController;
  static ReportController? reportController;

  @override
  Widget build(BuildContext context) {
    transDetailController = Provider.of<TransDetailController>(context);
    transDetailControllerLiabilities = Provider.of<TransDetailControllerLiabilities>(context);
    transController = Provider.of<TransactionController>(context);
    reportController = Provider.of<ReportController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        leadingWidth: 25.0,
        title: Row(
          children: [
            Text(
              transDetailController!.isIncomeSelected ? income : expense,
              style:
                  const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: const Icon(Icons.refresh_outlined),
                tooltip: "Change Category",
                onPressed: () => transDetailController!.changeCategory())
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: TextButton(
                    onPressed: () => save(context),
                    child: Text(
                        transDetailController!.savedTransaction
                            ? "Update"
                            : "Save",
                        style: const TextStyle(color: whiteColor))),
              ),
            ],
          )
        ],
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Column(
        children: [
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.4),
            children: [
              categoryIcons(
                  text: bankandcash,
                  svgName: bankSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == bankandcash
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(bankandcash)),
              /*
              categoryIcons(
                  text: stocks,
                  svgName: stocksSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == stocks
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(stocks)),
              categoryIcons(
                  text: realestate,
                  svgName: realestateSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == realestate
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(realestate)),
              categoryIcons(
                  text: digitalassets,
                  svgName: digitalassetSvg,
                  isSelected: transDetailController!.selectedDepartment == digitalassets
                      ? true
                      : false,
                  onPress: () => transDetailController!.changeDepartment(digitalassets)),
              categoryIcons(
                  text: vehicle,
                  svgName: vehicleSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == vehicle
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(vehicle)),
              categoryIcons(
                  text: custom,
                  svgName: customSvg,
                  isSelected: transDetailController!.selectedDepartment == custom
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(custom)),
              categoryIcons(
                  text: loan,
                  svgName: loanSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == loan
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(loan)),

              categoryIcons(
                  text: office,
                  svgName: officeSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == office
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(office)),

              categoryIcons(
                  text: others,
                  svgName: othersSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == others
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(others)),
              */
            ],
          ),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: TextField(
                      controller: transDetailController!.titleField,
                      cursorColor: greyText,
                      style: const TextStyle(
                          color: greyText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: const TextStyle(color: greyText),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, left: 5.0),
                            child: SvgPicture.asset(
                              transDetailController!.titleIcon(),
                              height: 5.0,
                              color: whiteColor,
                            ),
                          ),
                          border: InputBorder.none),
                    )),
                const Spacer(),
                Expanded(
                    flex: 2,
                    child: TextField(
                      controller: transDetailController!.amountField,
                      textAlign: TextAlign.end,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      cursorColor: greyText,
                      style: const TextStyle(
                          color: greyText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          hintText: "Amount",
                          hintStyle: TextStyle(color: greyText),
                          border: InputBorder.none),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: transDetailController!.descriptionField,
                textAlign: TextAlign.start,
                minLines: 20,
                maxLines: 50,
                decoration: const InputDecoration(
                    hintText: "Description here...", border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding categoryIcons({
    required String text,
    required String svgName,
    required bool isSelected,
    required Function() onPress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: isSelected ? const Color(0xffeae1f9) : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  svgPath(svgName),
                  height: 35.0,
                  color: svgColor,
                ),
              ),
              Text(
                text,
                style: TextStyle(color: svgColor, fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  save(BuildContext context) {
    if (transDetailController!.titleField.text.isEmpty) {
      snackBar(context: context, title: "Title Is Mandatory");
    } else if (double.tryParse(transDetailController!.amountField.text) ==
            null ||
        transDetailController!.amountField.text.contains("-")) {
      snackBar(context: context, title: "Enter Valid Amount");
    } else {
      TransactionModel transactionModel = TransactionModel(
        id: transDetailController!.savedTransaction
            ? transDetailController!.transactionId
            : DateTime.now().microsecondsSinceEpoch,
        title: transDetailController!.titleField.text,
        description: transDetailController!.descriptionField.text,
        amount: transDetailController!.amountField.text,
        isIncome: transDetailController!.isIncomeSelected ? 1 : 0,
        category: transDetailController!.selectedDepartment,
        dateTime: transDetailController!.savedTransaction
            ? transDetailController!.date
            : DateTime.now().toString(),
      );

      if (transDetailController!.savedTransaction) {
        transController!.updateTransaction(transactionModel);
      } else {
        transController!.insertTransaction(transactionModel);
      }
      transController!.fetchTransaction();
      reportController!.fetchTransaction();
      Navigator.pop(context);
    }
  }
}
