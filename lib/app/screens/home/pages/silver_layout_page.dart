import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/screens/home/pages/archive_page.dart';

import '../../../app_data/app_constants/constants.dart';
import '../../../app_data/app_constants/domentions.dart';
import '../../../app_data/app_constants/fonts.dart';
import '../../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../../app_data/theme_data/colors.dart';
import '../../../bloc/homeframe_cubit/homeframe_page_cubit.dart';
import '../../../bloc/homepage_cubit/homepage_cubit.dart';
import '../../../bloc/userBloc/user_bloc.dart';
import '../../../models/pinext_goal_model.dart';
import '../../../services/date_time_services.dart';
import '../../../services/firebase_services.dart';
import '../../../shared/widgets/pinext_goal_minimized.dart';
import '../../goals_and_milestones/view_goals_and_milestones_screen.dart';
import 'home_page.dart';

class SilverLayoutPage extends StatefulWidget {
  const SilverLayoutPage({super.key});

  @override
  State<SilverLayoutPage> createState() => _SilverLayoutPageState();
}

class _SilverLayoutPageState extends State<SilverLayoutPage> {
  String getGreetings() {
    int currentHour = DateTime.now().hour;
    if (currentHour > 0 && currentHour <= 5) {
      return "Hello,";
    } else if (currentHour > 5 && currentHour <= 11) {
      return "Good morning,";
    } else if (currentHour > 11 && currentHour <= 18) {
      return "Good afternoon,";
    } else if (currentHour > 18 && currentHour <= 24) {
      return "Good evening,";
    }
    return "Hello";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context),
      width: getWidth(context),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getGreetings(),
                    style: regularTextStyle.copyWith(
                      color: customBlackColor.withOpacity(.6),
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is AuthenticatedUserState) {
                        return Row(
                          children: [
                            Text(
                              state.username,
                              style: cursiveTextStyle.copyWith(
                                fontSize: 30,
                                color: customBlackColor.withOpacity(.8),
                              ),
                            ),
                            Text(
                              " 👋",
                              style: TextStyle(
                                fontSize: 30,
                                color: customBlackColor.withOpacity(.8),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      defaultPadding,
                    ),
                    width: getWidth(context),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(
                        defaultBorder,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Link to All Expense List Layout",
                              style: boldTextStyle.copyWith(
                                fontSize: 21,
                              ),
                            ),
                            Text(
                              "Click to continue",
                              style: boldTextStyle.copyWith(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      defaultPadding,
                    ),
                    width: getWidth(context),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(
                        defaultBorder,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Link to All Expense List Layout",
                              style: boldTextStyle.copyWith(
                                fontSize: 21,
                              ),
                            ),
                            Text(
                              "Click to continue",
                              style: boldTextStyle.copyWith(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArchivePage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(
                        defaultPadding,
                      ),
                      width: getWidth(context),
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(
                          defaultBorder,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Link to Archive Layout",
                                style: boldTextStyle.copyWith(
                                  fontSize: 21,
                                ),
                              ),
                              Text(
                                "Click to continue",
                                style: boldTextStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
