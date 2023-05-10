// ignore_for_file: deprecated_member_use

import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/account_screen.dart';
import 'package:pinext/view/auth/select_screen.dart';
import 'package:pinext/view/auth/verification_screen.dart';
import 'package:pinext/view/auth/verified_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
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
                      const SizedBox(height: 30),
                      Text(
                        "Create App Password",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,

                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Enter a 4-digit code\nto protect your iWealth App",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                      /*const SizedBox(height: 20),
                      const CustomTextField(
                        hintText: "Code",
                        prefix: null,
                        sufix: SizedBox(),
                        //textEditingController:
                          //  TextEditingController(text: "982806"),
                       // inputType: TextInputType.number,
                        //isObsecure: false,
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              text: "Continue",
              onTap: () {
                Get.to(
                  //const VerifiedScreen(
                  const AccountScreen(
                  //const VerificationScreen(
                    isAuth: true,
                  ),
                  transition: Transition.rightToLeft,
                );
              },
            ),
           /* const SizedBox(height: 15),
            CustomButton(
              text: "Resend code",
              onTap: () {},
              bg: Colors.transparent,
              borderColor: HexColor(AppTheme.secondaryColorString!),
              textColor: HexColor(AppTheme.secondaryColorString!),
            ),*/
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
