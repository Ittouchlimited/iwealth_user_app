// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/account_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
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
            const SizedBox(height: 30),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      DefaultImages.emailImage,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Verify your email",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "We sent a verification email to . Please tap\nthe link inside that email to continue.",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: HexColor(AppTheme.secondaryColorString!),
                      height: 1.6,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Expanded(child: SizedBox()),
            CustomButton(
              text: "Check my inbox",
              onTap: () {
                Get.to(
                  const AccountScreen(
                    isAuth: false,
                  ),
                  transition: Transition.rightToLeft,
                );
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: "Resend email",
              onTap: () {},
              bg: Colors.transparent,
              borderColor: HexColor(AppTheme.secondaryColorString!),
              textColor: HexColor(AppTheme.secondaryColorString!),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
