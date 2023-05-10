// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/email_screen.dart';
import 'package:pinext/view/auth/number_screen.dart';
import 'package:pinext/view/auth/select_screen.dart';
import 'package:pinext/view/auth/user_profile_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}


class _UserScreenState extends State<UserScreen> {
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
                        "User profile",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            "User ID: 39110923 ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color:
                              HexColor(AppTheme.secondaryColorString!),
                            ),
                          ),

                          /*
                          Text(
                            "Click here to copy",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.primaryColorString!),
                            ),
                          ),
                          */



                        ],
                      ),

                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Text(
                            "Username: janedoe ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color:
                              HexColor(AppTheme.secondaryColorString!),
                            ),
                          ),


                        ],
                      ),




                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            const UserProfileScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: HexColor(AppTheme.secondaryColorString!),
                              ),
                            ),
                            Text(
                              "Edit",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: HexColor(AppTheme.primaryColorString!),
                              ),
                            ),
                          ],
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
