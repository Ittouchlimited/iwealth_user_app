import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:okra_widget/okra_widget.dart';
import 'package:okra_widget_official/okra.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pinext/app/app_data/custom_transition_page_route/custom_transition_page_route.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/screens/add_and_view_transaction/add_asset_bank_and_cash.dart';
import 'package:pinext/app/shared/widgets/custom_button.dart';

import '../app/app_data/app_constants/constants.dart';

Future<Balance> fetchBalance() async {
  final response = await http
      .get(Uri.parse('https://api.okra.ng/v2/balance/check'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Balance.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load balance');
  }
}



class Balance {
  final int accountId;
  //final int id;
  final String amount;
  ///final String url;
  //final String thumbnailUrl;

  const Balance({
    required this.accountId,
    //required this.id,
    required this.amount,
    //required this.url,
    //required this.thumbnailUrl,
  });


  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      accountId: json['accountId'] as int,
      //id: json['id'] as int,
      amount: json['amount'] as String,
      //url: json['url'] as String,
      //thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}




class OkraFetchPageOptionsBuild extends StatefulWidget {
  OkraFetchPageOptionsBuild({Key? key, required this.title, required this.amount}) : super(key: key);

  final String title;
  final String amount;
  //void main() => runApp(const OkraFetch());

  @override
  _OkraFetchPageOptionsBuildState createState() => _OkraFetchPageOptionsBuildState();
}


var banks = [
  "ecobank-nigeria",
  "fidelity-bank",
  "first-bank-of-nigeria",
  "first-city-monument-bank",
  "guaranty-trust-bank",
  "access-bank",
  "unity-bank",
  "alat",
  "polaris-bank",
  "stanbic-ibtc-bank",
  "standard-chartered-bank",
  "sterling-bank",
  "union-bank-of-nigeria",
  "united-bank-for-africa",
  "wema-bank",
  "rubies-bank",
  "kuda-bank"
];


class _OkraFetchPageOptionsBuildState extends State<OkraFetchPageOptionsBuild> {

  late Future<Balance> futureBalance;

  var banks = [
    "ecobank-nigeria",
    "fidelity-bank",
    "first-bank-of-nigeria",
    "first-city-monument-bank",
    "guaranty-trust-bank",
    "access-bank",
    "unity-bank",
    "alat",
    "polaris-bank",
    "stanbic-ibtc-bank",
    "standard-chartered-bank",
    "sterling-bank",
    "union-bank-of-nigeria",
    "united-bank-for-africa",
    "wema-bank",
    "rubies-bank",
    "kuda-bank"
  ];


  @override
  void initState() {
    super.initState();
    futureBalance = fetchBalance();
  }

  void callOkraWidget() {
    Okra.buildWithOptions(
        context,
        key: "0e90c9b5-9693-5c18-b210-7f2e963fa308",
        token: "646f0d7a68f6c7c6f69ec2dd",
        color: "#3AB795",
        products: [
          'auth','identity','balance','transactions'
        ] ,
        chargeAmount: 1000,
        chargeNote: "testing",
        chargeType: "one-time",
        chargeCurrency: "NGN",
        environment: "production",
        clientName: "clientName",
        logo: "https://dash.okra.ng/static/media/okra-logo.514fd943.png",
        limit: 3,
        currency: "NGN",
        isCorporate : false,
        connectMessage : "Which account do you want to connect with?",
        callbackUrl : "",
        redirectUrl : "",
        widgetSuccess : "Your account was successfully linked to SwipeNG",
        widgetFailed : "An unknown error occurred, please try again.",
        guarantors : {
          "status": false,
          "message": "Okra requires you to add guarantors",
          "number": 3,
        },
        filters : {
          "industry_type": "all",
          "banks": banks
        },
        onSuccess: (data) {
          print("Success");
          print(data);
        },
        onError: ( message) {
          print("error");
          print(message);
        },
        onClose: (message) {
          print("close");
          print(message);
        }
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.of(context,rootNavigator:true).pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Padding(padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),

            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /*
            ElevatedButton(
          //color: Colors.green,
            child: const Text(
              "Continue >",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              callOkraWidget();
            }),

                 */


                Text(
                  "You will now be redirected to Secure Website.\nClick 'Continue' to proceed",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),


            GetCustomButton(
              title: "Continue",
              titleColor: whiteColor,
              buttonColor: customOrangeColor,
              icon: Icons.send_sharp,
              isLoading: false,
              callBackFunction: () {

                //Call okra function her
                //callOkraWidget();
                callOkraWidget();
                Navigator.of(context,rootNavigator:true).pop(context);

                /*
                Navigator.push(
                  context,
                  CustomTransitionPageRoute(
                    childWidget: const OkraFetchBuild(),
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
          //color: Colors.green,
            child: const Text(
              "Load Balance",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              fetchBalance();
            }),

         */



                /*
            FutureBuilder<Balance>(
              future: futureBalance,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.amount,);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),

                 */
      ],

            ),
             ),
          ],

        ),



      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*
Future<List<Balance>> fetchBalance(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://api.okra.ng/v2/balance/check'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseBalance, response.body);
}

 */
/*
Future<http.Response> fetchBalance() {
  return http.get(Uri.parse('https://api.okra.ng/v2/balance/check'));
}

 */


// A function that converts a response body into a List<Photo>.
List<Balance> parseBalance(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Balance>((json) => Balance.fromJson(json)).toList();
}