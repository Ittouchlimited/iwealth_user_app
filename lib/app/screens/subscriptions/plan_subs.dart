import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/screens/subscriptions/constants/color_constants.dart';
import 'package:pinext/app/screens/subscriptions/constants/dismension_constants.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../app_data/routing/routes.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);


  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Map<String, dynamic>? paymentIntent;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(kAppbarRadius),
          ),
        ),
        backgroundColor: customBlueColor,
        title: Text('Subscription Plans',
            style: GoogleFonts.quicksand(color: ColorPalette.appbarTextColor)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Please choose a subscription plan!',
                    style:
                        GoogleFonts.quicksand(color: ColorPalette.textColor)),
                Text('',
                    style:
                        GoogleFonts.quicksand(color: ColorPalette.textColor)),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      await makePayment();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage('assets/images/1.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      await monthPayment();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage('assets/images/2.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      await annualPayment();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage('assets/images/3.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('1900', 'USD');

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Mahe',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Payment Completed Successfully!',
        );
        print("Payment Successfully");
        // Navigate to home frame and remove all previous routes
        Navigator.pushNamedAndRemoveUntil(
          context,
          ROUTES.getHomeframeRoute,
          (route) => false,
        );
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51LrmnJHVxrxbTWU0cVbfxz7mdj9GHPEpVoAkvQexYusctMn488mUZcj8CfLJ2SpDoviNPWAZ1hVHbUvU73A0nKLR00PAvjXwRH',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> monthPayment() async {
    try {
      paymentIntent = await createPaymentIntentMonth('19900', 'USD');

      var gpay = PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Mahe',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheetMonth() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Payment Completed Successfully!',
        );
        print("Payment Successfully");

        // Navigate to home frame and remove all previous routes
        Navigator.pushNamedAndRemoveUntil(
          context,
          ROUTES.getHomeframeRoute,
          (route) => false,
        );
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntentMonth(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51LrmnJHVxrxbTWU0cVbfxz7mdj9GHPEpVoAkvQexYusctMn488mUZcj8CfLJ2SpDoviNPWAZ1hVHbUvU73A0nKLR00PAvjXwRH',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> annualPayment() async {
    try {
      paymentIntent = await createPaymentIntentAnnual('49900', 'USD');

      var gpay = PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Mahe',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheetAnnual() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Payment Completed Successfully!',
        );
        print("Payment Successfully");

        // Navigate to home frame and remove all previous routes
        Navigator.pushNamedAndRemoveUntil(
          context,
          ROUTES.getHomeframeRoute,
          (route) => false,
        );
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntentAnnual(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51LrmnJHVxrxbTWU0cVbfxz7mdj9GHPEpVoAkvQexYusctMn488mUZcj8CfLJ2SpDoviNPWAZ1hVHbUvU73A0nKLR00PAvjXwRH',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
