import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/bloc/archive_cubit/search_cubit/search_cubit.dart';
import 'package:pinext/app/models/pinext_transaction_model.dart';
import 'package:pinext/app/services/firebase_services.dart';
import 'package:pinext/app/shared/widgets/customYearPicker.dart';
import 'package:pinext/app/shared/widgets/custom_text_field.dart';

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

class ExportPage extends StatelessWidget {
  const ExportPage({Key? key}) : super(key: key);

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 8,
              ),








              /*
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAndViewTransactionScreen(),
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
                            "Add Asset",
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


              */



            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 8,
              ),




              /*



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


              */






            ],
          ),
        ),
        const SizedBox(
          height: 5,
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

                  /*
                  Text(
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
                          /*
                          String selectedMonth =
                              "0${int.parse(state.selectedMonth)}".length > 2
                                  ? "0${int.parse(state.selectedMonth)}"
                                      .substring(1, 3)
                                  : "0${int.parse(state.selectedMonth)}";
                          FileHandler().createReportForMonth(
                            int.parse(selectedMonth),
                            context,
                          );

                           */

                          /*
                          String selectedMonth =
                          "0${int.parse(state.selectedMonth)}".length > 2
                              ? "0${int.parse(state.selectedMonth)}"
                              .substring(1, 3)
                              : "0${int.parse(state.selectedMonth)}";

                          FileHandler().createExcel(
                            int.parse(selectedMonth),
                            context,
                          );

                           */
                          //working export function
                          //FileHandler().createReport();
                          //working export function

                          String selectedMonth =
                          "0${int.parse(state.selectedMonth)}".length > 2
                              ? "0${int.parse(state.selectedMonth)}"
                              .substring(1, 3)
                              : "0${int.parse(state.selectedMonth)}";

                          FileHandler().createExcelMonth(
                            int.parse(selectedMonth),
                            context,
                          );
                          //working export function
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(
                              Icons.download,
                              size: 30,
                              color: customBlueColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Share",
                              style: boldTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),


                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
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
            ],
          ),
        ),
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
        TransactionsList()
      ],
    );
  }
}

class TransactionsList extends StatelessWidget {
  TransactionsList({
    Key? key,
  }) : super(key: key);

  List<String> filters = [
    /*
    "All transactions",
    "Income",
    "Expenses",

     */
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
                height: 20,
              ),
              Text(
                "",
                style: boldTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 2,
              ),









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
                                  "No Record Available!",
                                  style: boldTextStyle.copyWith(
                                      fontSize: 25,
                                      color: customBlackColor.withOpacity(.5)),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "No Record Available!",
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
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Wrap(
                                  spacing: 2,
                                  runSpacing: -8,
                                  children: [
                                    ...List.generate(
                                      filters.length,
                                      (index) {
                                        return GestureDetector(
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
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<ArchiveSearchCubit>()
                                      .toogleSearch();
                                  context
                                      .read<UserStatisticsCubit>()
                                      .resetState();
                                },
                                child: BlocBuilder<ArchiveSearchCubit,
                                    ArchiveSearchState>(
                                  builder: (context, state) {

                                    return Icon(
                                      state.isSearchActive
                                          ? Icons.search_off_rounded
                                          : Icons.search_rounded,
                                      color: customBlueColor,
                                      size: 25,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          BlocBuilder<ArchiveSearchCubit, ArchiveSearchState>(
                            builder: (context, state) {
                              if (state.isSearchActive) {
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    CustomTextFormField(
                                      controller: searchController,
                                      hintTitle: "Search term",
                                      showClearSuffix: true,
                                      onChanged: (searchTerm) {
                                        context
                                            .read<ArchiveSearchCubit>()
                                            .updateSearchTerm(searchTerm);
                                      },
                                      validator: () {
                                        return null;
                                      },
                                      suffixButtonAction: () {
                                        searchController.clear();
                                        context
                                            .read<ArchiveSearchCubit>()
                                            .updateSearchTerm("");
                                      },
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                );
                              }
                              return SizedBox.fromSize();
                            },
                          ),
                          BlocBuilder<ArchiveSearchCubit, ArchiveSearchState>(
                            builder: (context, searchState) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
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
                                              height: 12,
                                            ),


                                            /*

                                            Text(
                                              "Statistics",
                                              style: boldTextStyle.copyWith(
                                                fontSize: 18,
                                              ),
                                            ),



                                            */
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [




                                                /*
                                                Text(
                                                  "Total Expenses: ",
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




                                                */
                                              ],
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
                                                  "Total Savings: ",
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [

                                                /*

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




                                                */
                                              ],
                                            ),
                                          ],
                                        );
                                },
                              );
                            },
                          )
                        ],
                      );









                    }),
                  );
                },
              ),









              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
