import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/bloc/archive_cubit/search_cubit/search_cubit.dart';
import 'package:pinext/app/models/pinext_transaction_model.dart';
import 'package:pinext/app/services/firebase_services.dart';
import 'package:pinext/app/shared/widgets/customYearPicker.dart';
import 'package:pinext/app/shared/widgets/custom_text_field.dart';
import 'package:pinext/market_api_stocks.dart';
import 'package:pinext/view/assetsOnlyReportScreen.dart';
import 'package:pinext/view/auth/add_asset_screen.dart';
import 'package:pinext/widget/add_asset_view.dart';
import 'package:pinext/widget/empty_button_bank_and_cash.dart';
import 'package:pinext/widget/empty_button_custom.dart';
import 'package:pinext/widget/empty_button_digital.dart';
import 'package:pinext/widget/empty_button_real_estate.dart';
import 'package:pinext/widget/empty_button_stocks.dart';
import 'package:pinext/widget/empty_button_vehicle.dart';
import 'package:pinext/widget/empty_buttons.dart';

import '../../../../config/images.dart';
import '../../../../widget/about_iwealth_view.dart';
import '../../../app_data/app_constants/domentions.dart';
import '../../../app_data/app_constants/fonts.dart';
import '../../../bloc/archive_cubit/archive_cubit.dart';
import '../../../bloc/archive_cubit/user_statistics_cubit/user_statistics_cubit.dart';
import '../../../bloc/homeframe_cubit/homeframe_page_cubit.dart';
import '../../../bloc/userBloc/user_bloc.dart';
import '../../../services/date_time_services.dart';
import '../../../services/handlers/file_handler.dart';
import '../../../shared/widgets/transaction_details_card.dart';
import '../../add_and_view_transaction/add_and_view_transaction.dart';
import '../../add_and_view_transaction/add_and_view_transaction_again.dart';
import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/constFiles/colors.dart';
import '../../settings/settings.dart';



import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinext/app/screens/files/user_files_view.dart';


//Adding category feature
import 'package:pinext/components/categorySelectHeader.dart';
import 'package:pinext/constFiles/colors.dart';
import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/controller/reportController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:pinext/view/assetsOnlyReportScreen.dart';
import 'package:pinext/controller/assetsOnlyReportController.dart';





class AssetPortfolioPage extends StatelessWidget {
  const AssetPortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArchiveCubit(),
        ),
        BlocProvider(
          create: (context) => ArchiveSearchCubit(),
        ),
      ],
      child: const ArchiveMonthView(),
    );
  }
}



class AssetsOnlyReportScreen extends StatelessWidget {
  const AssetsOnlyReportScreen({Key? key}) : super(key: key);
  static AssetsOnlyReportController? reportController;


  @override
  Widget build(BuildContext context) {
    reportController = Provider.of<AssetsOnlyReportController>(context);

    return Column(
      children: [
        //category selector
        const CategorySelectHeader(),
    //AssetsOnlyReportController(),
        //pie chart, if not full report
        if (reportController!.reportMethod != fullReport)
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: PieChart(
              dataMap: {
                bankandcash: chartValue(reportController!.bankandcashIncomeAmount,
                    reportController!.bankandcashExpenseAmount),
                stocks: chartValue(reportController!.stocksIncomeAmount,
                    reportController!.stocksExpenseAmount),
                realestate: chartValue(reportController!.shoppingIncomeAmount,
                    reportController!.shoppingExpenseAmount),
                digitalassets: chartValue(reportController!.digitalassetsIncomeAmount,
                    reportController!.digitalassetsExpenseAmount),
                vehicle: chartValue(reportController!.vehicleIncomeAmount,
                    reportController!.vehicleExpenseAmount),
                custom: chartValue(reportController!.customIncomeAmount,
                    reportController!.customExpenseAmount),
                loan: chartValue(reportController!.loanIncomeAmount,
                    reportController!.loanExpenseAmount),
                //office: chartValue(reportController!.officeIncomeAmount,
                //    reportController!.officeExpenseAmount),
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

        //balance container, if full report
        if (reportController!.reportMethod == fullReport)
          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.85),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              children: [
                Text("Balance: ${reportController!.total.toStringAsFixed(1)}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          "Income:\n${reportController!.totalIncome.toStringAsFixed(1)}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20.0, color: Colors.white)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          "Expense:\n${reportController!.totalExpense.toStringAsFixed(1)}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20.0, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),

        //category list
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              tile(
                title: "Bank and Cash",
                svgName: bankSvg,
                incomeAmount: reportController!.bankandcashIncomeAmount,
                expenseAmount: reportController!.bankandcashExpenseAmount,
              ),
              tile(
                title: "Family",
                svgName: stocksSvg,
                incomeAmount: reportController!.stocksIncomeAmount,
                expenseAmount: reportController!.stocksExpenseAmount,
              ),
              tile(
                title: "Shopping",
                svgName: realestateSvg,
                incomeAmount: reportController!.shoppingIncomeAmount,
                expenseAmount: reportController!.shoppingExpenseAmount,
              ),
              tile(
                title: "Food",
                svgName: digitalassetSvg,
                incomeAmount: reportController!.digitalassetsIncomeAmount,
                expenseAmount: reportController!.digitalassetsExpenseAmount,
              ),
              tile(
                title: "Vehicle",
                svgName: vehicleSvg,
                incomeAmount: reportController!.vehicleIncomeAmount,
                expenseAmount: reportController!.vehicleExpenseAmount,
              ),
              tile(
                title: "Salon",
                svgName: customSvg,
                incomeAmount: reportController!.customIncomeAmount,
                expenseAmount: reportController!.customExpenseAmount,
              ),
              tile(
                title: "Devices",
                svgName: loanSvg,
                incomeAmount: reportController!.loanIncomeAmount,
                expenseAmount: reportController!.loanExpenseAmount,
              ),
              /*
              tile(
                title: "Office",
                svgName: officeSvg,
                incomeAmount: reportController!.officeIncomeAmount,
                expenseAmount: reportController!.officeExpenseAmount,
              ),
               */
              tile(
                title: "Others",
                svgName: othersSvg,
                incomeAmount: reportController!.othersIncomeAmount,
                expenseAmount: reportController!.othersExpenseAmount,
              ),
            ],
          ),
        ),
      ],
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
    if (reportController!.reportMethod == income) {
      percentage = incomeAmount / reportController!.totalIncome * 100;
      if (incomeAmount != 0)
        trailingAmount = "+${incomeAmount.toStringAsFixed(1)}";
    }

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
            color: Colors.white,
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
        children: [
          Text("$income: ${incomeAmount.toStringAsFixed(1)}",
              style: const TextStyle(color: incomeGreen)),
          Text("$expense: ${expenseAmount.toStringAsFixed(1)}",
              style: const TextStyle(color: expenseRed)),
        ],
      )
          : Text(
          "Percentage : ${percentage > 0 ? percentage.toStringAsFixed(1) : 0}%"),
      trailing: Text(trailingAmount,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: reportController!.reportMethod == income
                  ? incomeGreen
                  : reportController!.reportMethod == expense
                  ? expenseRed
                  : blackColor)),
    );
  }

  double chartValue(double incomeAmount, double expenseAmount) {
    if (reportController!.reportMethod == income) return incomeAmount;
    if (reportController!.reportMethod == expense) return expenseAmount;
    return incomeAmount - expenseAmount;
  }
}


class ArchiveMonthView extends StatefulWidget {
  const ArchiveMonthView({Key? key}) : super(key: key);

  @override
  State<ArchiveMonthView> createState() => _ArchiveMonthViewState();
}

class _ArchiveMonthViewState extends State<ArchiveMonthView> {
  String dateTimeNow = DateTime.now().toString();

  late ScrollController monthScrollController;
  @override
  void initState() {
    monthScrollController =
        ScrollController(initialScrollOffset: 40.0 * int.parse(currentMonth));
    super.initState();
  }

  @override
  void dispose() {
    monthScrollController.dispose();
    super.dispose();
  }

  String getGreetings() {
    int currentHour = DateTime.now().hour;
    if (currentHour > 0 && currentHour <= 5) {
      return "Hello,";
    } else if (currentHour > 5 && currentHour <= 11) {
      return "Good morning,";
    } else if (currentHour > 11 && currentHour <= 18) {
      return "Good afternoon,";
    } else if (currentHour > 18 && currentHour <= 24) {
      return "Good evening,";
    }
    return "Hello";
  }

  @override
  Widget build(BuildContext context) {
    context.read<ArchiveSearchCubit>().resetState();
    context.read<UserStatisticsCubit>().resetState();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*
              Text(
                getGreetings(),
                style: regularTextStyle.copyWith(
                  color: customBlackColor.withOpacity(.6),
                ),
              ),
              */
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is AuthenticatedUserState) {
                    return Row(
                      children: [

                        Text(
                          getGreetings(),
                          style: regularTextStyle.copyWith(
                            color: customBlackColor.withOpacity(.6),
                          ),
                        ),
                        Text(
                          " 👋",
                          style: TextStyle(
                            fontSize: 15,
                            color: customBlackColor.withOpacity(.8),
                          ),
                        ),
                        Text(
                          state.username,
                          style: regularTextStyle.copyWith(
                            color: customBlackColor.withOpacity(.6),
                            /*style: cursiveTextStyle.copyWith(
                                fontSize: 30,
                                color: customBlackColor.withOpacity(.8),*/
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              // const SizedBox(
              //   height: 8,
              // ),
            ],
          ),
        ),

        //Old UI button begin
    /*
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAndViewTransactionAgainScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(
                    defaultPadding,
                  ),
                  width: getWidth(context),
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(
                      defaultBorder,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add liability",
                            style: boldTextStyle.copyWith(
                              fontSize: 21,
                            ),
                          ),
                          Text(
                            "Click to continue",
                            style: boldTextStyle.copyWith(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),






            ],
          ),
        ),
*/
        //Old UI button begin
        const SizedBox(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 /* Text(
                    "Archives",
                    style: boldTextStyle.copyWith(
                      fontSize: 25,
                    ),
                  ),
                  */


                  BlocBuilder<ArchiveCubit, ArchiveState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          String selectedMonth =
                          "0${int.parse(state.selectedMonth)}".length > 2
                              ? "0${int.parse(state.selectedMonth)}"
                              .substring(1, 3)
                              : "0${int.parse(state.selectedMonth)}";
                          FileHandler().createReportForMonth(
                            int.parse(selectedMonth),
                            context,
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            /*
                            Text(
                              "Generate report",
                              style: boldTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),

                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.download,
                              size: 18,
                              color: customBlueColor,
                            ),

                             */
                          ],
                        ),
                      );
                    },
                  ),










                  const SizedBox(
                    height: 0,
                  ),
                ],
              ),





              /*
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      var selectedDate = DateTime.now();
                      showDialog(
                        context: context,
                        builder: (BuildContext builderContext) {
                          return AlertDialog(
                            title: Text(
                              "Please select a year to view records from that year.",
                              style: regularTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            content: SizedBox(
                              width: 300,
                              height: 300,
                              child: CustomYearPicker(
                                firstDate:
                                DateTime(DateTime.now().year - 100, 1),
                                lastDate: DateTime(DateTime.now().year, 1),
                                initialDate: DateTime.now(),
                                selectedDate: selectedDate,
                                onChanged: (DateTime dateTime) {
                                  context
                                      .read<ArchiveCubit>()
                                      .changeYear(dateTime.year.toString());
                                  context
                                      .read<UserStatisticsCubit>()
                                      .resetState();

                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: BlocBuilder<ArchiveCubit, ArchiveState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.selectedYear,
                              style: boldTextStyle.copyWith(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.edit_calendar_rounded,
                              color: customBlueColor,
                              size: 25,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
*/













            ],
          ),
        ),





        /*
        Material(
          elevation: 4,
          child: Container(
            color: whiteColor,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: monthScrollController,
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<ArchiveCubit, ArchiveState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      ...List.generate(months.length, (index) {
                        String currentMonth = months[index];
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<ArchiveCubit>()
                                .changeMonth((index).toString());
                            context.read<UserStatisticsCubit>().resetState();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  right: currentMonth == "December"
                                      ? defaultPadding
                                      : 8),
                              child: state.selectedMonth.toString() ==
                                  (index).toString()
                                  ? Chip(
                                label: Text(
                                  currentMonth,
                                  style: regularTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: whiteColor),
                                ),
                                backgroundColor: customBlueColor,
                              )
                                  : Chip(
                                elevation: 0,
                                label: Text(
                                  currentMonth,
                                  style: regularTextStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color:
                                    customBlackColor.withOpacity(.6),
                                  ),
                                ),
                                backgroundColor: greyColor,
                              )
                            // Container(
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 8,
                            //     vertical: 8,
                            //   ),
                            //   decoration: const BoxDecoration(
                            //     color: Colors.transparent,
                            //   ),
                            //   child: Text(
                            //     currentMonth,
                            //     style: regularTextStyle.copyWith(
                            //       fontWeight: FontWeight.normal,
                            //       color: customBlackColor.withOpacity(.4),
                            //     ),
                            //   ),
                            // ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          ),
        ),






        */
        TransactionsList()
      ],
    );
  }
}








class TransactionsList extends StatelessWidget {
  TransactionsList({
    Key? key,
  }) : super(key: key);

  final

  List<String> filters = [
    //"All transactions",
    //"Income",
    "Expenses",
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [






              const SizedBox(
                height: 0,
              ),
              Text(
                "",
                style: boldTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 0,
              ),




              /*
              BlocBuilder<ArchiveCubit, ArchiveState>(
                builder: (context, state) {
                  String selectedMonth =
                  "0${int.parse(state.selectedMonth) + 1}".length > 2
                      ? "0${int.parse(state.selectedMonth) + 1}"
                      .substring(1, 3)
                      : "0${int.parse(state.selectedMonth) + 1}";
                  return StreamBuilder(
                    stream: FirebaseServices()
                        .firebaseFirestore
                        .collection('pinext_users')
                        .doc(FirebaseServices().getUserId())
                        .collection('pinext_transactions')
                        .doc(state.selectedYear)
                        .collection(selectedMonth)
                        .orderBy(
                      "transactionDate",
                      descending: true,
                    )
                        .snapshots(),
                    builder: ((context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SizedBox.shrink(),
                        );
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 300,
                          child: Container(
                            // height: double.maxFinite,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "404",
                                  style: boldTextStyle.copyWith(
                                      fontSize: 25,
                                      color: customBlackColor.withOpacity(.5)),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "No record found!",
                                  style: regularTextStyle.copyWith(
                                      color: customBlackColor.withOpacity(.5)),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  ":(",
                                  style: regularTextStyle.copyWith(
                                      color: customBlackColor.withOpacity(.5)),
                                ),
                              ],
                            ),
                          ),
                        );
                      }







                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [



                          /*
                          Row(
                            children: [
                              Expanded(
                                child: Wrap(
                                  spacing: 5,
                                  runSpacing: -8,
                                  children: [
                                    ...List.generate(
                                      filters.length,
                                          (index) {
                                        return GestureDetector(

                                          onTap: () {
                                            String selectedFilter = filters[index].toString();
                                            if (state.selectedFilter != selectedFilter) {
                                              context
                                                  .read<ArchiveCubit>()
                                                  .changeFilter(selectedFilter);
                                            } else {
                                              context
                                                  .read<ArchiveCubit>()
                                                  .changeFilter(
                                                "All transactions",
                                              );
                                            }
                                          /*
                                          onTap: () {
                                            String selectedFilter =
                                            filters[index].toString();
                                            if (state.selectedFilter !=
                                                selectedFilter) {
                                              context
                                                  .read<ArchiveCubit>()
                                                  .changeFilter(selectedFilter);
                                            } else {
                                              context
                                                  .read<ArchiveCubit>()
                                                  .changeFilter(
                                                "All transactions",
                                              );
                                            }

                                           */

                                            context
                                                .read<UserStatisticsCubit>()
                                                .resetState();
                                          },
                                          child: Chip(
                                            elevation: 0,
                                            label: Text(
                                              filters[index].toString(),
                                              style: regularTextStyle.copyWith(
                                                color: filters[index] ==
                                                    state.selectedFilter
                                                    ? whiteColor
                                                    : customBlackColor
                                                    .withOpacity(.6),
                                              ),
                                            ),
                                            backgroundColor: filters[index] ==
                                                state.selectedFilter
                                                ? customBlueColor
                                                : greyColor,
                                          ),
                                        );







                                      },
                                    ).toList(),
                                  ],
                                ),
                              ),


                            ],
                          ),

                           */



                          /*
                          BlocBuilder<ArchiveSearchCubit, ArchiveSearchState>(
                            builder: (context, searchState) {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: ((context, index) {
                                    if (snapshot.data!.docs.isEmpty) {
                                      return const Text("No data found! :(");
                                    }
                                    PinextTransactionModel
                                    pinextTransactionModel =
                                    PinextTransactionModel.fromMap(
                                      snapshot.data!.docs[index].data(),
                                    );
                                    TransactionDetailsCard
                                    transactionDetailsCard =
                                    TransactionDetailsCard(
                                        pinextTransactionModel:
                                        pinextTransactionModel);
                                    context
                                        .read<UserStatisticsCubit>()
                                        .updateStatistics(
                                      amount: double.parse(
                                          pinextTransactionModel.amount),
                                      isExpense: pinextTransactionModel
                                          .transactionType ==
                                          "Expense",
                                    );
                                    if (state.selectedFilter ==
                                        "All transactions") {
                                      if (searchState.isSearchActive) {
                                        if (pinextTransactionModel.details
                                            .toLowerCase()
                                            .contains(searchState.searchTerm
                                            .toLowerCase())) {
                                          return transactionDetailsCard;
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      }
                                      return transactionDetailsCard;
                                    } else if (state.selectedFilter ==
                                        "Income" &&
                                        pinextTransactionModel
                                            .transactionType ==
                                            "Income") {
                                      if (searchState.isSearchActive) {
                                        if (pinextTransactionModel.details
                                            .toLowerCase()
                                            .contains(searchState.searchTerm
                                            .toLowerCase())) {
                                          return transactionDetailsCard;
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      }
                                      return transactionDetailsCard;
                                    } else if (state.selectedFilter ==
                                        "Expenses" &&
                                        pinextTransactionModel
                                            .transactionType ==
                                            "Expense") {
                                      if (searchState.isSearchActive) {
                                        if (pinextTransactionModel.details
                                            .toLowerCase()
                                            .contains(searchState.searchTerm
                                            .toLowerCase())) {
                                          return transactionDetailsCard;
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      }
                                      return transactionDetailsCard;
                                    }
                                    return const SizedBox.shrink();
                                  }),
                                ),
                              );
                            },
                          ),

                           */



                          /*
                          BlocBuilder<ArchiveSearchCubit, ArchiveSearchState>(
                            builder: (context, archiveSearchState) {
                              return BlocBuilder<UserStatisticsCubit,
                                  UserStatisticsState>(
                                builder: (context, state) {
                                  return archiveSearchState.isSearchActive
                                      ? const SizedBox.shrink()
                                      : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [




                                      const SizedBox(
                                        height: 0,
                                      ),
                                            Text(
                                              "Statistics",
                                              style: boldTextStyle.copyWith(
                                                fontSize: 18,
                                              ),
                                            ),

                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [

                                          Text(
                                            "Total Liability Amount: ",
                                            style:
                                            regularTextStyle.copyWith(
                                              color: customBlackColor
                                                  .withOpacity(.80),
                                            ),
                                          ),
                                          Text(
                                            "-${state.totalExpenses} NGN.",
                                            style: boldTextStyle.copyWith(
                                              color:
                                              Colors.redAccent[400],
                                            ),
                                          )


                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [





                                                Text(
                                                  "Total Assets Amount: ",
                                                  style:
                                                      regularTextStyle.copyWith(
                                                    color: customBlackColor
                                                        .withOpacity(.80),
                                                  ),
                                                ),
                                          Text(
                                            "+${state.totalSavings} NGN.",
                                            style: boldTextStyle.copyWith(
                                              color: Colors.green,
                                            ),
                                          )




                                        ],
                                      ),

                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        height: 1,
                                        width: getWidth(context),
                                        color: customBlackColor
                                            .withOpacity(.05),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children:  [



                                                Text(
                                                  "Outcome: ",
                                                  style:
                                                      regularTextStyle.copyWith(
                                                    color: customBlackColor
                                                        .withOpacity(.80),
                                                  ),
                                                ),
                                                Text(
                                                  "${state.outcome} NGN.",
                                                  style: boldTextStyle.copyWith(
                                                    color: customBlueColor,
                                                  ),
                                                )





                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )

                           */

                        ],
                      );









                    }),
                  );
                },
              ),
              */

              //Let us add categories to the portfolio items
              //30052023



              GetSettingsButtonWithIcon(
                onTapFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => const RelationshipManagerScreen(),
                      builder: (context) => const AddAssetScreen(),
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
                label: "  Add Assets",
                icon: FontAwesomeIcons.circlePlus,
                iconSize: 14,
              ),

              const SizedBox(
                height: 0,
              ),


              //Quick links area
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 1; i++)
                    //for (var i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: EmptyButtonBankAndCashView(
                          image: i == 0
                              ? DefaultImages.bank_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Bank & Cash" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
                          text3: i == 0 ? "": "",
                          text4: i == 0 ? "" : "",
                        ),
                      ),
                  ],
                ),
              ),


              Padding(
                padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 1; i++)
                    //for (var i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: EmptyButtonStocksView(
                          image: i == 0
                              ? DefaultImages.stocks_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Stocks" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
                          text3: i == 0 ? "" : "",
                          text4: i == 0 ? "" : "",
                        ),
                      ),
                  ],
                ),
              ),


              Padding(
                padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 1; i++)
                    //for (var i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: EmptyButtonVehicleView(
                          image: i == 0
                              ? DefaultImages.vehicle_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Vehicle" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
                          text3: i == 0 ? "" : "",
                          text4: i == 0 ? "" : "",
                        ),
                      ),
                  ],
                ),
              ),



              Padding(
                padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 1; i++)
                    //for (var i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: EmptyButtonDigitalView(
                          image: i == 0
                              ? DefaultImages.digital_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Digital Assets" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
                          text3: i == 0 ? "" : "",
                          text4: i == 0 ? "" : "",
                        ),
                      ),
                  ],
                ),
              ),



              Padding(
                padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 1; i++)
                    //for (var i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: EmptyButtonRealEstateView(
                          image: i == 0
                              ? DefaultImages.real_estate_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Real Estate" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
                          text3: i == 0 ? "" : "",
                          text4: i == 0 ? "" : "",
                        ),
                      ),
                  ],
                ),
              ),



              Padding(
                padding:
                const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < 1; i++)
                    //for (var i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: EmptyButtonCustomView(
                          image: i == 0
                              ? DefaultImages.custom_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Custom Asset" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
                          text3: i == 0 ? "" : "",
                          text4: i == 0 ? "" : "",
                        ),
                      ),
                  ],
                ),
              ),



              BlocBuilder<ArchiveSearchCubit, ArchiveSearchState>(
                builder: (context, archiveSearchState) {
                  return BlocBuilder<UserStatisticsCubit,
                      UserStatisticsState>(
                    builder: (context, state) {
                      return archiveSearchState.isSearchActive
                          ? const SizedBox.shrink()
                          : Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 0,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: const [
                              /*
                              Text(
                                "Total Assets Amount: ",
                                style:
                                regularTextStyle.copyWith(
                                  color: customBlackColor
                                      .withOpacity(.80),
                                ),
                              ),
                              Text(
                                "+${state.totalSavings} NGN.",
                                style: boldTextStyle.copyWith(
                                  color: Colors.green,
                                ),
                              )

                               */

                            ],
                          ),

                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 1,
                            width: getWidth(context),
                            color: customBlackColor
                                .withOpacity(.05),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      );
                    },
                  );
                },
              )


            ],
          ),
        ),
      ),
    );
  }
}
