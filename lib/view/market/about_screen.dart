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

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final homeController = Get.put(HomeController());
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                  "",
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

                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [

                          /*
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  DefaultImages.p1,
                                ),
                              ),
                            ),
                          ),
                          */


                          SizedBox(width: 14),

                          Text(
                            "About iWealth",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),










                        ],
                      ),

                      const SizedBox(height: 20),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.lightGrayString!)
                              : HexColor(AppTheme.darkGrayString!),
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          DefaultImages.h14b
                                        ),
                                      ),
                                    ),
                                  ),





                                  const SizedBox(width: 14),
                                  Text(
                                    "iWealth by Norrenberger",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),







                                ],
                              ),

                              const SizedBox(height: 20),

                              Text(
                                "iWealth by Norrenberger is a wealth management service and product App offered to individuals who are seeking to value, track, monitor, preserve, and transfer their asset information."
                                    "\n\nIt is an all-in-one financial management solution designed to simplify investment management and help individuals articulate all their assets in a wallet and achieve their financial goals. "
                                    "\n\nThe product aims to ensure that the completeness, existence, accuracy, valuation, ownership and presentation of assets are not misstated. "
                                    "\n\nAs a subscriber to iWealth, you control the cardinal point of the product in that the disclosure of the asset to a third party (family members/close relatives) is your decision.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  //color: HexColor(
                                  //    AppTheme.secondaryColorString!),
                                ),
                              ),


                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text("RM Contact feature not available now"),
                                      )
                                      )
                                  );
                                },

                                child: Container(
                                  height: 0,
                                  width: Get.width,
                                  /*
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),

                                  child: Center(
                                    child: Text(
                                      "Send email",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                   */
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),



                      /*
                      const SizedBox(height: 15),
                      Container(
                        height: 256,
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppTheme.isLightTheme == true
                                  ? DefaultImages.p9
                                  : DefaultImages.darklevel,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
*/







                    ],
                  ),







                ],
              ),
            ),

















          ],
        ),
      ),
    );
  }
}
