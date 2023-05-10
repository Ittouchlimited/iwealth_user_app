// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/email_screen.dart';
import 'package:pinext/view/auth/number_screen.dart';
import 'package:pinext/view/auth/verification_screen.dart';
import 'package:pinext/view/home/card.dart';
import 'package:pinext/view/home/profile_completeness_card.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:pinext/widget/image_picker_widget.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileCompletenessScreen extends StatefulWidget {
  const ProfileCompletenessScreen({super.key});

  @override
  State<ProfileCompletenessScreen> createState() => _ProfileCompletenessScreenState();
}



final List<String> incomerangeItems = [
  '100-1000',
  '2000-5000',
];
final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
List<String> selectedItems = [];

String? selectedValue;

final _formKey = GlobalKey<FormState>();


class _ProfileCompletenessScreenState extends State<ProfileCompletenessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),

        //**1
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            const BackIcon(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Text(
                        "iWealth",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Complete your profile",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                          ),
                          /*Text(
                            "Learn more",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ), */
                        ],
                      ),



                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: ProfileCompletenessCardView(),
                      ),
                      const SizedBox(height: 5),
                      /*CustomTextField(
                        hintText: "First Name",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.user,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),*/

/*
                      const SizedBox(height: 30),

                      CustomTextField(
                        hintText: "Enter Username",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.user,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),



                      const SizedBox(height: 30),


                      CustomTextField(
                        hintText: "Email Address",
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
*/



                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Enter your address",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.user,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),


                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Mobile number",
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: SizedBox(
                            width: 80,
                            child: Row(
                              children: [
                                CountryPickerDropdown(
                                  initialValue: 'NG',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: HexColor(AppTheme.secondaryColorString!),
                                    size: 20,
                                  ),
                                  itemBuilder: (Country country) => Container(
                                    height: 26,
                                    width: 26,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child:
                                      CountryPickerUtils.getDefaultFlagImage(country),
                                    ),
                                  ),
                                  sortComparator: (Country a, Country b) =>
                                      a.isoCode.compareTo(b.isoCode),
                                  onValuePicked: (Country country) {
                                    debugPrint(country.name);
                                  },
                                ),


                                const SizedBox(width: 10),
                                Container(
                                  height: 26,
                                  width: 1.2,
                                  color: HexColor(AppTheme.secondaryColorString!),
                                ),
                              ],
                            ),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.emailAddress,
                        isObsecure: false,
                      ),







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
                          'Your Income Range',
                          style: TextStyle(fontSize: 14),
                        ),
                        items: incomerangeItems
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
                            return 'Your Income Range';
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



                      /*
                      Text(
                        "Verification",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: HexColor(AppTheme.secondaryColorString!),
                          height: 1.6,
                        ),
                      ),
                      */
                      const SizedBox(height: 40),
                      CustomTextField(
                        hintText: "Upload Verification File",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.user,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),

                      const SizedBox(height: 10),
                      Column(
                        children: const [
                          //This is the widget I am talking about
                          ImagePickerWidget()
                        ],
                      ),


                      const SizedBox(height: 10),
                      Text(
                        "Manage Account Asset",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        "Please add an Account Asset to continue with your registration.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),


                      const SizedBox(height: 10),
                      Text(
                        "* You must add a Account Asset to continue.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

/*

                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Password",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.lock,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const Padding(
                          padding: EdgeInsets.all(10.0),
                          //child: SvgPicture.asset(
                            //DefaultImages.eye,
                            //color: HexColor(AppTheme.secondaryColorString!),
                          //),
                        ),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.visiblePassword,
                        isObsecure: true,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Confirm Password",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.lock,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const Padding(
                          padding: EdgeInsets.all(10.0),
                          /*child: SvgPicture.asset(
                            DefaultImages.eye,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),*/
                        ),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.visiblePassword,
                        isObsecure: true,






                      ),



                      */
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          /*
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                              ),
                            ),
                          ),
*/





                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,



                            children: [
                              /*
                              Text(
                                "I certify that I am 18 years of age or older, and I",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor(
                                          AppTheme.secondaryColorString!),
                                    ),
                              ),

                              */
                              const SizedBox(height: 8),


                              Row(

                                children: const [
                                  /*
                                  Text(
                                    "agree to the ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor(
                                              AppTheme.secondaryColorString!),
                                        ),
                                  ),

                                  */

                                  /*
                                  Text(
                                    "User Agreement ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor(
                                              AppTheme.primaryColorString!),
                                        ),
                                  ),

                                   */
                                  /*
                                  Text(
                                    "and",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor(
                                              AppTheme.secondaryColorString!),
                                        ),
                                  ),
                                  */



                                ],
                              ),

                              /*
                              const SizedBox(height: 8),
                              Text(
                                "Privacy Policy",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    ),
                              ),

                              */
                            ],



                          )
                        ],


                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: "Continue",
                        onTap: () {
                          Get.to(
                            const VerificationScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
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
