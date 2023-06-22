// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/profile/promo_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutLifeCheckerScreen extends StatefulWidget {
  const AboutLifeCheckerScreen({super.key});

  @override
  State<AboutLifeCheckerScreen> createState() => _AboutLifeCheckerScreenState();
}

class _AboutLifeCheckerScreenState extends State<AboutLifeCheckerScreen> {
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
                        children: const [

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
                         /*
                          Text(
                            "Jane Doe",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          */









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
                                          DefaultImages.check,
                                        ),
                                      ),
                                    ),
                                  ),





                                  const SizedBox(width: 14),
                                  Text(
                                    "Life Checker is active!",
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
                                "All about Life Checker goes here.",
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
