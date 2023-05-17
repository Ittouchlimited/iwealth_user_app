import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/app_data/app_constants/fonts.dart';
import 'package:pinext/app/app_data/extensions/string_extensions.dart';
import 'package:pinext/app/app_data/routing/routes.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/bloc/add_transactions_cubit/add_transactions_cubit.dart';
import 'package:pinext/app/models/pinext_transaction_model.dart';
import 'package:pinext/app/screens/home/pages/cards_and_balance_page.dart';
import 'package:pinext/app/screens/subscriptions/plan_subs.dart';
import 'package:pinext/app/services/handlers/user_handler.dart';
import 'package:pinext/app/shared/widgets/custom_button.dart';
import 'package:pinext/app/shared/widgets/custom_snackbar.dart';
import 'package:pinext/app/shared/widgets/custom_text_field.dart';
import 'package:pinext/market_api_stocks.dart';

import '../../../config/textstyle.dart';
import '../../app_data/app_constants/constants.dart';
import '../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../bloc/userBloc/user_bloc.dart';
import '../../models/pinext_card_model.dart';
import '../../services/firebase_services.dart';
import '../../shared/widgets/pinext_card.dart';
import '../add_and_edit_pinext_card/add_and_edit_pinext_card.dart';
import '../goals_and_milestones/view_goals_and_milestones_screen.dart';

class AddAssetCustomAssetScreen extends StatelessWidget {
  AddAssetCustomAssetScreen({
    Key? key,
    this.isAQuickAction = false,
    this.isViewOnly = false,
    this.pinextTransactionModel,
  }) : super(key: key);

  bool isAQuickAction;
  bool isViewOnly;
  PinextTransactionModel? pinextTransactionModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTransactionsCubit(),
      child: AddAssetCustomAssetView(
        isAQuickAction: isAQuickAction,
        isViewOnly: isViewOnly,
        pinextTransactionModel: pinextTransactionModel,
      ),
    );
  }
}

class AddAssetCustomAssetView extends StatefulWidget {
  AddAssetCustomAssetView({
    Key? key,
    required this.isAQuickAction,
    required this.isViewOnly,
    required this.pinextTransactionModel,
  }) : super(key: key);
  bool isAQuickAction;
  bool isViewOnly;
  PinextTransactionModel? pinextTransactionModel;

  @override
  State<AddAssetCustomAssetView> createState() =>
      _AddAssetCustomAssetViewState();
}

class _AddAssetCustomAssetViewState extends State<AddAssetCustomAssetView> {
  late TextEditingController amountController;
  late TextEditingController detailsController;

  @override
  void initState() {
    amountController = TextEditingController();
    detailsController = TextEditingController();
    detailsController.text = "Custom Asset";
    if (widget.isViewOnly) {
      amountController.text = widget.pinextTransactionModel!.amount;
      detailsController.text = widget.pinextTransactionModel!.details;
      if (widget.pinextTransactionModel!.transactionType == 'Income') {
        context
            .read<AddTransactionsCubit>()
            .changeSelectedTransactionMode(SelectedTransactionMode.income);
      } else {
        context
            .read<AddTransactionsCubit>()
            .changeSelectedTransactionMode(SelectedTransactionMode.enpense);
      }

      context
          .read<AddTransactionsCubit>()
          .selectCard(widget.pinextTransactionModel!.cardId);
    }
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  List listOfTransactionDetailSuggestions = [
    'Misc: ',
  ];

  final bool _checkCard = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (widget.isAQuickAction) {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                context.read<UserBloc>().add(RefreshUserStateEvent());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ROUTES.getHomeframeRoute,
                  (route) => false,
                );
              }
            } else {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.close,
            color: customBlackColor,
          ),
        ),
        title: Text(
          widget.isViewOnly
              ? "Transaction details"
              : "Add Custom Asset",
          style: regularTextStyle,
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
                    SelectTransactionTypeCard(),
                    const SizedBox(
                      height: 12,
                    ),





                    const SizedBox(
                      height: 12,
                    ),




                    Text(
                      "Asset Name/Details",
                      style: boldTextStyle.copyWith(
                        color: customBlackColor.withOpacity(
                          .6,
                        ),
                      ),
                    ),

                    GetSuggestionsList(),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      isEnabled: !widget.isAQuickAction, /*!widget.isViewOnly,*/
                      controller: detailsController,
                      hintTitle: "Enter description...",
                      numberOfLines: 3,
                      onChanged: (String value) {
                        context
                            .read<AddTransactionsCubit>()
                            .changeSelectedDescription(value);
                      },
                      validator: (value) {
                        return InputValidation(value).isNotEmpty();
                      },
                      suffixButtonAction: () {},
                    ),
                    widget.isViewOnly
                        ? const SizedBox.shrink()
                        : Column(
                            children:  [
                              const SizedBox(
                                height: 8,
                              ),

                            ],
                          ),

                    const SizedBox(
                      height: 30,
                    ),




                    Text(
                      "Amount/Value",
                      style: boldTextStyle.copyWith(
                        color: customBlackColor.withOpacity(
                          .6,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      isEnabled: !widget.isAQuickAction,  /*!widget.isViewOnly,*/
                      controller: amountController,
                      hintTitle: "Enter amount/value of Asset",
                      textInputType: TextInputType.number,
                      onChanged: (String value) {},
                      validator: (value) {
                        return InputValidation(value).isCorrectNumber();
                      },
                      suffixButtonAction: () {},
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    //Here is a working divider
                    /*Divider(
                      height: 4,
                      color: HexColor(AppTheme.secondaryColorString!)
                          .withOpacity(0.5),
                    ),*/

                    /*
                    Divider(
                      height: 1,
                      color: HexColor(AppTheme.primaryColorString!).withOpacity(0.2),
                      thickness: 2.0,
                    ),

                     */
/*
                    Text(
                      "You can fetch your current bank account balance from your physical bank account.",
                      style: regularTextStyle.copyWith(
                        fontSize: 14,
                        color: customBlackColor.withOpacity(0.6),
                      ),
                    ),*/

                  /*
                    const SizedBox(
                      height: 10,
                    ),

                   */


                    /*
                    GetCustomButton(
                      title: "View Live Stocks",
                      titleColor: whiteColor,
                      buttonColor: Colors.black,
                      icon: Icons.insights,
                      isLoading: false,
                      callBackFunction: () {

                        /*
                        Navigator.push(
                          context,
                          CustomTransitionPageRoute(
                            childWidget: const MarketApiStocks(),
                          ),
                        );

                         */


                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Sorry, this feature is currently unavailable!"),
                          duration: Duration(seconds: 1),
                        )
                        );


                        //widget.pageController.jumpToPage(
                        //  0,
                        // );
                      },
                    ),

                     */
                    /*
                    ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            textStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                        onPressed:  () {

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Sorry, this feature is currently unavailable!"),
                            duration: Duration(seconds: 1),
                          )
                          );

                          //onPanDown: _onPanDown;
                          /*
                        Navigator.push(
                          context,
                          CustomTransitionPageRoute(
                            childWidget: AddAndEditPinextCardScreen(),
                          ),
                        );
                        */
                        },
                        child: const Text("Fetch balance from\nyour Bank account")
                    ),

                     */


                    const SizedBox(
                      height: 0,
                    ),


                    GestureDetector(


                      onTap: () {
                        //onPanDown: _onPanDown;
                        /*
                        Navigator.push(
                          context,
                          CustomTransitionPageRoute(
                            childWidget: AddAndEditPinextCardScreen(),
                          ),
                        );
                        */
                      },


                      /*
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomTransitionPageRoute(
                            childWidget:
                            //const CardsAndBalancePage(),
                            const ViewGoalsAndMilestoneScreen(),
                          ),
                        );
                      },*/
                      child: Text(
                        "",
                        style: regularTextStyle.copyWith(
                          fontSize: 14,
                          color: customBlackColor.withOpacity(.6),
                        ),
                      ),
                    ),



                    const SizedBox(
                      height: 0,
                    ),

                    const SizedBox(
                      height: 0,
                    ),
                    widget.isViewOnly
                        ? Text(
                            "",
                            style: boldTextStyle.copyWith(
                              color: customBlackColor.withOpacity(
                                .6,
                              ),
                            ),
                          )
                        : Text(
                      //"Please Select a portfolio",

                      "",
                            style: boldTextStyle.copyWith(
                              color: customBlackColor.withOpacity(
                                .6,
                              ),
                            ),
                          ),


                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              ShowPinextCardList(),


              //Update this to 150 if you are adding an API connector button for adding this asset
              const SizedBox(
                height: 0,
              ),
              widget.isAQuickAction/*widget.isViewOnly*/
                  ? const SizedBox.shrink()
                  : AddTransactionButton(),
              const SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
  /*
  _onPanDown(DragDownDetails details) {

  }
  */
  Column SelectTransactionTypeCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [


        /*

        Text(
          "Transaction type",
          style: boldTextStyle.copyWith(
            color: customBlackColor.withOpacity(
              .6,
            ),
          ),
        ),



        */



      /*
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            height: 40,
            child: BlocBuilder<AddTransactionsCubit, AddTransactionsState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child:





                      GestureDetector(
                        onTap: () {
                          if (!widget.isViewOnly) {
                            context
                                .read<AddTransactionsCubit>()
                                .changeSelectedTransactionMode(
                                    SelectedTransactionMode.income);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultBorder),
                              color: state.selectedTransactionMode ==
                                      SelectedTransactionMode.income
                                  ? greyColor
                                  : Colors.transparent,
                            ),




                            child: Text(
                              "Income",
                              style: state.selectedTransactionMode ==
                                      SelectedTransactionMode.income
                                  ? boldTextStyle.copyWith(
                                      color: Colors.greenAccent[400],
                                      fontSize: 20,
                                    )
                                  : boldTextStyle.copyWith(
                                      color: customBlackColor.withOpacity(.4),
                                      fontSize: 20,
                                    ),
                            ),




                          ),
                        ),
                      ),





                    ),
                    Container(
                      width: .5,
                      height: double.maxFinite,
                      color: customBlackColor.withOpacity(.2),
                    ),
                    // Flexible(
                    //   flex: 1,
                    //   child: GestureDetector(
                    //     onTap: (() {
                    //       if (!widget.isViewOnly) {
                    //         context
                    //             .read<AddTransactionsCubit>()
                    //             .changeSelectedTransactionMode(SelectedTransactionMode.enpense);
                    //       }
                    //     }),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10),
                    //       child: Container(
                    //         height: double.maxFinite,
                    //         width: double.maxFinite,
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(defaultBorder),
                    //           color: state.selectedTransactionMode == SelectedTransactionMode.enpense
                    //               ? greyColor
                    //               : Colors.transparent,
                    //         ),
                    //         child: Text(
                    //           "Expense",
                    //           style: state.selectedTransactionMode == SelectedTransactionMode.enpense
                    //               ? boldTextStyle.copyWith(
                    //                   color: Colors.redAccent[400],
                    //                   fontSize: 20,
                    //                 )
                    //               : boldTextStyle.copyWith(
                    //                   color: customBlackColor.withOpacity(.4),
                    //                   fontSize: 20,
                    //                 ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              },
            )),



        */
      ],
    );
  }

  Column GetSuggestionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //"Suggestions (i.e. Bank and Cash Equivalent, Investments, Properties, Land and buildings, Digital Assets etc)",
          "",
          style: boldTextStyle.copyWith(
            color: customBlackColor.withOpacity(
              .6,
            ),
          ),
        ),
        BlocBuilder<AddTransactionsCubit, AddTransactionsState>(
          builder: (context, state) {
            return Wrap(
              spacing: 5,
              runSpacing: -8,
              children: [
                ...List.generate(
                  listOfTransactionDetailSuggestions.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        String selectedDescription = listOfTransactionDetailSuggestions[index].toString();
                        log(selectedDescription);
                        log(state.selectedDescription);
                        if (state.selectedDescription != selectedDescription) {
                          detailsController.text = selectedDescription;
                          context
                              .read<AddTransactionsCubit>()
                              .changeSelectedDescription(selectedDescription);
                              //.selectCard(pinextCardModel.cardId);

                        } else {
                          context
                              .read<AddTransactionsCubit>()
                              .changeSelectedDescription("none");
                        }
                      },
                      child: Chip(
                        label: Text(
                          listOfTransactionDetailSuggestions[index].toString(),
                          style: regularTextStyle.copyWith(
                            color: listOfTransactionDetailSuggestions[index] ==
                                    state.selectedDescription
                                ? whiteColor
                                : customBlackColor.withOpacity(.6),
                          ),
                        ),
                        backgroundColor:
                            listOfTransactionDetailSuggestions[index] ==
                                    state.selectedDescription
                                ? customBlueColor
                                : greyColor,
                      ),
                    );
                  },
                ).toList(),
              ],
            );
          },
        ),
      ],
    );
  }


  //Card begin
  SizedBox ShowPinextCardList() {
    return SizedBox(
      height: 0,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              width: defaultPadding,
            ),
            StreamBuilder(
              stream: FirebaseServices()
                  .firebaseFirestore
                  .collection("pinext_users")
                  .doc(FirebaseServices().getUserId())
                  .collection("pinext_cards")
                  .orderBy(
                    'lastTransactionData',
                    descending: true,
                  )
                  .snapshots(),
              builder: ((context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    PinextCardModel pinextCardModel = PinextCardModel.fromMap(
                      snapshot.data!.docs[index].data(),
                    );

                    String color = pinextCardModel.color;
                    late Color cardColor = getColorFromString(color);
                    if (!widget.isViewOnly) {
                      context
                          .read<AddTransactionsCubit>()
                          .selectCard(pinextCardModel.cardId);
                    }
                   // return GestureDetector(
                     // onTap: () {
                       // _checkCard;
                        /*
                      //  if (!widget.isViewOnly) {
                     //     context
                      //        .read<AddTransactionsCubit>()
                     //         .selectCard(pinextCardModel.cardId);
                     //   }
                        */
                   //   },

                      child: BlocBuilder<AddTransactionsCubit,
                          AddTransactionsState>(
                        builder: (context, state) {

                          Widget pinextCardWidget = PinextCard(
                            title: pinextCardModel.title,
                            balance: pinextCardModel.balance,
                            cardColor: cardColor,
                            isSelected:
                                state.selectedCardNo == pinextCardModel.cardId,
                            lastTransactionDate:
                                pinextCardModel.lastTransactionData,
                            cardDetails: pinextCardModel.description,
                          );


                          return widget.isViewOnly
                              ? state.selectedCardNo == pinextCardModel.cardId
                                  ? pinextCardWidget
                                  : const SizedBox.shrink()
                              : pinextCardWidget;
                        },
                    //),
                    );
                   // );
                  }),
                );
              }),
            ),

            const SizedBox(
              width: defaultPadding - 10,
            ),
          ],
        ),
      ),
    );
  }
  //Card end
  _onPanDown(DragDownDetails details) {

  }
  Padding AddTransactionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      child: BlocConsumer<AddTransactionsCubit, AddTransactionsState>(
        listener: (context, state) {
          if (state is AddTransactionsSuccessState) {
            if (widget.isAQuickAction) {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                context.read<UserBloc>().add(RefreshUserStateEvent());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ROUTES.getHomeframeRoute,
                  (route) => false,
                );
                GetCustomSnackbar(
                  title: "Transaction added!!",
                  message: "Your transaction data has been stored.",
                  snackbarType: SnackbarType.success,
                  context: context,
                );
              }
            } else {
              context.read<UserBloc>().add(RefreshUserStateEvent());
              Navigator.pop(context);
              GetCustomSnackbar(
                title: "Transaction added!!",
                message: "Your transaction data has been stored.",
                snackbarType: SnackbarType.success,
                context: context,
              );
            }
          }
          if (state is AddTransactionsErrorState) {
            GetCustomSnackbar(
              title: "Snap",
              message: state.errorMessage,
              snackbarType: SnackbarType.error,
              context: context,
            );
            context.read<AddTransactionsCubit>().reset();
          }
        },
        builder: (context, state) {
          return GetCustomButton(
            title: widget.isViewOnly ? "Update Asset" : "Add Asset",
            titleColor: whiteColor,
            buttonColor: customBlueColor,
            isLoading: state is AddTransactionsLoadingState ? true : false,
            callBackFunction: () {
              if (!widget.isViewOnly) {
                context
                    .read<AddTransactionsCubit>();
                    //.selectCard(pinextCardModel.cardId);
              }

              if (_formKey.currentState!.validate()) {

                if (amountController.text.isNotEmpty &&
                    detailsController.text.isNotEmpty &&
                    state.selectedCardNo != "none") {
                  if (widget.isAQuickAction) {
                    GetCustomSnackbar(
                      title: "Hello",
                      message: "This function has not yet been deployed! :)",
                      snackbarType: SnackbarType.info,
                      context: context,
                    );
                  } else {
                    if (widget.isAQuickAction) {
                      UserHandler().getCurrentUser();
                    }
                    context.read<AddTransactionsCubit>().addTransaction(
                          amount: amountController.text,
                          details: detailsController.text,
                          transctionType: state.selectedTransactionMode ==
                                  SelectedTransactionMode.income
                              ? "Expense"
                              : "Income",
                        );
                  }
                } else {
                  if (state.selectedCardNo == "none") {
                    GetCustomSnackbar(
                      title: "Error",
                      message: "Please select a valid portfolio and try again!",
                      snackbarType: SnackbarType.error,
                      context: context,

                    );
                  } else {
                    GetCustomSnackbar(
                      title: "Error",
                      message:
                          "Please enter valid details of the transaction and try again!",
                      snackbarType: SnackbarType.error,
                      context: context,
                    );
                  }
                }
              }
            },
          );
        },
      ),
    );
  }
/*
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  content: Text("Sorry, this feature is currently unavailable!"),
  duration: Duration(seconds: 1),
  )
  );
 */
}
