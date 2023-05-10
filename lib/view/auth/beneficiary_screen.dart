// ignore_for_file: deprecated_member_use

import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/id_type_screen.dart';
import 'package:pinext/view/auth/number_screen.dart';
import 'package:pinext/view/profile/profile_screen.dart';
import 'package:pinext/view/profile/profile_view.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeneficiaryScreen extends StatefulWidget {
  const BeneficiaryScreen({super.key});

  @override
  State<BeneficiaryScreen> createState() => _BeneficiaryScreenState();
}

class _BeneficiaryScreenState extends State<BeneficiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
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
                      const SizedBox(height: 40),
                      Text(
                        "Beneficiary",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Manage Beneficiary details",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Enter Beneficiary Firstname",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Enter Beneficiary Lastname",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),

                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Enter Beneficiary Email",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),

                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Enter Beneficiary Mobile",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),


                      /*
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "City or town",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Postal code",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),

                      */
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),



            const SizedBox(height: 30),
            CustomButton(
              text: "Save",
              onTap: () {
                Get.to(
                  /*
                    Fluttertoast.showToast(
                        msg: "This is a Toast message",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0
                    )
                    */

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Saved!"),
                    )
                    )
                );
              },
            ),


            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
