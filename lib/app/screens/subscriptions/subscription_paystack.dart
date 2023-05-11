import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pinext/app/app_data/app_constants/fonts.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/screens/subscriptions/constants/color_constants.dart';
import 'package:pinext/app/screens/subscriptions/constants/dismension_constants.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../app_data/routing/routes.dart';

import 'package:flutter_paystack_client/flutter_paystack_client.dart';





class SubscriptionPaystackScreen extends StatefulWidget {
  const SubscriptionPaystackScreen({Key? key}) : super(key: key);




  @override
  _SubscriptionPaystackScreenState createState() => _SubscriptionPaystackScreenState();


}

class _SubscriptionPaystackScreenState extends State<SubscriptionPaystackScreen> {
  Map<String, dynamic>? paymentIntent;
  var publicKey = 'pk_test_3a99bf677ac04745f73ead80f91a79ed3a5da911';
  @override
  void initState() {
    PaystackClient.initialize(publicKey);
  }


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

        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),




    );
  }


}
