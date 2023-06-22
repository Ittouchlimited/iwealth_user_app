import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:pinext/okra/okra-fetch-options-build.dart';
import 'package:pinext/okra/okra-fetch.dart';
import 'package:pinext/okra/okra-fetch_backup.dart';
import 'package:pinext/okra/okra_fetch_build.dart';
import 'package:provider/provider.dart';

import '../../../config/textstyle.dart';
import '../../../constFiles/colors.dart';
import '../../../constFiles/strings.dart';
import '../../../controller/reportController.dart';
import '../../../controller/transDetailController.dart';
import '../../../controller/transactionController.dart';
import '../../../customWidgets/snackbar.dart';
import '../../../model/transactionModel.dart';
import '../../../okra/okra-fetch-short-build.dart';
import '../../app_data/app_constants/constants.dart';
import '../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../bloc/userBloc/user_bloc.dart';
import '../../models/pinext_card_model.dart';
import '../../services/firebase_services.dart';
import '../../shared/widgets/pinext_card.dart';
import '../add_and_edit_pinext_card/add_and_edit_pinext_card.dart';
import '../goals_and_milestones/view_goals_and_milestones_screen.dart';

import 'package:pinext/view/transactionDetail.dart';

class AddAssetBankAndCashScreen extends StatelessWidget {
  AddAssetBankAndCashScreen({
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
      child: AddAssetBankAndCashView(
        isAQuickAction: isAQuickAction,
        isViewOnly: isViewOnly,
        pinextTransactionModel: pinextTransactionModel,
      ),
    );
  }
}

/*
class TransactionDetail extends StatelessWidget {
  TransactionDetail({Key? key}) : super(key: key);
  static TransDetailController? transDetailController;
  static TransactionController? transController;
  static ReportController? reportController;

  @override
  Widget build(BuildContext context) {

    transDetailController = Provider.of<TransDetailController>(context);
    transController = Provider.of<TransactionController>(context);
    reportController = Provider.of<ReportController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leadingWidth: 25.0,
        title: Row(
          children: const [
          ],
        ),
        actions: [
          Row(
            children: const [
              /*
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: TextButton(
                    onPressed: () => save(context),
                    child: Text(
                        transDetailController!.savedTransaction
                            ? "Update"
                            : "Save",
                        style: const TextStyle(color: Colors.white))),
              ),

               */

            ],
          )
        ],
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Column(
        children: [
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.4),
            children: [

              categoryIcons(
                  text: bankandcash,
                  svgName: bankSvg,
                  isSelected:
                  transDetailController!.selectedDepartment == bankandcash
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(bankandcash)),
              /*
              categoryIcons(
                  text: stocks,
                  svgName: stocksSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == stocks
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(stocks)),
              categoryIcons(
                  text: realestate,
                  svgName: realestateSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == realestate
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(realestate)),
              categoryIcons(
                  text: digitalassets,
                  svgName: digitalassetSvg,
                  isSelected: transDetailController!.selectedDepartment == digitalassets
                      ? true
                      : false,
                  onPress: () => transDetailController!.changeDepartment(digitalassets)),
              categoryIcons(
                  text: vehicle,
                  svgName: vehicleSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == vehicle
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(vehicle)),
              categoryIcons(
                  text: custom,
                  svgName: customSvg,
                  isSelected: transDetailController!.selectedDepartment == custom
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(custom)),
              categoryIcons(
                  text: loan,
                  svgName: loanSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == loan
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(loan)),

              categoryIcons(
                  text: office,
                  svgName: officeSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == office
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(office)),

              categoryIcons(
                  text: others,
                  svgName: othersSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == others
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(others)),
              */
            ],
          ),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: TextField(
                      controller: transDetailController!.titleField,
                      cursorColor: greyText,
                      style: const TextStyle(
                          color: greyText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: const TextStyle(color: greyText),
                          prefixIcon: Padding(
                            padding:
                            const EdgeInsets.only(right: 15.0, left: 5.0),
                            child: SvgPicture.asset(
                              transDetailController!.titleIcon(),
                              height: 5.0,
                              color: Colors.white,
                            ),
                          ),
                          border: InputBorder.none),
                    )),
                const Spacer(),
                Expanded(
                    flex: 2,
                    child: TextField(
                      controller: transDetailController!.amountField,
                      textAlign: TextAlign.end,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      cursorColor: greyText,
                      style: const TextStyle(
                          color: greyText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          hintText: "Amount",
                          hintStyle: TextStyle(color: greyText),
                          border: InputBorder.none),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: transDetailController!.descriptionField,
                textAlign: TextAlign.start,
                minLines: 20,
                maxLines: 50,
                decoration: const InputDecoration(
                    hintText: "Description here...", border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding categoryIcons({
    required String text,
    required String svgName,
    required bool isSelected,
    required Function() onPress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: isSelected ? const Color(0xffeae1f9) : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  svgPath(svgName),
                  height: 35.0,
                  color: svgColor,
                ),
              ),
              Text(
                text,
                style: TextStyle(color: svgColor, fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  save(BuildContext context) {
    if (transDetailController!.titleField.text.isEmpty) {
      snackBar(context: context, title: "Title Is Mandatory");
    } else if (double.tryParse(transDetailController!.amountField.text) ==
        null ||
        transDetailController!.amountField.text.contains("-")) {
      snackBar(context: context, title: "Enter Valid Amount");
    } else {
      TransactionModel transactionModel = TransactionModel(
        id: transDetailController!.savedTransaction
            ? transDetailController!.transactionId
            : DateTime.now().microsecondsSinceEpoch,
        title: transDetailController!.titleField.text,
        description: transDetailController!.descriptionField.text,
        amount: transDetailController!.amountField.text,
        isIncome: transDetailController!.isIncomeSelected ? 1 : 0,
        category: transDetailController!.selectedDepartment,
        dateTime: transDetailController!.savedTransaction
            ? transDetailController!.date
            : DateTime.now().toString(),
      );

      if (transDetailController!.savedTransaction) {
        transController!.updateTransaction(transactionModel);
      } else {
        transController!.insertTransaction(transactionModel);
      }
      transController!.fetchTransaction();
      reportController!.fetchTransaction();
      Navigator.pop(context);
    }
  }
}

 */

class AddAssetBankAndCashView extends StatefulWidget {
  AddAssetBankAndCashView({
    Key? key,
    required this.isAQuickAction,
    required this.isViewOnly,
    required this.pinextTransactionModel,
  }) : super(key: key);
  bool isAQuickAction;
  bool isViewOnly;
  PinextTransactionModel? pinextTransactionModel;

  @override
  State<AddAssetBankAndCashView> createState() =>
      _AddAssetBankAndCashViewState();
}

class _AddAssetBankAndCashViewState extends State<AddAssetBankAndCashView> {
  late TextEditingController amountController;
  late TextEditingController detailsController;
  //Category feature
  //Copy this
  static TransDetailController? transDetailController;
  static TransactionController? transController;
  static ReportController? reportController;
  //Copy this
  @override
  void initState() {
    amountController = TextEditingController();
    detailsController = TextEditingController();
    detailsController.text = "Bank and Cash";
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
    //reportController?.dispose();
    //transDetailController?.dispose();
    //transController?.dispose();
    super.dispose();
  }

  List listOfTransactionDetailSuggestions = [
    'Bank: ',
    'Cash:  ',
  ];

  final bool _checkCard = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Category feature
    //Copy this
    transDetailController = Provider.of<TransDetailController>(context);
    transController = Provider.of<TransactionController>(context);
    reportController = Provider.of<ReportController>(context);
    //Copy this
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
              : "Add a Bank and Cash Asset",
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

                    /*
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      child: TextButton(
                          onPressed: () => save(context),
                          child: Text(
                              transDetailController!.savedTransaction
                                  ? "Update"
                                  : "Save",
                              style: const TextStyle(color: Colors.white))),
                    ),

                     */
                    //TransactionDetail(),
                    SelectTransactionTypeCard(),
                    const SizedBox(
                      height: 0,
                    ),


                    /*
                    TextField(
                      controller: transDetailController!.titleField,
                      cursorColor: greyText,
                      style: const TextStyle(
                          color: greyText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          //hintText: transDetailController!.title(),
                          hintText: "Bank and Cash",
                          hintStyle: const TextStyle(color: greyText),
                          prefixIcon: Padding(
                            padding:
                            const EdgeInsets.only(right: 15.0, left: 5.0),
                            child: SvgPicture.asset(
                              transDetailController!.titleIcon(),
                              height: 5.0,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none),
                    ),

                     */



                    /*
                    TextField(
                      controller: transDetailController!.amountField,
                      textAlign: TextAlign.end,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      cursorColor: greyText,
                      style: const TextStyle(
                          color: greyText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          hintText: "100",
                          hintStyle: TextStyle(color: greyText),
                          border: InputBorder.none),
                    ),

                     */


                    const SizedBox(
                      height: 0,
                    ),


                    /*
                    TextField(
                      controller: transDetailController!.descriptionField,
                      textAlign: TextAlign.start,
                      //minLines: 20,
                      //maxLines: 50,
                      decoration: const InputDecoration(
                          hintText: "Description here...", border: InputBorder.none),
                    ),

                     */

                    //Copy this
                    Text(
                      //transDetailController!.isIncomeSelected ? income : expense,
                      transDetailController!.isIncomeSelected ? income : income,
                        //transDetailController!.isIncomeSelected = "income,
                        //pinextTransactionModel!.transactionType == 'Income'
                      style:
                      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                    /*
                    IconButton(
                        icon: const Icon(Icons.refresh_outlined),
                        tooltip: "Change Category",
                        onPressed: () => transDetailController!.changeCategory()),


                     */

                    const SizedBox(
                      height: 20,
                    ),
//Copy this
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
                            children:  const [
                              SizedBox(
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
                      //Copy this
                      //onChanged: (String value) {},
                      onChanged: (value) {
                        //transController = value;
                        transDetailController!.amountField.text = value;
                      },
                      //Copy this
                      validator: (value) {
                        return InputValidation(value).isCorrectNumber();
                      },
                      suffixButtonAction: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Here is a working divider
                    /*Divider(
                      height: 4,
                      color: HexColor(AppTheme.secondaryColorString!)
                          .withOpacity(0.5),
                    ),*/

                    Divider(
                      height: 1,
                      color: HexColor(AppTheme.primaryColorString!).withOpacity(0.2),
                      thickness: 2.0,
                    ),
/*
                    Text(
                      "You can fetch your current bank account balance from your physical bank account.",
                      style: regularTextStyle.copyWith(
                        fontSize: 14,
                        color: customBlackColor.withOpacity(0.6),
                      ),
                    ),*/
                    const SizedBox(
                      height: 10,
                    ),


                    GetCustomButton(
                      title: "Fetch Balance from your Bank Account",
                      titleColor: Colors.white,
                      buttonColor: Colors.black,
                      icon: Icons.attach_money,
                      isLoading: false,
                      callBackFunction: () {


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //builder: (context) => OkraFetchPage(title: "OkraFetch", amount: "0"),),
                            //builder: (context) => OkraFetchPageOptionsBuild(title: "OkraFetch", amount: "0"),),
                          builder: (context) => OkraFetchPageShortBuild(),),
                        );

                        /*
                        Navigator.push(
                          context,
                          CustomTransitionPageRoute(
                            childWidget: const OkraFetch(),
                            //childWidget: const OkraFetchBuild(),
                          ),
                        );

                         */

                        /*
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Sorry, this feature is currently unavailable!"),
                          duration: Duration(seconds: 1),
                        )
                        );
                        //widget.pageController.jumpToPage(
                        //  0,
                        // );


                         */
                      },
                    ),
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
                      height: 0,
                    ),
                  ],
                ),
              ),
              ShowPinextCardList(),


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

  //Copy this
  Column SelectTransactionTypeCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.4),
          children: [
            categoryIcons(
                text: bankandcash,
                svgName: bankSvg,
                isSelected:
                transDetailController!.selectedDepartment == bankandcash
                    ? true
                    : false,
                onPress: () =>
                    transDetailController!.changeDepartment(bankandcash)),
            /*
              categoryIcons(
                  text: stocks,
                  svgName: stocksSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == stocks
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(stocks)),
              categoryIcons(
                  text: realestate,
                  svgName: realestateSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == realestate
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(realestate)),
              categoryIcons(
                  text: digitalassets,
                  svgName: digitalassetSvg,
                  isSelected: transDetailController!.selectedDepartment == digitalassets
                      ? true
                      : false,
                  onPress: () => transDetailController!.changeDepartment(digitalassets)),
              categoryIcons(
                  text: vehicle,
                  svgName: vehicleSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == vehicle
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(vehicle)),
              categoryIcons(
                  text: custom,
                  svgName: customSvg,
                  isSelected: transDetailController!.selectedDepartment == custom
                      ? true
                      : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(custom)),
              categoryIcons(
                  text: loan,
                  svgName: loanSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == loan
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(loan)),

              categoryIcons(
                  text: office,
                  svgName: officeSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == office
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(office)),

              categoryIcons(
                  text: others,
                  svgName: othersSvg,
                  isSelected:
                      transDetailController!.selectedDepartment == others
                          ? true
                          : false,
                  onPress: () =>
                      transDetailController!.changeDepartment(others)),
              */
          ],
        ),



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
  //Copy this

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
                                ? Colors.white
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


  //Copy this
  Padding AddTransactionButton() {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      child: BlocConsumer<AddTransactionsCubit, AddTransactionsState>(
        listener: (context, state) {
          //save(context);
          if (state is AddTransactionsSuccessState) {
            //Copy this
            save(context);
            //Copy this
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
                //save(context);
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
              //save(context);
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
            titleColor: Colors.white,
            buttonColor: customBlueColor,
            isLoading: state is AddTransactionsLoadingState ? true : false,
            callBackFunction: () {
              //balanceController.text = "0";
              if (!widget.isViewOnly) {
                context
                    .read<AddTransactionsCubit>();
                //save(context);
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
                    //save(context);
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
              //transDetailController!.amountField.text = amountController.text;
              //save(context);
            },
          );
        },
      ),
    );
  }

  //Copy this
  Padding categoryIcons({
    required String text,
    required String svgName,
    required bool isSelected,
    required Function() onPress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: isSelected ? const Color(0xffeae1f9) : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  svgPath(svgName),
                  height: 50.0,
                  color: svgColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(color: svgColor, fontSize: 10),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
  //Copy this

  //Copy this
  //save(BuildContext context) {}
  save(BuildContext context) {
    transDetailController!.titleField.text = "Bank and Cash";
    //transDetailController!.amountField.text = "";
    //transDetailController!.amountField.text = amountController.text;
    transDetailController!.selectedDepartment == bankandcash;
    transDetailController!.changeDepartment(bankandcash);

    if (transDetailController!.titleField.text.isEmpty) {
      snackBar(context: context, title: "Title Is Mandatory");
    } else if (double.tryParse(transDetailController!.amountField.text) ==
        null ||
        transDetailController!.amountField.text.contains("-")) {
      snackBar(context: context, title: "Enter Valid Amount");
    } else {
      TransactionModel transactionModel = TransactionModel(
        id: transDetailController!.savedTransaction
            ? transDetailController!.transactionId
            : DateTime.now().microsecondsSinceEpoch,
        title: transDetailController!.titleField.text,
        description: transDetailController!.descriptionField.text,
        amount: transDetailController!.amountField.text,
        isIncome: transDetailController!.isIncomeSelected ? 1 : 0,
        category: transDetailController!.selectedDepartment,
        dateTime: transDetailController!.savedTransaction
            ? transDetailController!.date
            : DateTime.now().toString(),
      );

      if (transDetailController!.savedTransaction) {
        transController!.updateTransaction(transactionModel);
      } else {
        transController!.insertTransaction(transactionModel);
      }
      transController!.fetchTransaction();
      reportController!.fetchTransaction();
      //Navigator.pop(context);
    }
  }
  //Copy this
/*
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  content: Text("Sorry, this feature is currently unavailable!"),
  duration: Duration(seconds: 1),
  )
  );
 */
}
