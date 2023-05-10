// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/profile_completeness_screen.dart';
import 'package:pinext/view/auth/signup_screen.dart';
import 'package:pinext/view/home/add_asset_card.dart';
import 'package:pinext/view/home/home_view.dart';
import 'package:pinext/view/tab_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
                        height: 80,
                        width: 240,
                        decoration: const BoxDecoration(

                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Add Asset",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Input the details",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                            ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        hintText: "Value",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.email,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.emailAddress,
                        isObsecure: false,
                      ),




                      const SizedBox(height: 40),
                      CustomTextField(
                        hintText: "Description",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.email,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.emailAddress,
                        isObsecure: false,
                      ),



                      /*
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: AddAssetCardView(),
                      ),
                      const SizedBox(height: 25),


*/


/*
                      const SizedBox(height: 30),
                      DropdownButtonFormField2(
                        decoration: const InputDecoration(
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: false,
                          contentPadding: EdgeInsets.zero,
                          /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),*/
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Asset type',
                          style: TextStyle(fontSize: 14),
                        ),
                        items: assetCategories
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Asset type';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 60,
                          padding: EdgeInsets.only(left: 20, right: 10),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      */



                      const SizedBox(height: 20),
                      Text(
                        "Suggestions (Bank and Cash Equivalent, Investments, Properties, Land and buildings, Digital Assets, Others)",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 5),
                      Text(
                        "FBN Holdings || Dangote Stock || NFTs ",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),




                      const SizedBox(height: 30),
                      CustomButton(
                        text: "Add Asset",
                        onTap: () {
                          Get.offAll(
                            const TabScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      const Center(

                      ),

                      const SizedBox(height: 30),
                      const Center(

                      ),
                      const SizedBox(height: 30),
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
