// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareSheet extends StatefulWidget {
  const ShareSheet({super.key});

  @override
  State<ShareSheet> createState() => _ShareSheetState();
}

class _ShareSheetState extends State<ShareSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.15,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppTheme.isLightTheme == true
            ? Colors.white
            : const Color(0xff1C222E),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Share your entire portfolio",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(DefaultImages.m1),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Text(
                                      "iWealth",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  "BTC",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: HexColor(
                                            AppTheme.secondaryColorString!),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  "\$40,168.53",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color:
                                        HexColor(AppTheme.primaryColorString!),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          child: Text(
                                            "17 MAR 2022 23:20 UTC (1D)",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 14, right: 14),
                                            child: Image.asset(
                                              DefaultImages.m34,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          child: Text(
                                            "+980.67 (2.16%)",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          column(DefaultImages.m16, "Messages"),
                          column(DefaultImages.m13, "Story"),
                          column(DefaultImages.m25, "Twitter"),
                          column(DefaultImages.m6, "Copy"),
                          column(DefaultImages.m7, "More"),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget column(String image, String text) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: HexColor(AppTheme.secondaryColorString!),
              ),
        ),
      ],
    );
  }
}
