// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/profile_completeness_screen.dart';
import 'package:pinext/view/auth/signup_screen.dart';
import 'package:pinext/view/home/add_asset_card.dart';
import 'package:pinext/view/home/home_view.dart';
import 'package:pinext/view/tab_screen.dart';
import 'package:pinext/widget/add_asset_bank_and_cash_view.dart';
import 'package:pinext/widget/add_asset_custom_asset_view.dart';
import 'package:pinext/widget/add_asset_digital_assets_view.dart';
import 'package:pinext/widget/add_asset_real_estate_view.dart';
import 'package:pinext/widget/add_asset_stocks_view.dart';
import 'package:pinext/widget/add_asset_vehicle_view.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({super.key});

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
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
                                child: AddAssetBankAndCashView(
                                  image: i == 0
                                      ? DefaultImages.bank_assets
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Bank & Cash" : "Your SD Box",
                                  text2: i == 0 ? "Asset" : "Continue",
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
                                child: AddAssetStocksView(
                                  image: i == 0
                                      ? DefaultImages.stocks_assets
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Stocks" : "Your SD Box",
                                  text2: i == 0 ? "Asset" : "Continue",
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
                                child: AddAssetVehicleView(
                                  image: i == 0
                                      ? DefaultImages.vehicle_assets
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Vehicle" : "Your SD Box",
                                  text2: i == 0 ? "Asset" : "Continue",
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
                                child: AddAssetDigitalAssetsView(
                                  image: i == 0
                                      ? DefaultImages.digital_assets
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Digital Assets" : "Your SD Box",
                                  text2: i == 0 ? "Asset" : "Continue",
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
                                child: AddAssetRealEstateView(
                                  image: i == 0
                                      ? DefaultImages.real_estate_assets
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Real Estate" : "Your SD Box",
                                  text2: i == 0 ? "Asset" : "Continue",
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
                                child: AddAssetCustomAssetView(
                                  image: i == 0
                                      ? DefaultImages.custom_assets
                                      : DefaultImages.h19b,
                                  text1: i == 0 ? "Custom Asset" : "Your SD Box",
                                  text2: i == 0 ? "Asset" : "Continue",
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
