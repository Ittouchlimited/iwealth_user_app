// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/view/market/buy_bottomsheet.dart';
import 'package:pinext/view/market/share_sheet.dart';
import 'package:pinext/view/market/transaction_view.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegularPlanScreen extends StatefulWidget {
  const RegularPlanScreen({super.key});

  @override
  State<RegularPlanScreen> createState() => _RegularPlanScreenState();
}

class _RegularPlanScreenState extends State<RegularPlanScreen> {
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
                  "iWealth Regular Plan",
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
                          (context) => const ShareSheet(),
                        );
                      },
                      child: const SizedBox(
                        height: 24,
                        width: 24,

                        /*
                        child: SvgPicture.asset(
                          DefaultImages.m18,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        */

                      ),
                    ),
                    const SizedBox(width: 20),
                    const SizedBox(
                      height: 24,
                      width: 24,

                      /*
                      child: SvgPicture.asset(
                        DefaultImages.p5,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      */


                    )
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
                        "",
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
                            "",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                          Text(
                            "",
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
                    const SizedBox(height: 20),

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
