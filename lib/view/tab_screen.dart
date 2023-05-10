// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/view/assets/assets_view.dart';
import 'package:pinext/view/assets/portfolio_view.dart';
import 'package:pinext/view/home/dashboard_portfolio.dart';
import 'package:pinext/view/home/dashboard_reports.dart';
import 'package:pinext/view/home/dashboard_subscribe.dart';
import 'package:pinext/view/home/home_view.dart';
import 'package:pinext/view/market/market_view.dart';
import 'package:pinext/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:pinext/widget/floating_fab_view.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      bottomNavigationBar: SizedBox(
        height: 60 + MediaQuery.of(context).padding.top,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //const FloatingFab(),
                tab(
                  homeController.tabFlag.value == 0
                      ? DefaultImages.tab1Select
                      : DefaultImages.tab1,
                  "Home",
                  homeController.tabFlag.value == 0
                      ? HexColor(AppTheme.primaryColorString!)
                      : HexColor(AppTheme.secondaryColorString!),
                  () {
                    homeController.tabFlag.value = 0;
                  },
                ),
                tab(
                  homeController.tabFlag.value == 1
                      ? DefaultImages.tab2Select
                      : DefaultImages.tab2,
                  "Portfolio",
                  homeController.tabFlag.value == 1
                      ? HexColor(AppTheme.primaryColorString!)
                      : HexColor(AppTheme.secondaryColorString!),
                  () {
                    homeController.tabFlag.value = 1;
                  },
                ),
                tab(
                  homeController.tabFlag.value == 2
                      ? DefaultImages.tab3Select
                      : DefaultImages.tab3,
                  "Reports",
                  homeController.tabFlag.value == 2
                      ? HexColor(AppTheme.primaryColorString!)
                      : HexColor(AppTheme.secondaryColorString!),
                  () {
                    homeController.tabFlag.value = 2;
                  },
                ),
                tab(
                  homeController.tabFlag.value == 3
                      ? DefaultImages.tab4Select
                      : DefaultImages.tab4,
                  "Hub",
                  homeController.tabFlag.value == 3
                      ? HexColor(AppTheme.primaryColorString!)
                      : HexColor(AppTheme.secondaryColorString!),
                  () {
                    homeController.tabFlag.value = 3;
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => homeController.tabFlag.value == 0
            ? const HomeView()
            : homeController.tabFlag.value == 1
            //? const AssetsView()
            ? const DashboardPortfolio()
                : homeController.tabFlag.value == 2
                    ? const DashboardReports()
                    : const ProfileView(),
      ),
    );
  }

  Widget tab(String image, String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              image,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
