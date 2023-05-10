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

import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/app_constants/domentions.dart';
import 'package:pinext/app/app_data/custom_transition_page_route/custom_transition_page_route.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/bloc/homeframe_cubit/homeframe_page_cubit.dart';
import 'package:pinext/app/bloc/homepage_cubit/homepage_cubit.dart';
import 'package:pinext/app/bloc/userBloc/user_bloc.dart';
import 'package:pinext/app/models/pinext_transaction_model.dart';
import 'package:pinext/app/services/date_time_services.dart';
import 'package:pinext/app/shared/widgets/pinext_card.dart';
import 'package:pinext/app/shared/widgets/transaction_details_card.dart';
import 'package:pinext/app/screens/add_and_view_transaction/add_and_view_transaction_again.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:pinext/app/services/carousel.dart';

import 'package:pinext/services/carousel.dart';

class HomeView extends StatefulWidget {
  //const HomeView({super.key});
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 15),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

/*

              GestureDetector(
                onTap: () {
                  Get.dialog(
                    const ScanScreen(),
                  );
                },
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    DefaultImages.h24,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),



              */
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Get.dialog(
                    const NotificationsScreen(),
                  );
                },
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    AppTheme.isLightTheme == true
                        ? DefaultImages.h5
                        : DefaultImages.m8,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Padding(

                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child:

                    Text(
                      //getGreetings(),
                      //style: regularTextStyle.copyWith(
                        //color: customBlackColor.withOpacity(.6),
                      "Hello, Username 👋",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                    ),
                    ),

                  ),


                  Padding(

                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child:
                    Text(
                      "Overview",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: CardView(),
                  ),
                  const SizedBox(height: 25),

                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    //child: Carousel(),
                  ),

                  //SPACE BETWEEN THE TOTAL WORTH AREA AND QUICK LINKS

                  //const SizedBox(height: 200),















/*
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 5,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Container(
                            height: 140,
                            width: 132,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppTheme.isLightTheme == true
                                  ? HexColor(AppTheme.lightGrayString!)
                                  : HexColor(AppTheme.darkGrayString!),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Image.asset(
                                          index == 0
                                              ? DefaultImages.h20
                                              : index == 1
                                                  ? DefaultImages.h25
                                                  : DefaultImages.h22,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width: 50.45,
                                        child: Image.asset(
                                          DefaultImages.h30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            index == 0
                                                ? "FLOW"
                                                : index == 1
                                                    ? "SAND"
                                                    : "LUNA",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          Text(
                                            "/USD",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: HexColor(AppTheme
                                                      .secondaryColorString!),
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        index == 0
                                            ? "\$5.89"
                                            : index == 1
                                                ? "\$3.31"
                                                : "\$101.31",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor(AppTheme
                                                  .secondaryColorString!),
                                            ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    index == 0
                                        ? "-17.3%"
                                        : index == 1
                                            ? "-5.14%"
                                            : "-2.12%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: HexColor(
                                              AppTheme.redColorString!),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
*/




                  //const SizedBox(height: 30),






                  //Signals Area
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const StocklistViewScreen(),
                        //transition: Transition.rightToLeft,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            //"Cards/Accounts",
                            "Signals",
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "View all",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:
                              HexColor(AppTheme.secondaryColorString!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  const SizedBox(height: 40),

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
                              text1: i == 0 ? "About iWealth" : "Your SD Box",
                              text2: i == 0 ? "Read more" : "Continue",
                              text3: i == 0 ? ">" : ">",
                              text4: i == 0 ? "" : "",
                            ),
                          ),
                      ],
                    ),
                  ),













                  const SizedBox(height: 1),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20),
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
                              text1: i == 0 ? "Life Checker" : "",
                              text2: i == 0 ? "Read more" : "Continue",
                              text3: i == 0 ? ">" : ">",
                              text4: i == 0 ? "" : "",
                            ),
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const AboutScreen(),
                        //transition: Transition.rightToLeft,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [


                        ],
                      ),
                    ),
                  ),


                  //Signals Area
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const StocklistViewScreen(),
                        //transition: Transition.rightToLeft,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            //"Cards/Accounts",
                            "Recently Added Portfolio Items",
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                        ],
                      ),

                    ),
                  ),
                  const SizedBox(height: 10),

   /*




                  const SizedBox(height: 1),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < 1; i++)
                        //for (var i = 0; i < 2; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: CoinView(
                              image: i == 0
                                  ? DefaultImages.h14b
                                  : DefaultImages.h19b,
                              text1: i == 0 ? "About iWealth" : "Your SD Box",
                              text2: i == 0 ? "Read more" : "Continue",
                              text3: i == 0 ? ">" : ">",
                              text4: i == 0 ? "" : "",
                            ),
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const AboutScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [





                        ],
                      ),
                    ),
                  ),

*/


/*

                  //const SizedBox(height: 25),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < 1; i++)
                        //for (var i = 0; i < 2; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: CoinView(
                              image: i == 0
                                  ? DefaultImages.h14b
                                  : DefaultImages.h19b,
                              text1: i == 0 ? "About iWealth" : "Your SD Box",
                              text2: i == 0 ? "Read more" : "Continue",
                              text3: i == 0 ? ">" : ">",
                              text4: i == 0 ? "" : "",
                            ),
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const AboutScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [


                        ],
                      ),
                    ),
                  ),





                  */






                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
