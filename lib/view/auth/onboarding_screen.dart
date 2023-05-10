// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/auth_controller.dart';
import 'package:pinext/view/auth/login_screen.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(
                          const LoginScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Text(
                        "SKIP",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: HexColor(AppTheme.secondaryColorString!),
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: Get.height / 6),
            Obx(
              () => Container(
                height: Get.height / 2.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      authController.flag.value == 1
                          ? DefaultImages.o1
                          : DefaultImages.o2,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Obx(
              () => Text(
                authController.flag.value == 1
                    ? "Track everything\n you own on the go."
                    : "Be ready for\nall emergencies.",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(
                authController.flag.value == 1
                    ? ""
                    : "",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor(AppTheme.secondaryColorString!),
                      height: 1.6,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Expanded(child: SizedBox()),
            CustomButton(
              text: "Get Started",
              onTap: () {
                authController.flag.value = authController.flag.value + 1;
                if (authController.flag.value == 3) {
                  Get.off(
                    const LoginScreen(),
                    transition: Transition.rightToLeft,
                  );
                }
              },
            ),
            const SizedBox(height: 30),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor(AppTheme.secondaryColorString!)
                          .withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 4),
                  authController.flag.value == 1
                      ? Container(
                          height: 6,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                        )
                      : Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.5),
                          ),
                        ),
                  const SizedBox(width: 4),
                  authController.flag.value == 2 ||
                          authController.flag.value == 3
                      ? Container(
                          height: 6,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                        )
                      : Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.5),
                          ),
                        ),
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
