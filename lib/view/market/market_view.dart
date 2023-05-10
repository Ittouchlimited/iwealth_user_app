// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/view/market/bitcoin_screen.dart';
import 'package:pinext/view/profile/scan_screen.dart';
import 'package:pinext/widget/coin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  SizedBox(
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              Text(

                "Reports",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Row(
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

                  SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      AppTheme.isLightTheme == true
                          ? DefaultImages.h5
                          : DefaultImages.m8,
                    ),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 30),


                    /*Container(
                      height: 48,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor(AppTheme.secondaryColorString!)
                              .withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: homeController.searchController.value,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 13, left: 14, right: 14),
                          border: InputBorder.none,
                          prefixIcon: SizedBox(
                            height: 24,
                            width: 24,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                DefaultImages.search,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              homeController.searchController.value.clear();
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  DefaultImages.h3,
                                ),
                              ),
                            ),
                          ),
                          hintText: "Search",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: HexColor(AppTheme.secondaryColorString!),
                              ),
                        ),
                      ),
                    ),*/
              /*
                    const SizedBox(height: 20),
                    Obx(
                      () => homeController
                              .searchController.value.text.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < 2; i++)
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        const BitcoinScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: CoinView(
                                        image: i == 0
                                            ? DefaultImages.h15
                                            : DefaultImages.h19,
                                        text1: i == 0 ? "Bitcoin" : "Ethereum",
                                        text2: i == 0 ? "BTC/USd" : "ETH/USD",
                                        text3: i == 0 ? "40,168.53" : "2744.37",
                                        text4: i == 0 ? "" : "+1.15%",
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < 3; i++)
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        const BitcoinScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: CoinView(
                                        image: i == 0

                                                            ? DefaultImages
                                                               .h25a
                                                            : i == 1
                                                                 ? DefaultImages
                                                                     .h20a
                                                                 : DefaultImages.h20b,

                                        text1: i == 0
                                            ? "Regular"
                                            : i == 1
                                                ? "Silver"
                                                : i == 2
                                                    ? "Platinum"
                                                    : i == 3
                                                        ? "Dogecoin"
                                                        : i == 4
                                                            ? "The Sandbox"
                                                            : "Flow",
                                        text2: i == 0
                                            ? "Subscribe to our Regular Plan"
                                            : i == 1
                                                ? "Subscribe to our Silver Plan"
                                                : i == 2
                                                    ? "Subscribe to our Platinum Plan"
                                                    : i == 3
                                                        ? "DOGE/USD"
                                                        : i == 4
                                                            ? "SAND/USD"
                                                            : "ETH/USD",
                                        text3: i == 0
                                            ? ">"
                                            : i == 1
                                                ? ">"
                                                : i == 2
                                                    ? ">"
                                                    : i == 3
                                                        ? "3.31"
                                                        : i == 4
                                                            ? "5.89"
                                                            : "2744.37",
                                        text4: i == 0
                                            ? ""
                                            : i == 1
                                                ? ""
                                                : i == 2
                                                    ? ""
                                                    : i == 3
                                                        ? "+0.23%"
                                                        : i == 4
                                                            ? "-5.14%"
                                                            : "+1.15%",
                                        /*graphImage: i == 0
                                            ? DefaultImages.h29
                                            : i == 2
                                                ? DefaultImages.h31
                                                : i == 3
                                                    ? DefaultImages.h32
                                                    : DefaultImages.h30,*/
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                    ), */
                    SizedBox(height: 20),
                  ],


                )

              ],

            ),
          )
        ],
      ),
    );
  }
}
