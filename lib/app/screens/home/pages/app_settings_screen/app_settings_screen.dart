import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/app_constants/fonts.dart';
import 'package:pinext/app/screens/goals_and_milestones/view_goals_and_milestones_screen.dart';
import 'package:pinext/app/screens/silver/silver_screen.dart';
import 'package:pinext/app/services/handlers/app_handler.dart';

import '../../../../app_data/appVersion.dart';
import '../../../../app_data/app_constants/domentions.dart';
import '../../../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../../../app_data/theme_data/colors.dart';
import '../../../../services/handlers/user_handler.dart';
import '../../../contact/em_contact.dart';
import '../../../files/user_files.dart';
import '../../../notifications/notificaiton_screen.dart';
import '../../../platinum/platinum_screen.dart';
import '../../../profile/profile_screen.dart';
import '../../../settings/settings.dart';
import '../../../subscriptions/plan_subs.dart';

class AppSettingsScreen extends StatelessWidget {
  final String currentUserId;

  AppSettingsScreen({required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      height: height,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            // const SizedBox(
            //   height: 8,
            // ),
            // GetSettingsButtonWithIcon(
            //   onTapFunction: () {
            //     GetCustomSnackbar(
            //       title: "Snap",
            //       message:
            //           "The section is still under development.\nAnd will be updated at a later date!",
            //       snackbarType: SnackbarType.info,
            //       context: context,
            //     );
            //   },
            //   label: "${UserHandler().currentUser.username} - User settings",
            //   icon: Icons.person,
            //   iconSize: 18,
            // ),




            /*
            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                Navigator.push(
                  context,
                  CustomTransitionPageRoute(
                    childWidget: const ViewGoalsAndMilestoneScreen(),
                  ),
                );
              },
              label: "Goals & Milestones",
              icon: Icons.stop,
              iconSize: 18,
            ),


            */


            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        PinextUsersScreen(currentUserId: currentUserId),
                  ),
                );
              },
              label: "Profile",
              icon: FontAwesomeIcons.addressBook,
              iconSize: 14,
            ),
            const SizedBox(
              height: 8,
            ),



            GetSettingsButtonWithIcon(
              onTapFunction: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmContact(),
                  ),
                );
              },
              label: "Beneficiary",
              //label: "Emergency Contact",
              icon: FontAwesomeIcons.addressBook,
              iconSize: 14,
            ),
            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserFilesScreen(),
                  ),
                );
              },
              label: "Safety Deposit Box",
              //label: "User Files",
              icon: FontAwesomeIcons.fileCircleCheck,
              iconSize: 14,
            ),
            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SilverScreen(),
                  ),
                );
              },
              label: "Silver",
              icon: FontAwesomeIcons.paypal,
              iconSize: 14,
            ),
            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlatinumScreen(),
                  ),
                );
              },
              label: "Platinum",
              icon: FontAwesomeIcons.moneyBillTrendUp,
              iconSize: 14,
            ),

            // const SizedBox(
            //   height: 8,
            // ),
            // GetSettingsButtonWithIcon(
            //   onTapFunction: () {
            //     GetCustomSnackbar(
            //       title: "Snap",
            //       message:
            //           "The section is still under development.\nAnd will be updated at a later date!",
            //       snackbarType: SnackbarType.info,
            //       context: context,
            //     );
            //   },
            //   label: "App settings",
            //   icon: Icons.settings,
            //   iconSize: 18,
            // ),
            const SizedBox(
              height: 8,
            ),









            const SizedBox(
              height: 8,
            ),



          /*


            const SizedBox(
              height: 8,
            ),
            GetSettingsButtonWithIcon(
              onTapFunction: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(
                     
                    ),
                  ),
                );
              },
              label: "Settings",
              icon: Iconsax.setting,
              iconSize: 14,
            ),



            */


            // const SizedBox(
            //   height: 8,
            // ),
            // GetSettingsButtonWithIcon(
            //   onTapFunction: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => PlanScreen(),
            //       ),
            //     );
            //   },
            //   label: "Subscriptions",
            //   icon: FontAwesomeIcons.moneyBill,
            //   iconSize: 16,
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            // GetSettingsButtonWithIcon(
            //   onTapFunction: () {
            //     AppHandler().requestNewFuture(context);
            //   },
            //   label: "Request new future!",
            //   icon: FontAwesomeIcons.fire,
            //   iconSize: 16,
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            // GetSettingsButtonWithIcon(
            //   onTapFunction: () {
            //     AppHandler().writeReview(context);
            //   },
            //   label: "Post review",
            //   icon: Icons.edit,
            //   iconSize: 18,
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            // GetSettingsButtonWithIcon(
            //   onTapFunction: () {
            //     AppHandler().checkForUpdate(context);
            //   },
            //   label: "Check for updates",
            //   icon: Icons.update,
            //   iconSize: 18,
            // ),
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
            const Center(

              /*
              child: Text(
                " by YG Studio.",
                style: cursiveTextStyle.copyWith(
                  // height: .95,
                  fontSize: 16,
                  color: customBlackColor.withOpacity(.2),
                ),
              ),


              */
            )
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
