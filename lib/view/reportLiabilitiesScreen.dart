import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinext/app/screens/home/pages/app_settings_screen/app_settings_screen.dart';
import 'package:pinext/components/categorySelectAssetHeader.dart';
import 'package:pinext/components/categorySelectHeader.dart';
import 'package:pinext/components/categorySelectLiabiltyHeader.dart';
import 'package:pinext/constFiles/colors.dart';
import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/controller/liabilitiesReportController.dart';
import 'package:pinext/controller/reportController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pinext/view/auth/add_asset_screen.dart';
import 'package:pinext/view/auth/add_liability_screen.dart';
import 'package:provider/provider.dart';

class ReportLiabilitiesScreen extends StatelessWidget {
  const ReportLiabilitiesScreen({Key? key}) : super(key: key);
  static liabilitiesReportController? reportController;

  @override
  Widget build(BuildContext context) {
    reportController = Provider.of<liabilitiesReportController>(context);

    return Container(
        padding: const EdgeInsets.all(25.0),
        decoration: const BoxDecoration(
            color: tabContainer,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(

      children: [
        //category selector
        //const CategorySelectHeader(),
        const CategorySelectLiabiltyHeader(),
        //update to add/remove space between Tab buttons and rectangle box
        const SizedBox(height: 15,),



        GetSettingsButtonWithIcon(
          onTapFunction: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                //builder: (context) => const RelationshipManagerScreen(),
                builder: (context) => const AddLiabilityScreen(),
              ),
            );
          },


          /*
                onTapFunction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddAndViewTransactionScreen(),
                      //builder: (context) => const AddAssetView(),
                    ),
                  );
                },
                 */
          label: "  Add Liabilities",
          icon: FontAwesomeIcons.circlePlus,
          iconSize: 14,
        ),

        const SizedBox(height: 5,),

        //pie chart, if not full report
        if (reportController!.reportMethod != fullReport)
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: PieChart(
              dataMap: {
                //bankandcash: chartValue(reportController!.bankandcashIncomeAmount,
                //    reportController!.bankandcashExpenseAmount),
                //stocks: chartValue(reportController!.stocksIncomeAmount,
                //    reportController!.stocksExpenseAmount),
                //realestate: chartValue(reportController!.shoppingIncomeAmount,
                //    reportController!.shoppingExpenseAmount),
                //digitalassets: chartValue(reportController!.digitalassetsIncomeAmount,
                //    reportController!.digitalassetsExpenseAmount),
                //vehicle: chartValue(reportController!.vehicleIncomeAmount,
                    //reportController!.vehicleExpenseAmount),
                //custom: chartValue(reportController!.customIncomeAmount,
                  //  reportController!.customExpenseAmount),
                //office: chartValue(reportController!.officeIncomeAmount,
                  //  reportController!.officeExpenseAmount),
                loan: chartValue(reportController!.loanExpenseAmount,
                    reportController!.loanIncomeAmount),

                others: chartValue(reportController!.othersIncomeAmount,
                    reportController!.othersExpenseAmount),
              },
              animationDuration: const Duration(seconds: 1),
              ringStrokeWidth: 40,
              chartType: ChartType.ring,
              legendOptions: const LegendOptions(showLegends: true),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
              ),
            ),
          ),

        const SizedBox(height: 15,),

        /*
        //balance container, if full report
        if (reportController!.reportMethod == fullReport)
          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.85),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            //update to add/remove space between text and container listing assets and liability values in a rectangle box
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,

            child: Column(
              children: [
                /*
                Text("Balance: ${reportController!.total.toStringAsFixed(1)}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: whiteColor)),

                 */

                const SizedBox(height: 0.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          "Assets:\n${reportController!.totalIncome.toStringAsFixed(1)}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20.0, color: whiteColor)),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                          "Liabilites:\n${reportController!.totalExpense.toStringAsFixed(1)}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20.0, color: whiteColor)),
                    ),


                  ],
                ),
              ],
            ),
          ),
        */

        //update to add/remove space between list and rectangle box
        const SizedBox(height: 0,),
        //category list
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              /*
              tile(
                title: "Bank and Cash",
                svgName: bankSvg,
                incomeAmount: reportController!.bankandcashIncomeAmount,
                expenseAmount: reportController!.bankandcashExpenseAmount,
                //expenseAmount: (10),
              ),
              tile(
                title: "Stocks",
                svgName: stocksSvg,
                incomeAmount: reportController!.stocksIncomeAmount,
                expenseAmount: reportController!.stocksExpenseAmount,
              ),
              tile(
                title: "Vehicle",
                svgName: vehicleSvg,
                incomeAmount: reportController!.vehicleIncomeAmount,
                expenseAmount: reportController!.vehicleExpenseAmount,
              ),
              tile(
                title: "Digital Assets",
                svgName: digitalassetSvg,
                incomeAmount: reportController!.digitalassetsIncomeAmount,
                expenseAmount: reportController!.digitalassetsExpenseAmount,
              ),
              tile(
                title: "Real Estate",
                svgName: realestateSvg,
                incomeAmount: reportController!.shoppingIncomeAmount,
                expenseAmount: reportController!.shoppingExpenseAmount,
              ),
              tile(
                title: "Custom",
                svgName: customSvg,
                incomeAmount: reportController!.customIncomeAmount,
                expenseAmount: reportController!.customExpenseAmount,
              ),
              */
              tile(
                title: "Loan",
                svgName: loanSvg,
                expenseAmount: reportController!.loanExpenseAmount,
                incomeAmount: reportController!.loanIncomeAmount,
              ),



              tile(
                title: "Others",
                svgName: othersSvg,
                incomeAmount: reportController!.othersIncomeAmount,
                expenseAmount: reportController!.othersExpenseAmount,
              ),

              /*
              tile(
                title: "Office",
                svgName: officeSvg,
                incomeAmount: reportController!.officeIncomeAmount,
                expenseAmount: reportController!.officeExpenseAmount,
              ),

               */


            ],
          ),
        ),
      ],
    )
    );
  }

  ListTile tile({
    required String title,
    required String svgName,
    required double incomeAmount,
    required double expenseAmount,
  }) {
    double percentage = 0;
    String trailingAmount = "0.0";

    /*
    if (reportController!.reportMethod == income) {
      percentage = incomeAmount / reportController!.totalIncome * 100;
      if (incomeAmount != 0)
        trailingAmount = "+${incomeAmount.toStringAsFixed(1)}";
    }

     */

    if (reportController!.reportMethod == expense) {
      percentage = expenseAmount / reportController!.totalExpense * 100;
      if (expenseAmount != 0)
        trailingAmount = "-${expenseAmount.toStringAsFixed(1)}";
    }


    if (reportController!.reportMethod == fullReport) {
      trailingAmount = (incomeAmount - expenseAmount).toStringAsFixed(1);
    }

    return ListTile(
      title: Text(title),
      contentPadding: const EdgeInsets.all(10.0),
      leading: Container(
        height: 50.0,
        width: 50.0,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            color: whiteColor,
            boxShadow: [BoxShadow(color: blackColor)],
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: SvgPicture.asset(
          svgPath(svgName),
          height: 35.0,
          color: svgColor,
        ),
      ),
      subtitle: reportController!.reportMethod == fullReport

          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //Text("$income: ${incomeAmount.toStringAsFixed(1)}",
                //Text("Assets: ${incomeAmount.toStringAsFixed(1)}",
                //Text("Asset",
                //    style: TextStyle(color: incomeGreen)),
                //Text("$expense: ${expenseAmount.toStringAsFixed(1)}",
                  Text("Liability",
                    style: TextStyle(color: expenseRed)),
              ],
            )


          : const Text(
          //"Percentage : ${percentage > 0 ? percentage.toStringAsFixed(1) : 0}%"),
        ""),

      trailing: Text(trailingAmount,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: reportController!.reportMethod == expense
                  ? incomeGreen
                  : reportController!.reportMethod == income
                      ? expenseRed
                      : blackColor)),




    );

  }

  double chartValue(double incomeAmount, double expenseAmount) {
    if (reportController!.reportMethod == expense) return expenseAmount;
    if (reportController!.reportMethod == income) return incomeAmount;
    return incomeAmount - expenseAmount;
  }
}
