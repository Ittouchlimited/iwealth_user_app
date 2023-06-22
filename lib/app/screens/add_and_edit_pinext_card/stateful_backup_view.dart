import 'dart:developer';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/app_constants/domentions.dart';
import 'package:pinext/app/app_data/extensions/string_extensions.dart';
import 'package:pinext/app/bloc/add_card_cubit/add_card_cubit.dart';
import 'package:pinext/app/bloc/cards_and_balances_cubit/cards_and_balances_cubit.dart';
import 'package:pinext/app/models/pinext_card_model.dart';
import 'package:pinext/app/shared/widgets/custom_snackbar.dart';
import 'package:pinext/app/shared/widgets/pinext_card.dart';
import 'package:uuid/uuid.dart';

import '../../app_data/app_constants/fonts.dart';
import '../../app_data/theme_data/colors.dart';
import '../../bloc/signup_cubit/signin_cubit_cubit.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_field.dart';







class LifeCheckerView extends StatefulWidget {
  LifeCheckerView({
    Key? key,
    /*
    this.addCardForSignUpProcess = false,
    this.isEditCardScreen = false,
    this.pinextCardModel,

     */
  }) : super(key: key);
  /*
  bool addCardForSignUpProcess;
  bool isEditCardScreen;
  PinextCardModel? pinextCardModel;

   */

  @override
  State<LifeCheckerView> createState() =>
      _LifeCheckerViewState();
}

class _LifeCheckerViewState extends State<LifeCheckerView> {

  @override
  void initState() {
    super.initState();
  }

  String? isEditCardColor;

  @override
  void dispose() {

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    log("Rebuilding");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: customBlackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Life Checker",
                      style: boldTextStyle.copyWith(
                        color: customBlackColor.withOpacity(
                          .6,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: defaultPadding,
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
