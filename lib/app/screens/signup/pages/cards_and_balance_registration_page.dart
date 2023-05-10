import 'dart:developer';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:path/path.dart' as path;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/app_data/extensions/string_extensions.dart';
import 'package:pinext/app/models/pinext_goal_model.dart';
import 'package:pinext/app/screens/add_and_edit_pinext_card/user_verification.dart';
import 'package:pinext/app/screens/goals_and_milestones/add_and_edit_goal_and_milestone_screen.dart';
import 'package:pinext/app/screens/subscriptions/plan_subs.dart';
import 'package:pinext/app/screens/subscriptions/subscription_plan.dart';
import 'package:pinext/app/shared/widgets/custom_snackbar.dart';
import 'package:pinext/app/shared/widgets/pinext_card_minimized.dart';

import '../../../app_data/app_constants/constants.dart';
import '../../../app_data/app_constants/domentions.dart';
import '../../../app_data/app_constants/fonts.dart';
import '../../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../../app_data/routing/routes.dart';
import '../../../app_data/theme_data/colors.dart';
import '../../../bloc/signup_cubit/signin_cubit_cubit.dart';
import '../../../bloc/userBloc/user_bloc.dart';
import '../../../models/pinext_card_model.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/pinext_goal_minimized.dart';
import '../../add_and_edit_pinext_card/add_and_edit_pinext_card.dart';

class CardsAndBalancesRegistrationPage extends StatefulWidget {
  CardsAndBalancesRegistrationPage({
    Key? key,
    required this.monthlyBudgetController,
    required this.budgetSpentSoFarController,
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.addressController,
    required this.numberController,
    required this.filesController,
    required this.userRangeController,
    required this.pageController,
  }) : super(key: key);

  TextEditingController userNameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController monthlyBudgetController;
  TextEditingController budgetSpentSoFarController;
  TextEditingController addressController;
  TextEditingController numberController;
  TextEditingController filesController;
  TextEditingController userRangeController;
  PageController pageController;

  @override
  State<CardsAndBalancesRegistrationPage> createState() =>
      _CardsAndBalancesRegistrationPageState();
}

final List<String> incomerangeItems = [
  '100-1000',
  '2000-5000',
];

List<String> selectedItems = [];

String? selectedValue;

final _formKey = GlobalKey<FormState>();



class _CardsAndBalancesRegistrationPageState extends State<CardsAndBalancesRegistrationPage> {
  double netBalance = 0;
  String? _fileName;
  File? _uploadedFile;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "iWealth",
                style: regularTextStyle.copyWith(
                  color: customBlackColor.withOpacity(.6),
                ),
              ),
              Text(
                "Complete Your Registration",
                style: boldTextStyle.copyWith(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 8,
              ),



              /*
              Container(
                padding: const EdgeInsets.all(
                  35,
                ),
                width: getWidth(context),
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(
                    defaultBorder,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your current net worth is",
                      style: boldTextStyle.copyWith(
                        color: customBlackColor.withOpacity(.6),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<SigninCubit, SigninState>(
                      builder: (context, state) {
                        netBalance = 0;
                        for (PinextCardModel card in state.cards) {
                          netBalance += double.parse(card.balance.toString());
                        }
                        return Text(
                          netBalance.toString(),
                          style: boldTextStyle.copyWith(
                            color: customBlackColor,
                            fontSize: 50,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Naira",
                      style: boldTextStyle.copyWith(
                        color: customBlackColor.withOpacity(.6),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    /*
                    Text(
                      "*Please add in cards to see your updated NET balance here!",
                      style: boldTextStyle.copyWith(
                        color: customBlackColor.withOpacity(.3),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    */
                  ],
                ),
              ),
              */


              const SizedBox(
                height: 12,
              ),
              Text(
                "Your Address",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              CustomTextFormField(
                controller: widget.addressController,
                hintTitle: "Enter your address",
                textInputType: TextInputType.text,
                onChanged: (String value) {},
                validator: (value) {
                  return InputValidation(value).isNotEmpty();
                },
                suffixButtonAction: () {},
              ),
              const SizedBox(
                height: 4,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Your Mobile Number",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                controller: widget.numberController,
                hintTitle: "Enter your number",
                textInputType: TextInputType.number,
                onChanged: (String value) {},
                validator: (value) {
                  return InputValidation(value).isCorrectNumber();
                },
                suffixButtonAction: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "User Range",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),





              const SizedBox(height: 3),
              DropdownButtonFormField2(
                decoration: const InputDecoration(
                  //Add isDense true and zero Padding.
                  //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                  isDense: false,
                  contentPadding: EdgeInsets.zero,
                  /*border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),*/
                  //Add more decoration as you want here
                  //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                ),
                isExpanded: true,
                hint: const Text(
                  'Your Income Range',
                  style: TextStyle(fontSize: 14),
                ),
                items: incomerangeItems
                    .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Your Income Range';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when changing the item if you want.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 60,
                  padding: EdgeInsets.only(left: 20, right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),





              /*

              CustomTextFormField(
                controller: widget.userRangeController,
                hintTitle: "Minimum 100",
                textInputType: TextInputType.number,
                onChanged: (String value) {},
                validator: (value) {
                  return InputValidation(value).isCorrectNumber();
                },
                suffixButtonAction: () {},
              ),





              */
          /*
              const SizedBox(
                height: 40,
              ),
              Text(
                "Upload User Verification File",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: widget.filesController,
                decoration: InputDecoration(
                  hintText: _fileName ?? 'Click here to upload',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        setState(() {
                          _uploadedFile = File(result.files.single.path!);
                          _fileName = path.basename(_uploadedFile!.path);
                        });
                      }
                    },
                    icon: Icon(Icons.upload),
                  ),
                ),
              ),
              */



              const SizedBox(
                height: 6,
              ),
              const SizedBox(
                height: 12,
              ),


              /*
              Text(
                "Monthly Budget",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),

*/



              /*
              CustomTextFormField(
                controller: widget.monthlyBudgetController,
                hintTitle: "Enter your monthly budget",
                textInputType: TextInputType.number,
                onChanged: (String value) {},
                validator: (value) {
                  return InputValidation(value).isCorrectNumber();
                },
                suffixButtonAction: () {},
              ),
              */





/*
              const SizedBox(
                height: 4,
              ),
              Text(
                "*This is the maximum amount of CASH you'll be spending in one month!",
                style: regularTextStyle.copyWith(
                  color: customBlackColor.withOpacity(.4),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "And how much of that have you spent so far?",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),

*/

/*

              CustomTextFormField(
                controller: widget.budgetSpentSoFarController,
                hintTitle: "Budget spent so far...",
                textInputType: TextInputType.number,
                onChanged: (String value) {},
                validator: (value) {
                  return InputValidation(value).isCorrectNumber();
                },
                suffixButtonAction: () {},
              ),


              */


/*
              const SizedBox(
                height: 12,
              ),
              Text(
                "Portfolio management",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<SigninCubit, SigninState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state.cards.isEmpty
                          ? Text(
                              "Please create a portfolio to continue with the registration process!",
                              style: regularTextStyle.copyWith(
                                color: customBlackColor.withOpacity(.4),
                              ),
                            )
                          : const SizedBox.shrink(),
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        child: ListView.builder(
                          itemCount: state.cards.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            log('creating list');
                            PinextCardModel pinextCardModel =
                                state.cards[index];
                            return PinextCardMinimized(
                              onDeleteButtonClick: () {
                                log('button pressed');
                                context.read<SigninCubit>().removeCard(index);
                              },
                              onEditButtonClick: () {
                                //TODO: Add logic
                              },
                              pinextCardModel: pinextCardModel,
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),

              */







              /*
              const SizedBox(
                height: 12,
              ),
              Text(
                "",
                style: boldTextStyle,
              ),
              */
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CustomTransitionPageRoute(
                        childWidget: UserVerificationScreen(addCardForSignUpProcess: true,),
                        //childWidget: AddAndEditPinextCardScreen(addCardForSignUpProcess: true,),
                      ));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(
                      defaultBorder,
                    ),
                  ),
                  alignment: Alignment.center,
                  width: getWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          border: Border.all(
                            color: customBlackColor.withOpacity(.4),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: customBlackColor.withOpacity(.4),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Upload your verification data",
                        style: boldTextStyle.copyWith(
                          color: customBlackColor.withOpacity(.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),









              const SizedBox(
                height: 4,
              ),

              /*
              Text(
                "* Your portfolio will be used to track your assets and liabilities.",
                style: regularTextStyle.copyWith(
                  color: customBlackColor.withOpacity(.4),
                ),
              ),
              */




              const SizedBox(
                height: 20,
              ),
              /*
              Text(
                "Manage Goals",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<SigninCubit, SigninState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state.goals.isEmpty
                          ? Text(
                              "Add goals and milestones to view them here! You dont necessarily need them, for the registration process.",
                              style: regularTextStyle.copyWith(
                                color: customBlackColor.withOpacity(.4),
                              ),
                            )
                          : const SizedBox.shrink(),
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        child: ListView.builder(
                          itemCount: state.goals.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            log('creating list');
                            PinextGoalModel pinextGoalModel =
                                state.goals[index];
                            return PinextGoalCardMinimized(
                              pinextGoalModel: pinextGoalModel,
                              index: index,
                              showCompletePercentage: false,
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),






              const SizedBox(
                height: 12,
              ),
              Text(
                "Add goals/ milestones",
                style: boldTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomTransitionPageRoute(
                      childWidget: AddAndEditGoalsAndMilestoneScreen(
                        addingNewGoal: false,
                        addingNewGoalDuringSignupProcess: true,
                        editingGoal: false,
                        pinextGoalModel: null,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(
                      defaultBorder,
                    ),
                  ),
                  alignment: Alignment.center,
                  width: getWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          border: Border.all(
                            color: customBlackColor.withOpacity(.4),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: customBlackColor.withOpacity(.4),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Add a goal/ milestone",
                        style: boldTextStyle.copyWith(
                          color: customBlackColor.withOpacity(.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "*These will be your goals and milestones for the coming months, years and so on. Once you save up to them, your goals will be archived and you can add new goals.",
                style: regularTextStyle.copyWith(
                  color: customBlackColor.withOpacity(.4),
                ),
              ),
              const SizedBox(
                height: 12,
              ),



            */









              BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is AuthenticatedUserState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //builder: (context) => const PlanScreen(),
                        builder: (context) => const SubscriptionPlanScreen(),
                      ),
                    );
                  }
                },
                child: BlocConsumer<SigninCubit, SigninState>(
                  listener: (context, state) {
                    if (state is SigninErrorState) {
                      GetCustomSnackbar(
                        title: "Snap, an error occurred!",
                        message: state.errorMessage,
                        snackbarType: SnackbarType.success,
                        context: context,
                      );
                      context.read<SigninCubit>().reset();
                    }
                    if (state is SigninSuccessState) {
                      context.read<UserBloc>().add(RefreshUserStateEvent());
                      context.read<SigninCubit>().reset();
                    }
                  },
                  builder: (context, state) {
                    return GetCustomButton(
                      title: "Register",
                      titleColor: whiteColor,
                      buttonColor: customBlueColor,
                      isLoading: state is SigninLoadingState,
                      callBackFunction: () {
                        widget.monthlyBudgetController.text = "0";
                        widget.budgetSpentSoFarController.text = "0";
                        widget.userRangeController.text = "0";
                        if (_formKey.currentState!.validate()) {
                          if (widget.monthlyBudgetController.text.isNotEmpty &&
                              widget
                                  .budgetSpentSoFarController.text.isNotEmpty &&
                              state.cards.isNotEmpty) {
                            context.read<SigninCubit>().signupUser(
                                  emailAddress: widget.emailController.text,
                                  password: widget.passwordController.text,
                                  username: widget.userNameController.text,
                                  pinextCards: state.cards,
                                  netBalance: netBalance.floor().toString(),
                                  monthlyBudget:
                                      widget.monthlyBudgetController.text,
                                  budgetSpentSoFar:
                                      widget.budgetSpentSoFarController.text,
                                  pinextGoals: state.goals,
                                );
                          } else {
                            GetCustomSnackbar(
                              title: "....",
                              message:
                                  "You need to fill up the form to create an account.",
                              snackbarType: SnackbarType.info,
                              context: context,
                            );
                          }
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GetCustomButton(
                title: "Back",
                titleColor: whiteColor,
                buttonColor: customBlackColor,
                isLoading: false,
                callBackFunction: () {
                  widget.pageController.jumpToPage(
                    0,
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
