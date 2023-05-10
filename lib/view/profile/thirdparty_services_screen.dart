// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/profile/promo_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPartyServicesScreen extends StatefulWidget {
  const ThirdPartyServicesScreen({super.key});

  @override
  State<ThirdPartyServicesScreen> createState() => _ThirdPartyServicesScreenState();
}

class _ThirdPartyServicesScreenState extends State<ThirdPartyServicesScreen> {
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
                  "3rd Party Services",
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

                          const SizedBox(width: 14),
                          Text(
                            "Service 01",
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
                                          DefaultImages.p1,
                                        ),
                                      ),
                                    ),
                                  ),





                                  const SizedBox(width: 14),
                                  Text(
                                    "Request this service",
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
                              Text(
                                "Please click the button below to request this service.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor(
                                      AppTheme.secondaryColorString!),
                                ),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const PromoScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Request Portfolio Valuation Service",
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





                      const SizedBox(height: 15),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your valued portfolio data is\nready for download.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "5fh4008*efw%.pdf",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor(
                                      AppTheme.secondaryColorString!),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const PromoScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Download",
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
                                ),
                              ),

/*
                              Center(
                                child: Container(
                                  height: 32,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Download",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),*/

                            ],
                          ),
                        ),
                      ),












                    ],
                  ),




                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
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

                          const SizedBox(width: 14),
                          Text(
                            "Service 02",
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
                                          DefaultImages.p1,
                                        ),
                                      ),
                                    ),
                                  ),





                                  const SizedBox(width: 14),
                                  Text(
                                    "Request this service",
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
                              Text(
                                "Please click the button below to request this service.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor(
                                      AppTheme.secondaryColorString!),
                                ),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const PromoScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Request Portfolio Valuation Service",
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





                      const SizedBox(height: 15),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your valued portfolio data is\nready for download.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "5fh4008*efw%.pdf",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor(
                                      AppTheme.secondaryColorString!),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    const PromoScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Download",
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
                                ),
                              ),

/*
                              Center(
                                child: Container(
                                  height: 32,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Download",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),*/

                            ],
                          ),
                        ),
                      ),












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
