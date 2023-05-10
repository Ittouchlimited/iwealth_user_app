// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/view/home/card.dart';
import 'package:pinext/view/home/top_move_screen.dart';
import 'package:pinext/view/market/about_screen.dart';
import 'package:pinext/view/market/bitcoin_screen.dart';
import 'package:pinext/view/market/empty_screen.dart';
import 'package:pinext/view/market/share_sheet.dart';
import 'package:pinext/view/profile/scan_screen.dart';
import 'package:pinext/widget/coin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardPortfolioLiabilities extends StatefulWidget {
  const DashboardPortfolioLiabilities({super.key});

  @override
  State<DashboardPortfolioLiabilities> createState() => _DashboardPortfolioLiabilitiesState();
}

class _DashboardPortfolioLiabilitiesState extends State<DashboardPortfolioLiabilities> {
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
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Get.dialog(
                    const EmptyScreen(),
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
                    child: Text(
                      "Liabilities Overview",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: DashboardPortfolioLiabilities(),
                  ),
                  const SizedBox(height: 25),




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

                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 1),
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
                            child: CoinView(
                              image: i == 0
                                  ? DefaultImages.h14b
                                  : DefaultImages.h19b,
                              text1: i == 0 ? "Life Checker" : "Your SD Box",
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









                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
