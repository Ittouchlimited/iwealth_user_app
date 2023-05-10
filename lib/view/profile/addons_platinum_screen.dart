// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/profile_controller.dart';
import 'package:pinext/main.dart';
import 'package:pinext/view/profile/norrenberger_services_screen.dart';
import 'package:pinext/view/profile/portfolio_valuation_platinum_screen.dart';
import 'package:pinext/view/profile/relationship_manager_screen.dart';
import 'package:pinext/view/profile/thirdparty_services_screen.dart';
import 'package:pinext/view/profile/will_preparation_platinum_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


final Uri _url = Uri.parse('https://google.com');

class AddonsPlatinumScreen extends StatefulWidget {
  const AddonsPlatinumScreen({super.key});

  @override
  State<AddonsPlatinumScreen> createState() => _AddonsPlatinumScreenState();
}

class _AddonsPlatinumScreenState extends State<AddonsPlatinumScreen> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    int light = 1;
    int dark = 2;
    changeColor(int color) {
      if (color == light) {
        Pinext.setCustomeTheme(context, 6);
      } else {
        Pinext.setCustomeTheme(context, 7);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Platinum Plan Addons",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 24,
                  width: 24,
                ),
              ],
            ),


            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  const SizedBox(height: 50),
                  for (var i = 0; i < 3; i++)
                    GestureDetector(
                      onTap: () {
                        if (i == 0) {
                          Get.to(
                            const NorrenbergerServicesScreen(),
                            transition: Transition.rightToLeft,
                          );
                        } else if (i == 1) {
                          Get.to(
                            _showAlertDialog(),
                          );
                        }
                        if (i == 2) {
                          Get.to(
                            _launchUrl(),
                          );
                        }
                          /*if (i == 1) {
                          Get.bottomSheet(
                            bottomCard(
                              DefaultImages.h6,
                              DefaultImages.h7,
                              "Update Portfolio",
                              "Add Asset",
                              "Add Liability",
                            ),
                          );
                        }*/






                      },





                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.isLightTheme == true
                                      ? HexColor(AppTheme.lightGrayString!)
                                      : HexColor(AppTheme.darkGrayString!),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: i == 1
                                      ? SvgPicture.asset(
                                    DefaultImages.m26,
                                    color: const Color(0xff2DD4BF),
                                  )
                                      : SvgPicture.asset(
                                    i == 0
                                        ? DefaultImages.p2
                                        : i == 1
                                        ? DefaultImages.m26
                                        : i == 2
                                        ? DefaultImages.p4
                                        : DefaultImages.p7,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                i == 0
                                    ? "Norrenberger Services"
                                    : i == 1
                                    ? "3rd Party Services"
                                    : i == 2
                                    ? "Read 3rd Party Terms and Conditions"
                                    : "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                size: 12,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Divider(
                            height: 1,
                            color: HexColor(AppTheme.secondaryColorString!)
                                .withOpacity(0.2),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),

                    ),
                ],
              ),
            )







          ],
        ),
      ),
    );
  }







  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title: const Text('3rd Party Services'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('You must accept our terms and conditions to continue.'),

              ],

            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: _launchUrl,
              child: const Text('Please read our terms and conditions here before you accept.'),
            ),

            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: HexColor(AppTheme.secondaryColorString!)
                  .withOpacity(0.2),
            ),

            TextButton(
              child: const Text('No, I do not accept.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: const Text('Yes, I accept.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
// --- Button Widget --- //

  Future<void> _launchUrl() async {
    /*if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }*/
  }

  Widget bottomCard(
      String image, String image1, String text1, String text2, String text3) {
    return Container(
      height: Get.height / 3.5,
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
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            text1,
            style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    text2,
                    style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: HexColor(AppTheme.secondaryColorString!),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          image1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    text3,
                    style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: HexColor(AppTheme.secondaryColorString!),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}
