import 'dart:async';
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
import 'package:webview_flutter/webview_flutter.dart';

import '../../app_data/routing/routes.dart';




class SubscriptionPlanPaystackScreen extends StatefulWidget {
  const SubscriptionPlanPaystackScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionPlanPaystackScreenState createState() => _SubscriptionPlanPaystackScreenState();

}

class _SubscriptionPlanPaystackScreenState extends State<SubscriptionPlanPaystackScreen> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();



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
        title: Text('Subscription Plans Paystack',
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

      /*
      body: const Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

          ),
        ),
      ),

       */

      /*
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Builder(builder: (BuildContext context){
          return WebView(
            initialUrl: 'https://paystack.com/pay/subcri',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },
            onProgress: (int progress){
              print("progress $progress%");
            },
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context)
            },
          );
        },),
      ),

       */

    );
  }


}
