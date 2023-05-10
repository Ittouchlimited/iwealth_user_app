// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/market/market_view.dart';
import 'package:pinext/view/tab_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifiedScreen extends StatefulWidget {
  const VerifiedScreen({super.key});

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 15),
            const BackIcon(),
            const SizedBox(height: 30),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      DefaultImages.h28,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "You're verified!",
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
                //"Now you update your portfolio\n and enjoy our services at Norrenberger.",
                "Enjoy our services at Norrenberger.",
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
              text: "Start",
              onTap: () {
                Get.offAll(
                  const TabScreen(),
                  //const MarketView(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
