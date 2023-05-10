// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/view/profile/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: const Color(0xff000000).withOpacity(0.9),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 15),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          DefaultImages.h12,
                          color: Colors.white,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height / 9),
                Center(
                  child: Text(
                    "SEND",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: Get.height / 3,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        DefaultImages.m32,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    "Scan QR code",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    "Send USD stablecoins or crypto quickly\nand easily",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: HexColor(AppTheme.secondaryColorString!),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      const QrView(),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Choose a QR code from your photos",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            width: Get.width,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Center(
                    child: Container(
                      height: 3,
                      width: 30,
                      color: HexColor(AppTheme.secondaryColorString!),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            DefaultImages.m2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "RECEIVE",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
