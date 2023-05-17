// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/profile_completeness_screen.dart';
import 'package:pinext/view/auth/signup_screen.dart';
import 'package:pinext/view/home/add_asset_card.dart';
import 'package:pinext/view/home/home_view.dart';
import 'package:pinext/view/tab_screen.dart';
import 'package:pinext/widget/add_liability_loans_view.dart';
import 'package:pinext/widget/add_liability_others_view.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinext/widget/empty_button_liability_loans.dart';
import 'package:pinext/widget/empty_button_liability_others.dart';
import 'package:pinext/widget/empty_buttons.dart';

import '../../widget/about_iwealth_view.dart';

final List<String> assetCategories = [
  'Bank and Cash Equivalent',
  'Investments',
  'Properties',
  'Land and buildings',
  'Digital Assets',
  'Others',
];

class AddLiabilityScreen extends StatefulWidget {
  const AddLiabilityScreen({super.key});

  @override
  State<AddLiabilityScreen> createState() => _AddLiabilityScreenState();
}

class _AddLiabilityScreenState extends State<AddLiabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),

        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top + 20),
                      const BackIcon(),
                      Container(
                        height: 10,
                        width: 240,
                        decoration: const BoxDecoration(

                        ),
                      ),
                      const SizedBox(height: 20),



                      //Quick links area
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Please select",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 0, right: 0, top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 1; i++)
                            //for (var i = 0; i < 2; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: AddLiabilityLoansView(
                                  image: i == 0
                                      ? DefaultImages.loans_liability
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Loans" : "Your SD Box",
                                  text2: i == 0 ? "Liability" : "Continue",
                                  text3: i == 0 ? "" : "",
                                  text4: i == 0 ? "" : "",
                                ),
                              ),
                          ],
                        ),
                      ),


                      Padding(
                        padding:
                        const EdgeInsets.only(left: 0, right: 0, top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 1; i++)
                            //for (var i = 0; i < 2; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: AddLiabilityOthersView(
                                  image: i == 0
                                      ? DefaultImages.others_liability
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Others" : "Your SD Box",
                                  text2: i == 0 ? "Liability" : "Continue",
                                  text3: i == 0 ? "" : "",
                                  text4: i == 0 ? "" : "",
                                ),
                              ),
                          ],
                        ),
                      ),





                      //SizedBox(height: MediaQuery.of(context).padding.left + 20),
                      Center(
                      child:
                      Container(


                      ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  const HomeView(),
                  transition: Transition.rightToLeft,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [









                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
