import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/app_constants/fonts.dart';
import 'package:pinext/app/screens/goals_and_milestones/view_goals_and_milestones_screen.dart';
import 'package:pinext/app/screens/silver/silver_screen.dart';
import 'package:pinext/app/services/handlers/app_handler.dart';

import '../../app_data/appVersion.dart';
import '../../app_data/app_constants/domentions.dart';
import '../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../app_data/theme_data/colors.dart';
import '../../services/handlers/user_handler.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hello,\n",
                    style: regularTextStyle.copyWith(
                      color: customBlackColor.withOpacity(.6),
                    ),
                  ),
                  TextSpan(
                    text: "${UserHandler().currentUser.username} 👋",
                    style: cursiveTextStyle.copyWith(
                      // height: .95,
                      fontSize: 30,
                      color: customBlackColor.withOpacity(.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                AppHandler().requestNewFuture(context);
              },
              label: "Request new future!",
              icon: FontAwesomeIcons.fire,
              iconSize: 16,
            ),
            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                AppHandler().writeReview(context);
              },
              label: "Post review",
              icon: Icons.edit,
              iconSize: 18,
            ),
            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                AppHandler().checkForUpdate(context);
              },
              label: "Check for updates",
              icon: Icons.update,
              iconSize: 18,
            ),
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 3,
              ),
              child: Center(
                child: Text(
                  "App Version: $appVersion",
                  style: regularTextStyle.copyWith(
                    fontSize: 12,
                    color: customBlackColor.withOpacity(.2),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}

class GetSettingsButtonWithIcon extends StatelessWidget {
  GetSettingsButtonWithIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTapFunction,
    required this.iconSize,
  }) : super(key: key);

  IconData icon;
  String label;
  Function onTapFunction;
  double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        height: 70,
        width: getWidth(context),
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(defaultBorder),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: customBlackColor,
              size: 18,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              label,
              style: regularTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
