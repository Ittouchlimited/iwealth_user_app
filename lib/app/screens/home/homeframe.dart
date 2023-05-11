import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinext/app/app_data/app_constants/app_labels.dart';
import 'package:pinext/app/app_data/app_constants/domentions.dart';
import 'package:pinext/app/app_data/routing/routes.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/bloc/userBloc/user_bloc.dart';
import 'package:pinext/app/screens/home/pages/app_settings_screen/app_settings_screen.dart';
import 'package:pinext/app/screens/home/pages/archive_page.dart';
import 'package:pinext/app/screens/home/pages/cards_and_balance_page.dart';
import 'package:pinext/app/screens/home/pages/export_page.dart';
import 'package:pinext/app/screens/home/pages/home_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:pinext/app/screens/home/pages/layout_page.dart';
import 'package:pinext/app/screens/home/pages/portfolio_page.dart';
import 'package:pinext/app/screens/home/pages/silver_layout_page.dart';
import 'package:pinext/app/screens/subscriptions/subscription_plan.dart';
import 'package:pinext/screens/store.dart';
import 'package:pinext/view/market/empty_screen.dart';
import 'package:pinext/view/market/maintenance_screen.dart';
import '../../app_data/app_constants/constants.dart';
import '../../app_data/app_constants/fonts.dart';
import '../../bloc/archive_cubit/user_statistics_cubit/user_statistics_cubit.dart';
import '../../bloc/homeframe_cubit/homeframe_page_cubit.dart';
import '../../services/handlers/app_handler.dart';
import '../notifications/notificaiton_screen.dart';
import '../subscriptions/plan_subs.dart';

class Homeframe extends StatefulWidget {
  const Homeframe({Key? key}) : super(key: key);

  @override
  State<Homeframe> createState() => _HomeframeState();
}

class _HomeframeState extends State<Homeframe> {
  @override
  void initState() {
    super.initState();
    // AppHandler().checkForUpdate(context);
    // showIntroductions();
    //Add introKeys to children widgets
  }

  showIntroductions() async {
    bool isFirstBoot = await AppHandler().checkIfFirstBoot();
    log(isFirstBoot.toString());
    if (isFirstBoot) {
      triggerIntroduction();
    }
  }

  triggerIntroduction() async {
    await Future.delayed(const Duration(seconds: 1)).then((_) {
      Intro.of(context).start();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeframeCubit(),
        ),
        BlocProvider(
          create: (context) => UserStatisticsCubit(),
        )
      ],
      //child: const PlanScreen(),
      child: HomeframeView(),
    );
  }
}

final User? currentUser = FirebaseAuth.instance.currentUser;
final String currentUserId = currentUser?.uid ?? '';

List homeframePages = [
  const Homepage(),
  const PortfolioPage(),
  const ExportPage(),
  //const ArchivePage(),
  AppSettingsScreen(currentUserId: currentUserId,)
  //const MaintenanceScreen(),
/*
  const PortfolioPage(),
  const ExportPage(),
  //const CardsAndBalancePage(),
  AppSettingsScreen(currentUserId: currentUserId,)

  */
  // Center(
  //   child: Text(
  //     "The section is still under development.\nAnd will be updated at a later date!",
  //     style: regularTextStyle.copyWith(color: customBlackColor.withOpacity(.2)),
  //     textAlign: TextAlign.center,
  //   ),
  // ),
];

class HomeframeView extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
  final int _unreadNotificationsCount = 0;

  HomeframeView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeframeCubit, HomeframeState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(
                          userId: FirebaseAuth.instance.currentUser!.uid),
                    ),
                  );
                },
                icon: Stack(
                  children: [
                    const Icon(
                      Iconsax.notification,
                      size: 30,
                      color: customBlackColor,
                    ),
                    if (_unreadNotificationsCount > 0)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: badges.Badge(
                          badgeContent: Text(
                            '$_unreadNotificationsCount',
                            style: const TextStyle(color: Colors.white),
                          ),
                          position: badges.BadgePosition.topEnd(),
                        ),
                      ),
                  ],
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: IntroStepBuilder(
                  order: 6,
                  text: intro_label_six,
                  builder: (context, introkey) {
                    return const Icon(
                      Icons.menu,
                      color: customBlackColor,
                    );
                  }),
            ),
          ),
          drawer: const PinextDrawer(),
          body: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: homeframePages.length,
            controller: state.pageController,
            onPageChanged: ((value) {
              context.read<HomeframeCubit>().changeHomeframePage(value);
            }),
            itemBuilder: ((context, index) => homeframePages[index]),
          ),




          floatingActionButton: state.selectedIndex == 0
              ? IntroStepBuilder(
                  order: 1,
                  text: intro_label_one,
                  builder: (context, introkey) {
                    return FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //Click here to open the subscription page
                            //builder: (context) => const SubscriptionPlanScreen(),
                            //builder: (context) => const Store(),
                            builder: (context) => const PlanScreen(),
                          ),
                        );
                      },
                      backgroundColor: customOrangeColor,
                      child: const Icon(
                        Icons.money_off_sharp,
                        color: whiteColor,
                      ),
                    );
                  })
              : state.selectedIndex == 3
                  ? FloatingActionButton(
                      onPressed: () {
                        context.read<HomeframeCubit>().showAboutDialog(context);
                      },
                      backgroundColor: customBlackColor,
                      child: Text(
                        "?",
                        style: boldTextStyle.copyWith(
                          color: whiteColor,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
          floatingActionButtonLocation: state.selectedIndex != 3
              ? FloatingActionButtonLocation.centerDocked
              : FloatingActionButtonLocation.endFloat,




          bottomNavigationBar: BottomNavigationBar(
            key: key,
            currentIndex: state.selectedIndex,
            onTap: (value) {
              context.read<HomeframeCubit>().changeHomeframePage(value);
            },
            selectedItemColor: customBlueColor,
            unselectedItemColor: customBlackColor.withOpacity(.4),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: IntroStepBuilder(
                    order: 2,
                    text: intro_label_two,
                    builder: (context, introkey) {
                      return const Icon(
                        Iconsax.home,
                      );
                    }),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: IntroStepBuilder(
                    order: 3,
                    text: intro_label_three,
                    builder: (context, introkey) {
                      return const Icon(
                        Iconsax.archive,
                      );
                    }),
                label: "Archive",
              ),
              BottomNavigationBarItem(
                icon: IntroStepBuilder(
                    order: 4,
                    text: intro_label_four,
                    builder: (context, introkey) {
                      return const Icon(
                        Iconsax.wallet_1,
                      );
                    }),
                label: "Wallet",
              ),
              BottomNavigationBarItem(
                icon: IntroStepBuilder(
                    order: 5,
                    text: intro_label_five,
                    builder: (context, introkey) {
                      return const Icon(
                        Iconsax.setting,
                      );
                    }),
                label: "Admin settings",
              ),
            ],
          ),
        );
      },
    );
  }
}

class PinextDrawer extends StatelessWidget {
  const PinextDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: getHeight(context),
        color: greyColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "iWealth",
                        style: regularTextStyle.copyWith(
                          height: .9,
                          color: customBlackColor.withOpacity(.6),
                        ),
                      ),
                      Text(
                        "app",
                        style: boldTextStyle.copyWith(
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppHandler().openPortfolio(context);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [

                            /*
                            Text(
                              "By",
                              style: regularTextStyle.copyWith(
                                fontSize: 10,
                                color: customBlackColor.withOpacity(.4),
                              ),
                            ),


                            */


                            /*

                            Text(
                              "YG Studio.",
                              style: regularTextStyle.copyWith(
                                fontSize: 12,
                                color: customBlackColor.withOpacity(.4),
                              ),
                            ),

                            */

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                IconButton(
                  onPressed: () {
                    AppHandler().sendBugReport(context);
                  },
                  icon: Icon(
                    FontAwesomeIcons.bug,
                    size: 18,
                    color: customBlackColor.withOpacity(.8),
                  ),
                ),
                // const SizedBox(
                //   height: 8,
                // ),
                // IconButton(
                //   onPressed: () {
                //     AppHandler().checkForUpdate(context);
                //   },
                //   icon: Icon(
                //     Icons.update,
                //     size: 18,
                //     color: customBlackColor.withOpacity(.8),
                //   ),
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UnauthenticatedUserState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        ROUTES.getLoginRoute,
                        (route) => false,
                      );
                    }
                  },
                  child: IconButton(
                    onPressed: () async {
                      context.read<UserBloc>().add(
                            SignOutUserEvent(context: context),
                          );
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.redAccent[400],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
