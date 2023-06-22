// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/market/about_screen.dart';
import 'package:pinext/view/market/bitcoin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/screens/contact/em_contact.dart';
import '../app/screens/home/pages/asset_portfolio_page.dart';

class BeneficiaryView extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  final String? graphImage;
  const BeneficiaryView(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2,
      this.graphImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EmContact()),
        );
      },
      child: Container(
        height: 80,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppTheme.isLightTheme == true
              ? HexColor(AppTheme.lightGrayString!)
              : HexColor(AppTheme.darkGrayString!),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              SizedBox(
                height: 48,
                width: 48,
                child: Image.asset(
                  image,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      text2,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
