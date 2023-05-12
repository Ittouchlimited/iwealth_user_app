import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../app_data/app_constants/constants.dart';
import '../../app_data/app_constants/fonts.dart';
import '../../app_data/routing/routes.dart';
import '../../app_data/theme_data/colors.dart';
import '../../services/handlers/user_handler.dart';

part 'homeframe_page_state.dart';

class HomeframeCubit extends Cubit<HomeframeState> {
  HomeframeCubit()
      : super(
          HoemframeInitialState(
            selectedIndex: 0,
            pageController: PageController(initialPage: 0),
          ),
        );

  changeHomeframePage(int index) {
    state.pageController.jumpToPage(index);
    emit(HoemframeInitialState(
      selectedIndex: index,
      pageController: state.pageController,
    ));
  }

  openAddTransactionsPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      ROUTES.getAddTransactionsRoute,
    );
  }

  showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Hello, ${UserHandler().currentUser.username} 👋",
            style: boldTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Welcome to iWealth from Norrenberger. Your personal wealth management assistant!",
                  style: regularTextStyle,
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorder),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Dismiss',
                style: boldTextStyle.copyWith(
                  color: customBlackColor.withOpacity(
                    .8,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          actionsPadding: dialogButtonPadding,
        );
      },
    );
  }
}
