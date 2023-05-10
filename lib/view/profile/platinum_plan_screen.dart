// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/profile_controller.dart';
import 'package:pinext/main.dart';
import 'package:pinext/view/profile/addons_platinum_screen.dart';
import 'package:pinext/view/profile/portfolio_valuation_platinum_screen.dart';
import 'package:pinext/view/profile/relationship_manager_screen.dart';
import 'package:pinext/view/profile/will_preparation_platinum_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PlatinumPlanScreen extends StatefulWidget {
  const PlatinumPlanScreen({super.key});

  @override
  State<PlatinumPlanScreen> createState() => _PlatinumPlanScreenState();
}

class _PlatinumPlanScreenState extends State<PlatinumPlanScreen> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    int light = 1;
    int dark = 2;
    changeColor(int color) {
      if (color == light) {
        Pinext.setCustomeTheme(context, 6);
      } else {
        Pinext.setCustomeTheme(context, 7);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Platinum Plan",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 24,
                  width: 24,
                ),
              ],
            ),





            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  const SizedBox(height: 50),
                  for (var i = 0; i < 4; i++)
                    GestureDetector(
                      onTap: () {
                        if (i == 0) {
                          Get.to(
                            const PortfolioValuationPlatinumScreen(),
                            transition: Transition.rightToLeft,
                          );
                        } else if (i == 1) {
                          Get.to(
                            const WillPreparationPlatinumScreen(),
                            transition: Transition.rightToLeft,
                          );
                        } else if (i == 2) {
                          Get.to(
                            const RelationshipManagerScreen(),
                            transition: Transition.rightToLeft,
                          );
                        } else if (i == 3) {
                          Get.to(
                            const AddonsPlatinumScreen(),
                            transition: Transition.rightToLeft,
                          );
                        }


                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme == true
                                      ? HexColor(AppTheme.lightGrayString!)
                                      : HexColor(AppTheme.darkGrayString!),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: i == 1
                                      ? SvgPicture.asset(
                                    //Default icon in case other icons aren't availabl.
                                    DefaultImages.p2,
                                    color: const Color(0xff2DD4BF),
                                  )
                                      : SvgPicture.asset(
                                    i == 0
                                        ? DefaultImages.m11
                                        : i == 1
                                        ? DefaultImages.p2
                                        : i == 2
                                        ? DefaultImages.m18
                                        : DefaultImages.p7,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                i == 0
                                    ? "Portfolio Valuation"
                                    : i == 1
                                    ? "Will Preparation"
                                    : i == 2
                                    ? "Relationship Manager"
                                    : "Add Ons",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                size: 12,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Divider(
                            height: 1,
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.2),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                ],
              ),
            )







          ],
        ),
      ),
    );
  }
}
