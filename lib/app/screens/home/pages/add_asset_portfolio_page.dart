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

import '../../settings/settings.dart';

class AddAssetPortfolioPage extends StatelessWidget {
  const AddAssetPortfolioPage({Key? key}) : super(key: key);

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
          height: 25,
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
                children: const [
                 /* Text(
                    "Archives",
                    style: boldTextStyle.copyWith(
                      fontSize: 25,
                    ),
                  ),
                  */

                  /*
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
                          children: [
                            Text(
                              "Generate report",
                              style: boldTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.download,
                              size: 18,
                              color: customBlueColor,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  */










                  SizedBox(
                    height: 6,
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

  List<String> filters = [
    "All transactions",
    //"Income",
    //"Expenses",
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



              GetSettingsButtonWithIcon(
                onTapFunction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddAndViewTransactionScreen(),
                    ),
                  );
                },
                label: "  Add Asset",
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
                        child: AboutiWealthView(
                          image: i == 0
                              ? DefaultImages.bank_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Bank & Cash" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
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
                        child: AboutiWealthView(
                          image: i == 0
                              ? DefaultImages.stocks_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Stocks" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
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
                        child: AboutiWealthView(
                          image: i == 0
                              ? DefaultImages.vehicle_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Vehicle" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
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
                        child: AboutiWealthView(
                          image: i == 0
                              ? DefaultImages.digital_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Digital Assets" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
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
                        child: AboutiWealthView(
                          image: i == 0
                              ? DefaultImages.real_estate_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Real Estate" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
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
                        child: AboutiWealthView(
                          image: i == 0
                              ? DefaultImages.custom_assets
                              : DefaultImages.h19b,
                          text1: i == 0 ? "Custom Asset" : "Your SD Box",
                          text2: i == 0 ? "Asset" : "Continue",
                        ),
                      ),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
