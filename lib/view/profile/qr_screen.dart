// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrView extends StatefulWidget {
  const QrView({super.key});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                DefaultImages.p10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Transfer Code",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            "Send and receive USD stablecoins\nor crypto via QR code",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                  height: 1.5,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Send code",
                          onTap: () {},
                        ),
                        const SizedBox(height: 20),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
