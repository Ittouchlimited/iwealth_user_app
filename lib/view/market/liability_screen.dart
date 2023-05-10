// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/view/auth/add_liability_screen.dart';
import 'package:pinext/view/market/buy_bottomsheet.dart';
import 'package:pinext/view/market/share_assets_sheet.dart';
import 'package:pinext/view/market/share_liabilities_sheet.dart';
import 'package:pinext/view/market/share_sheet.dart';
import 'package:pinext/view/market/transaction_view.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LiabilityScreen extends StatefulWidget {
  const LiabilityScreen({super.key});

  @override
  State<LiabilityScreen> createState() => _LiabilityScreenState();
}

class _LiabilityScreenState extends State<LiabilityScreen> {
  final homeController = Get.put(HomeController());
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Liabilities",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                ),



                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState!.showBottomSheet(
                          backgroundColor: Colors.transparent,
                              (context) => const ShareAssetsSheet(),
                        );
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          DefaultImages.m21,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                    ),
                  ],
                ),






                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState!.showBottomSheet(
                          backgroundColor: Colors.transparent,
                              (context) => const AddLiabilityScreen(),
                        );
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          DefaultImages.m21,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                    ),

                  ],
                ),








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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Text(
                        "Liabilities worth",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                            ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "40,168.5",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                          Text(
                            "Liabilities",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor(AppTheme.redColorString!),
                                ),
                          ),
                        ],
                      ),
                    ),





                  /*
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 32,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.2),
                          ),
                          color: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.lightGrayString!)
                              : HexColor(AppTheme.darkGrayString!),
                        ),
                        child: Obx(
                          () => Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    homeController.isBit.value = 0;
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: homeController.isBit.value == 0
                                          ? HexColor(
                                              AppTheme.primaryColorString!)
                                          : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Price",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  homeController.isBit.value ==
                                                          0
                                                      ? Colors.white
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .color,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    homeController.isBit.value = 1;
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: homeController.isBit.value == 1
                                          ? HexColor(
                                              AppTheme.primaryColorString!)
                                          : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Depth",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  homeController.isBit.value ==
                                                          1
                                                      ? Colors.white
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .color,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    homeController.isBit.value = 2;
                                  },
                                  child: Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: homeController.isBit.value == 2
                                          ? HexColor(
                                              AppTheme.primaryColorString!)
                                          : Colors.transparent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Info",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  homeController.isBit.value ==
                                                          2
                                                      ? Colors.white
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .color,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),





                    */
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
