import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:pinext/app/screens/home/homeframe.dart';
import 'package:pinext/app/screens/home/pages/home_page.dart';
import 'package:pinext/app/screens/silver/silver_screen.dart';
import 'package:pinext/app/shared/widgets/custom_button.dart';
import 'package:pinext/customWidgets/textButton.dart';
import 'package:pinext/services/databaseHelper.dart';
import 'package:pinext/services/database_helpers.dart';
import 'package:pinext/services/database_helpers.dart';
import 'package:pinext/services/database_helpers.dart';
import 'package:uuid/uuid.dart';
import '../../../services/database_helpers.dart';
import '../../../services/database_helpers.dart';
import '.env.dart';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_data/app_constants/fonts.dart';
import '../../app_data/routing/routes.dart';
import '../../bloc/userBloc/user_bloc.dart';
import '../../models/pinext_user_model.dart';



import 'package:flutter/services.dart';


import 'package:pinext/model/userPlans.dart';
import 'package:pinext/services/databaseHelperPlan.dart';
//import 'package:intl/intl.dart';

//String startDateNowForPlan =
//var timeNow = DateTime.now().day;
var startDateNowForPlan = DateTime.now().toLocal();
//DateTime endDateNowForPlan = scheduleTime.add(const Duration(seconds: 20));
DateTime endDateNowForPlan = scheduleTime.add(const Duration(days: 365));



var isDisable=true;

class FlutterwaveOne extends StatefulWidget {
  FlutterwaveOne(this.title);

  final String title;

  @override
  _FlutterwaveOneState createState() => _FlutterwaveOneState();
}

class _FlutterwaveOneState extends State<FlutterwaveOne> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = flutterwaveSelectedCurrency;
  String encryptionKey = flutterwaveEncryptionKey;
  String publicKey = flutterwavePublicKey;
  String amount = flutterwaveSilverPlanSubFee;


  bool isTestMode = true;


  late DatabaseHelperPlan dbHelper;
  final planNameController = TextEditingController();
  final planStartDateTimeController = TextEditingController();
  final planEndDateTimeController = TextEditingController();
  bool isEditing = false;


  late UserPlan _user;

  @override
  void initState() {
    super.initState();
    _inputControllerRegular.text = "Silver Plan Inactive!";
    _planStartDateControllerRegular.text = "$startDateNowForPlan";
    _planEndDateControllerRegular.text = "$endDateNowForPlan";
  }




  //Subscription verification start
  final TextEditingController _inputControllerRegular = TextEditingController();
  final TextEditingController _inputControllerSilver = TextEditingController();
  final TextEditingController _inputControllerPlatinum = TextEditingController();
  final TextEditingController _planStartDateControllerRegular = TextEditingController();
  final TextEditingController _planEndDateControllerRegular = TextEditingController();



  @override
  void dispose() {
    _inputControllerRegular.dispose();
    _inputControllerSilver.dispose();
    _inputControllerPlatinum.dispose();
    _planStartDateControllerRegular.dispose();
    _planEndDateControllerRegular.dispose();
    super.dispose();
  }
  //Subscription verification end


  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;
    encryptionKeyController.text = encryptionKey;
    publicKeyController.text = publicKey;
    amountController.text = amount;

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              /*
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Amount"),
                  validator: (value) =>
                  value!.isNotEmpty ? null : "Amount is required",
                ),
              ),
               */
              /*
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: currencyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: _openBottomSheet,
                  decoration: const InputDecoration(
                    hintText: "Currency",
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : "Currency is required",
                ),
              ),

               */

              /*
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: publicKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Public Key",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: encryptionKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Encryption Key",
                  ),
                ),
              ),
              /*
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),

               */
              ),

               */

              /*
              TextFormField(
                controller: planNameController,
                decoration: const InputDecoration(
                    hintText: 'Plan Name'
                    //labelText: 'Name'
                ),
              ),
              TextFormField(
                controller: planStartDateTimeController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                    hintText: 'Start Date',
                    //labelText: 'Age'
                ),
              ),
              TextFormField(
                controller: planEndDateTimeController,
                decoration: const InputDecoration(
                    hintText: 'End Date',
                    //labelText: 'Email'
                ),
              ),

               */



              Text(currentUser!.email.toString(),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              /*
              Text(currentUser!.phoneNumber.toString(),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

               */

              /*
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                ),
              ),

               */

              /*
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  children: [
                    const Text("Use Debug"),
                    Switch(
                      onChanged: (value) => {
                        setState(() {
                          isTestMode = value;
                        })
                      },
                      value: isTestMode,
                    ),
                  ],
                ),
              ),

               */
              /*
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  //onPressed: _onPressed,
                  child: const Text(
                    "Make Payment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

               */

              /*
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed:  (){
                    //_onPressed();
                    setState((){
                      setButton();
                    });
                  },
                  child: const Text('Ok'),

                  //onPressed: _onPressed,
                  /*
                  child: const Text(
                    "Cancel Plan",
                    style: TextStyle(color: Colors.white),
                  ),

                   */
                ),
              ),
              */

              /*
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:


                ElevatedButton(
                  onPressed:  isDisable
                      ? () => null : clickButton(),

                  child: const Text('Make Payment'),

                  //onPressed: _onPressed,
                  /*
                  child: const Text(
                    "Cancel Plan",
                    style: TextStyle(color: Colors.white),
                  ),

                   */
                ),





              ),
              */


              //Regular Plan Checker Start
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:
                //Subscription information
                const Text("Silver Plan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,

                  ),
                ),
                //Subscription verification end
              ),










              const Text("* Track assets & liabilities \n"
                  "* Update depository \n"
                  "* Periodic investment advice \n"
                  "* Annual portfolio validation and valuation \n"
                  "* Personal Relationship \n"
                  "* Management \n"
                  "* Disclosure upon demise \n"
                  "* Biannual check-ins via phone or physical visitation \n"
                  "* Simple Will Preparation \n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    //fontWeight: FontWeight.w600,

                  ),
                ),
                //Subscription verification end


              //Regular Plan Checker Start
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:
                //Subscription verification start
                TextField(
                  controller: _inputControllerRegular,
                  enabled: false,

                ),
                //Subscription verification end
              ),

              /*
              //Regular Plan Checker Start
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child:
                //Subscription verification start
                TextField(
                  controller: _planStartDateControllerRegular,
                  enabled: false,
                    style: const TextStyle(
                      color: Colors.grey,
                    )

                ),
                //Subscription verification end
              ),



              //Regular Plan Checker Start
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child:
                //Subscription verification start
                TextField(
                  controller: _planEndDateControllerRegular,
                  enabled: false,
                  style: const TextStyle(
                    color: Colors.grey,
                  )

                ),
                //Subscription verification end
              ),

               */

/*
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:
                //Subscription verification start
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.fromLTRB(100, 25, 100, 25)
                  ),
                  onPressed: () {
                    //_read();
                    //confirmCancelSubscription();
                    //_onPressed();
                  },
                  child: const Text('READ'),
                ),
                //Subscription verification end
              ),

 */


            /*
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:
                //Subscription verification start
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.fromLTRB(100, 25, 100, 25)
                  ),
                  onPressed: () {
                    //_save();
                    //confirmCancelSubscription();
                    //_onPressed();
                  },
                  child: const Text('SAVE'),
                ),
                //Subscription verification end
              ),

             */


              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputControllerRegular,
                builder: (context, value, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(100, 25, 100, 25)
                    ),
                    onPressed: value.text.isEmpty ? () {
                      //_onPressed();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SilverScreen(),
                        ),
                      );

                    } : null,
                    child: const Text('Access Services'),
                  );
                },
              ),





              const SizedBox(
                height: 20,
              ),

              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputControllerRegular,
                builder: (context, value, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(100, 25, 100, 25)
                    ),
                    onPressed: value.text.isNotEmpty ? () {
                      _onPressed();
                    } : null,
                    child: const Text('Activate Silver Plan'),
                  );
                },
              ),
              //Regular Plan Checker End


              /*
              //Silver Plan Checker Start
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:
                //Subscription verification start
                TextField(controller: _inputControllerSilver),
                //Subscription verification end
              ),

              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputControllerSilver,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: value.text.isNotEmpty ? () {} : null,
                    child: Text('Make Payment'),
                  );
                },
              ),
              //Silver Plan Checker End


              //Platinum Plan Checker Start
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:
                //Subscription verification start
                TextField(controller: _inputControllerPlatinum),
                //Subscription verification end
              ),

              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputControllerPlatinum,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: value.text.isNotEmpty ? () {} : null,
                    child: Text('Make Payment'),
                  );
                },
              ),
              //Platinum Plan Checker End


               */


              /*
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _inputController,
                builder: (context, value, child) {
                  return GetCustomButton(
                      title: "Make Payment",
                      titleColor: Colors.white,
                      buttonColor: Colors.deepOrangeAccent,
                      callBackFunction: value.text.isNotEmpty ? () {} : null,)
                },
              ),

               */

              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child:
                //Subscription verification start
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                      padding: const EdgeInsets.fromLTRB(100, 25, 100, 25)
                  ),
                  onPressed: () {
                    confirmCancelSubscription();
                    //_onPressed();
                  },
                  child: const Text('Cancel Subscription'),
                ),
                //Subscription verification end
              ),

            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onPressed() {
    if (formKey.currentState!.validate()) {
      _handlePaymentInitialization();
    }
  }

  /*
  _onPressed() {
    if (formKey.currentState.validate()) {
      _handlePaymentInitialization();
    }
  }

   */


  _handlePaymentInitialization() async {
    final Customer customer = Customer(email: currentUser!.email.toString(), name: 'James', phoneNumber: '08131953036');

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: publicKeyController.text.trim().isEmpty
            ? getPublicKey()
            : publicKeyController.text.trim(),
        currency: selectedCurrency,
        redirectUrl: 'https://ijames.com.ng',
        txRef: const Uuid().v1(),
        amount: amountController.text.toString().trim(),
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: "Test Payment"),
        //isTestMode: isTestMode
        isTestMode: true,
        );
    final ChargeResponse response = await flutterwave.charge();
    if (response != null) {
      showLoading(response.toString());
      print("${response.toJson()}");

      /*
      //This snackbar displays the response
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${response.toJson()}"),
          duration: const Duration(seconds: 30),
        ),
      );

       */


      //This snackbar simply displays the the success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Plan activated successfully!"),
          duration: Duration(seconds: 5),
        ),
      );

      //First working approach to disable button
      /*
      setState((){
        setButton();
      });

       */

      //Second working approach to disable button
      _inputControllerRegular.text = "";

    } else {
      showLoading("No Response!");
    }
  }

  String getPublicKey() {
    return "";
  }
/*
  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }

 */
/*
  Widget _getCurrency() {
    //final currencies = ["NGN", "RWF", "UGX", "KES", "ZAR", "USD", "GHS", "TZS"];
    final currencies = ["NGN"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
          onTap: () => {_handleCurrencyTap(currency)},
          title: Column(
            children: [
              Text(
                currency,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 4),
              const Divider(height: 1)
            ],
          ),
        ))
            .toList(),
      ),
    );
  }

 */

  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }

  Future<void> showLoading(String message) {
    //setButton();
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 60,
            //child: Text(message),
            child: const Text("Successful!"),

          ),

          actions: [
            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text(
                "OK",
                //style: modalCancelTextStyle,
              ),
            ),
            /*
            TextButton(
              //onPressed: () => onContinuePressed(),
              onPressed: () {

              },
              child: Text(
                "CONTINUE",
                style:
                //style: modalContinueTextStyle,
              ),
            ),

             */
          ],
        );

      },

    );
  }





  Future<void> confirmCancelSubscription() async {
    //setButton();
    /*
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 60,
            child: const Text("Are you sure you want to cancel your current subscription?"),

          ),

          actions: [

            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text(
                "No",
                //style: modalCancelTextStyle,
              ),
            ),
            TextButton(
              onPressed: () => onContinuePressed(),

              //onPressed: () {
              //},
              child: const Text(
                "Yes",
                //style:
                //style: modalContinueTextStyle,
              ),
            ),


          ],
        );

      },

    );
    */
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Are you sure you want to cancel your subscription?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false), // passing false
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true), // passing true
                child: const Text('Yes'),
              ),
            ],
          );
        }).then((exit) {
      if (exit == null) return;

      if (exit) {
        // user pressed Yes button
        _inputControllerRegular.text = "Silver Plan Inactive!";

      } else {
        //_inputControllerRegular.text = "";
        //Navigator.of(context).pop();
        // user pressed No button
      }
    });


  }


  //Method for enable and disable button2
  void setButton(){
    if(isDisable){
      isDisable = false;
    }else{
      isDisable = true;
    }

  }

  clickButton() {

  }



  onContinuePressed() {
    _inputControllerRegular.text = "1";
  }


  /*
  _read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int rowId = 1;
    Word? word = await helper.queryWord(rowId);
    if (word == null) {
      print('read row $rowId: empty');
    } else {
      print('read row $rowId: ${word.word} ${word.frequency}');
    }
  }


  _save() async {
    Word word = Word();
    word.word = 'hello';
    word.frequency = 15;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(word);
    print('inserted row: $id');
  }

   */

/*
  _read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int rowId = 1;
    DatabaseHelper? plan = await helper.updateData(rowId);
    if (word == null) {
      print('read row $rowId: empty');
    } else {
      print('read row $rowId: ${word.word} ${word.frequency}');
    }
  }


  _save() async {
    Word word = Word();
    word.word = 'hello';
    word.frequency = 15;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(word);
    print('inserted row: $id');
  }

 */




}
