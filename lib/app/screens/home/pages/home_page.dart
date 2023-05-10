import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinext/app/app_data/app_constants/fonts.dart';
import 'package:pinext/app/models/pinext_card_model.dart';
import 'package:pinext/app/models/pinext_goal_model.dart';
import 'package:pinext/app/screens/goals_and_milestones/view_goals_and_milestones_screen.dart';
import 'package:pinext/app/screens/home/homeframe.dart';
import 'package:pinext/app/screens/profile/profile_screen.dart';
import 'package:pinext/app/screens/settings/settings.dart';
import 'package:pinext/app/services/firebase_services.dart';
import 'package:pinext/app/shared/widgets/custom_snackbar.dart';
import 'package:pinext/app/shared/widgets/pinext_goal_minimized.dart';
import 'package:pinext/view/home/card.dart';

import '../../../../widget/about_iwealth_view.dart';
import '../../../app_data/app_constants/constants.dart';
import '../../../app_data/app_constants/domentions.dart';
import '../../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../../app_data/theme_data/colors.dart';
import '../../../bloc/homeframe_cubit/homeframe_page_cubit.dart';
import '../../../bloc/homepage_cubit/homepage_cubit.dart';
import '../../../bloc/userBloc/user_bloc.dart';
import '../../../models/pinext_transaction_model.dart';
import '../../../services/date_time_services.dart';
import '../../../shared/widgets/pinext_card.dart';
import '../../../shared/widgets/transaction_details_card.dart';
import '../../add_and_view_transaction/add_and_view_transaction_again.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:pinext/app/services/carousel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/view/home/card.dart';
import 'package:pinext/view/home/top_move_screen.dart';
import 'package:pinext/view/market/about_screen.dart';
import 'package:pinext/view/market/bitcoin_screen.dart';
import 'package:pinext/view/market/empty_screen.dart';
import 'package:pinext/view/market/lifechecker_screen.dart';
import 'package:pinext/view/market/notifications_screen.dart';
import 'package:pinext/view/market/share_sheet.dart';
import 'package:pinext/view/market/stocklist_view_screen.dart';
import 'package:pinext/view/profile/notification_screen.dart';
import 'package:pinext/view/profile/scan_screen.dart';
import 'package:pinext/widget/about_iwealth_view.dart';
import 'package:pinext/widget/coin_view.dart';
import 'package:pinext/widget/lifechecker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import 'consumable_store.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  //StreamSubscription<List<PurchaseDetails>> _subscription;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomepageCubit(),
        ),
      ],
      child: HomepageView(),
    );
  }
}

class HomepageView extends StatelessWidget {
  HomepageView({
    Key? key,
  }) : super(key: key);

  final List homepageFilters = [
    'Overview'
    /*
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly'*/
  ];

  Map<String, double> demoData = {
    "Office fare": 50,
    "Lunch": 150,
    "Snacks": 100,
    "Hangout": 80,
  };

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
    return SizedBox(
      height: getHeight(context),
      width: getWidth(context),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                  ), */
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

                  const SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    BlocBuilder<HomepageCubit, HomepageState>(
                      builder: (context, state) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: homepageFilters.length,
                          itemBuilder: ((context, index) {
                            return MenuFilterPill(
                              filtertitle: homepageFilters[index],
                              selectedFilter: state.selectedFilter,
                            );
                          }),
                        );
                      },
                    ),
                    const SizedBox(
                      width: defaultPadding - 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  /*
                  Text(
                    "Balance",
                    style: boldTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  */
                  //SizedBox(height: 2,),






                  CardView(),
                  //user balance section start
              /*
                  Container(
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
                              "Your current NET. balance is",
                              style: regularTextStyle,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            //Displays the users balance - start
                            BlocBuilder<UserBloc, UserState>(
                              builder: (context, state) {
                                if (state is AuthenticatedUserState) {
                                  return Text(
                                    "${state.netBalance} ₦",
                                    style: boldTextStyle.copyWith(
                                      fontSize: 25,
                                    ),
                                  );
                                }
                                return Text(
                                  "Loading...",
                                  style: boldTextStyle.copyWith(
                                    fontSize: 20,
                                  ),
                                );
                              },
                            ),



                            //Displays the users balance - end
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: const [

                                /*

                                Text(
                                  "No. of Income items: 0",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Expense items: 0",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),



                                */
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // handle button 1 press
                                context
                                    .read<HomeframeCubit>()
                                    .openAddTransactionsPage(context);
                              },
                              child: Icon(Icons.add),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: CircleBorder(),
                                padding: const EdgeInsets.all(16),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // handle button 2 press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddAndViewTransactionAgainScreen(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.send_outlined),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: CircleBorder(),
                                padding: const EdgeInsets.all(16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  */
                ],
              ),
            ),

            //user balance section end




            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              /*child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 8,
                  ),
                  Container(
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
                              "Link to new layout",
                              style: boldTextStyle.copyWith(
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Click to continue",
                              style: boldTextStyle.copyWith(
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                            ),



                          ],
                        ),





                      ],





                    ),
                  ),




                ],



              ),*/


            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    // height: 16,
                    height: 22,
                  ),
                  const Carousel(),

                  /*Text(
                    "Budget Estimations",
                    style: boldTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),

                  */








              /*
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your budget for ${months[int.parse(currentMonth) - 1]}",
                              style: regularTextStyle.copyWith(
                                color: customBlackColor.withOpacity(.6),
                              ),
                            ),
                            BlocBuilder<UserBloc, UserState>(
                              builder: (context, state) {
                                if (state is AuthenticatedUserState) {
                                  return Text(
                                    "${state.monthlyBudget} ₦",
                                    style: regularTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              height: 5,
                              width: getWidth(context),
                              color: customBlueColor.withOpacity(.2),
                            ),
                            BlocBuilder<UserBloc, UserState>(
                              builder: (context, state) {
                                if (state is AuthenticatedUserState) {
                                  return LayoutBuilder(
                                    builder: ((context, constraints) {
                                      return Container(
                                        height: 5,
                                        width: constraints.maxWidth *
                                            (double.parse(
                                                    state.monthlyExpenses) /
                                                double.parse(
                                                    state.monthlyBudget)),
                                        decoration: BoxDecoration(
                                            color: ((double.parse(state
                                                                    .monthlyExpenses) /
                                                                double.parse(state
                                                                    .monthlyBudget)) *
                                                            100)
                                                        .ceil() >
                                                    100
                                                ? Colors.redAccent[400]
                                                : ((double.parse(state.monthlyExpenses) /
                                                                    double.parse(
                                                                        state
                                                                            .monthlyBudget)) *
                                                                100)
                                                            .ceil() >
                                                        50
                                                    ? Colors.yellowAccent[800]
                                                    : customBlueColor,
                                            borderRadius: BorderRadius.circular(
                                                defaultBorder)),
                                      );
                                    }),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            if (state is AuthenticatedUserState) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Your have spent ",
                                          style: regularTextStyle.copyWith(
                                            color: customBlackColor
                                                .withOpacity(.6),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${((double.parse(state.monthlyExpenses) / double.parse(state.monthlyBudget)) * 100).ceil()}%",
                                          style: boldTextStyle.copyWith(
                                            color: Colors.red.withOpacity(.9),
                                          ),
                                        ),
                                        TextSpan(
                                          text: " of your budget!",
                                          style: regularTextStyle.copyWith(
                                            color: customBlackColor
                                                .withOpacity(.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "- ${state.monthlyExpenses} ₦",
                                    style: boldTextStyle.copyWith(
                                      color: Colors.red.withOpacity(.9),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ],
                    ),
                  ),



                  */
                  //Quick links area
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Quick links",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < 1; i++)
                        //for (var i = 0; i < 2; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: AboutiWealthView(
                              image: i == 0
                                  ? DefaultImages.h14b
                                  : DefaultImages.h19b,
                              text1: i == 0 ? "About" : "Your SD Box",
                              text2: i == 0 ? "iWealth" : "Continue",
                              text3: i == 0 ? "" : "",
                              text4: i == 0 ? "" : "",
                            ),
                          ),
                      ],
                    ),
                  ),





                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, /*top: 15*/),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < 1; i++)
                        //for (var i = 0; i < 2; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: LifecheckerView(
                              image: i == 0
                                  ? DefaultImages.h14f
                                  : DefaultImages.h19b,
                              text1: i == 0 ? "Life Checker" : "Your SD Box",
                              text2: i == 0 ? "iWealth" : "Continue",
                              text3: i == 0 ? "" : "",
                              text4: i == 0 ? "" : "",
                            ),
                          ),
                      ],
                    ),
                  ),





                  /*
                  const SizedBox(
                    height: 12,
                  ),

                   */
                  /*
                  Text(
                    "Quick Links",
                    style: boldTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  */

                  /*
                  const SizedBox(
                    height: 12,
                  ),


                  const SizedBox(
                    height: 8,
                  ),

                  */
                  /*
                  GetSettingsButtonWithIcon(
                    onTapFunction: () {
                      /*Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PinextUsersScreen(currentUserId: currentUserId),
                        ),
                      );*/
                    },
                    label: "About",
                    icon: FontAwesomeIcons.addressBook,
                    iconSize: 14,
                  ),


                  const SizedBox(
                    height: 8,
                  ),
                  */

                  //Old UI About button ends here

                  //Old UI Life Checker button starts here
                  /*
                  GetSettingsButtonWithIcon(
                    onTapFunction: () {


                      /*Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PinextUsersScreen(currentUserId: currentUserId),
                        ),
                      );*/
                    },
                    label: "Life Checker",
                    icon: FontAwesomeIcons.addressBook,
                    iconSize: 14,
                  ),

                  */
                  //Old UI Life Checker button ends here
                  /*


                  Text(
                    "Savings",
                    style: boldTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),




                  */




              /*
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "You've saved",
                          style: regularTextStyle.copyWith(
                            color: customBlackColor.withOpacity(.6),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            if (state is AuthenticatedUserState) {
                              return Text(
                                "${state.monthlySavings} ₦",
                                style: boldTextStyle.copyWith(
                                  fontSize: 20,
                                ),
                              );
                            }
                            return Text(
                              "Loading...",
                              style: boldTextStyle.copyWith(
                                fontSize: 20,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "in ${months[int.parse(currentMonth) - 1]}.",
                          style: regularTextStyle.copyWith(
                            color: customBlackColor.withOpacity(.6),
                          ),
                        ),
                      ],
                    ),
                  ),





                  */





                  /*
                  const SizedBox(
                    height: 12,
                  ),


                   */


                  /*
                  Text(
                    "Expenses",
                    style: boldTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),

                  */





              /*
                  const SizedBox(
                    height: 8,
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is AuthenticatedUserState) {
                        return Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.all(
                                  defaultPadding,
                                ),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    defaultBorder,
                                  ),
                                  color: customBlackColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        "- ${state.dailyExpenses}",
                                        style: boldTextStyle.copyWith(
                                          fontSize: 25,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Today",
                                      style: boldTextStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: whiteColor.withOpacity(.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.all(
                                  defaultPadding,
                                ),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    defaultBorder,
                                  ),
                                  color: customBlueColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        "- ${state.weeklyExpenses}",
                                        style: boldTextStyle.copyWith(
                                          fontSize: 25,
                                          color: whiteColor.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "This week",
                                      style: boldTextStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),

*/




                  const SizedBox(
                    height: 12,
                  ),
                  const PastTransactionsModule(),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [



                          /*
                          Text(
                            "Goals & milestones",
                            style: boldTextStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),




                           */




                      /*
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CustomTransitionPageRoute(
                                  childWidget:
                                      const ViewGoalsAndMilestoneScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "View all",
                              style: regularTextStyle.copyWith(
                                fontSize: 14,
                                color: customBlackColor.withOpacity(.6),
                              ),
                            ),
                          ),




                          */
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),



                      /*
                      StreamBuilder(
                        stream: FirebaseServices()
                            .firebaseFirestore
                            .collection('pinext_users')
                            .doc(FirebaseServices().getUserId())
                            .collection('pinext_goals')
                            .snapshots(),
                        builder: ((context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: SizedBox.shrink(),
                            );
                          }
                          if (snapshot.data!.docs.isEmpty) {
                            return Text(
                              "404 - No record found!",
                              style: regularTextStyle.copyWith(
                                color: customBlackColor.withOpacity(.4),
                              ),
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                itemCount: snapshot.data!.docs.length > 5
                                    ? 5
                                    : snapshot.data!.docs.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  if (snapshot.data!.docs.isEmpty) {
                                    return const Text("No data found! :(");
                                  }
                                  if (snapshot.data!.docs.isEmpty) {
                                    return Text(
                                      "No data found! :(",
                                      style: regularTextStyle.copyWith(
                                        color: customBlackColor.withOpacity(.4),
                                      ),
                                    );
                                  }

                                  PinextGoalModel pinextGoalModel =
                                      PinextGoalModel.fromMap(
                                    snapshot.data!.docs[index].data(),
                                  );
                                  return BlocBuilder<UserBloc, UserState>(
                                    builder: (context, state) {
                                      double completionAmount = 0;
                                      if (state is AuthenticatedUserState) {
                                        completionAmount = ((double.parse(
                                                    state.netBalance) /
                                                double.parse(
                                                    pinextGoalModel.amount)) *
                                            100);
                                      }
                                      return completionAmount < 100
                                          ? PinextGoalCardMinimized(
                                              pinextGoalModel: pinextGoalModel,
                                              index: index,
                                              showCompletePercentage: true,
                                            )
                                          : const SizedBox.shrink();
                                    },
                                  );
                                }),
                              )
                            ],
                          );
                        }),
                      ),




                      */
                    ],
                  )
                ],
              ),
            ),
            const YourCardsModule(),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class PastTransactionsModule extends StatelessWidget {
  const PastTransactionsModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recently added portfolio items",
          style: boldTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        StreamBuilder(
          stream: FirebaseServices()
              .firebaseFirestore
              .collection('pinext_users')
              .doc(FirebaseServices().getUserId())
              .collection('pinext_transactions')
              .doc(currentYear)
              .collection(currentMonth)
              .orderBy(
                "transactionDate",
                descending: true,
              )
              .snapshots(),
          builder: ((context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox.shrink(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Text(
                "404 - No record found!",
                style: regularTextStyle.copyWith(
                  color: customBlackColor.withOpacity(.4),
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length > 10
                        ? 10
                        : snapshot.data!.docs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No data found! :(");
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return Text(
                          "No data found! :(",
                          style: regularTextStyle.copyWith(
                            color: customBlackColor.withOpacity(.4),
                          ),
                        );
                      }

                      PinextTransactionModel pinextTransactionModel =
                          PinextTransactionModel.fromMap(
                        snapshot.data!.docs[index].data(),
                      );
                      return TransactionDetailsCard(
                          pinextTransactionModel: pinextTransactionModel);
                    }),
                  ),
                )
              ],
            );
          }),
        ),
      ],
    );
  }
}

class YourCardsModule extends StatelessWidget {
  const YourCardsModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          child: Column(
            children: const [
              SizedBox(
                height: 8,
              ),

              /*
              Text(
                "Your Cards",
                style: boldTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),


              */
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              SizedBox(
                width: defaultPadding,
              ),



              /*
              StreamBuilder(
                stream: FirebaseServices()
                    .firebaseFirestore
                    .collection("pinext_users")
                    .doc(FirebaseServices().getUserId())
                    .collection("pinext_cards")
                    .orderBy(
                      'lastTransactionData',
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
                    return Text(
                      "Please add a Pinext card to view your cards details here.",
                      style: regularTextStyle.copyWith(
                        color: customBlackColor.withOpacity(.4),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 185,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        PinextCardModel pinextCardModel =
                            PinextCardModel.fromMap(
                          snapshot.data!.docs[index].data(),
                        );

                        String color = pinextCardModel.color;
                        late Color cardColor = getColorFromString(color);

                        return PinextCard(
                          title: pinextCardModel.title,
                          balance: pinextCardModel.balance,
                          cardColor: cardColor,
                          lastTransactionDate:
                              pinextCardModel.lastTransactionData,
                          cardDetails: pinextCardModel.description,
                        );
                      }),
                    ),
                  );
                }),
              ),


              */
              SizedBox(
                width: defaultPadding - 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuFilterPill extends StatelessWidget {
  MenuFilterPill({
    Key? key,
    required this.filtertitle,
    required this.selectedFilter,
  }) : super(key: key);

  String filtertitle;
  String selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          if (filtertitle != "Overview") {
            GetCustomSnackbar(
              title: "Snap",
              message:
                  "The section is still under development.\nAnd will be updated at a later date!",
              snackbarType: SnackbarType.info,
              context: context,
            );
          } else {
            context.read<HomepageCubit>().changeMenuFilter(
                  filtertitle,
                );
          }
        },
        child: Container(
          height: 35,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            // vertical: 10,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectedFilter == filtertitle ? customBlueColor : greyColor,
            borderRadius: BorderRadius.circular(
              defaultBorder,
            ),
          ),
          child: Text(
            filtertitle,
            style: boldTextStyle.copyWith(
              color: selectedFilter == filtertitle
                  ? whiteColor
                  : customBlackColor.withOpacity(.4),
            ),
          ),
        ),
      ),
    );
  }
}
