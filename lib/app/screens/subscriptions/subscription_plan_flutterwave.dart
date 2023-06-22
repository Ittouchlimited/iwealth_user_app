import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/screens/subscriptions/constants/color_constants.dart';
import 'package:pinext/app/screens/subscriptions/constants/dismension_constants.dart';
import 'package:pinext/app/shared/widgets/custom_text_field.dart';
import 'package:pinext/components/planList.dart';
import 'package:pinext/pages/breed_form_page.dart';
import 'package:pinext/pages/home_page.dart';
import 'package:pinext/pages/plans.dart';
import 'package:pinext/pages/plans_platinum.dart';
import 'package:pinext/pages/subscriptions.dart';
import 'package:pinext/view/homeScreen.dart';
import 'package:pinext/view/planTransactionDetail.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../components/recentTransList.dart';
import '../../app_data/routing/routes.dart';
import 'flutterwave_01.dart';

import 'package:pinext/components/recentTransList.dart';
import 'package:pinext/components/homeReportContainer.dart';
import 'package:pinext/components/userProfileCard.dart';
import 'package:pinext/constFiles/colors.dart';
import 'package:pinext/controller/transDetailControllerLiabilities.dart';
import 'package:pinext/controller/transactionController.dart';
import 'package:pinext/controller/transDetailController.dart';
import 'package:pinext/customWidgets/textButton.dart';
import 'package:pinext/view/transactionList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Added for category support
import 'package:pinext/components/recentTransList.dart';
import 'package:pinext/components/homeReportContainer.dart';
import 'package:pinext/components/userProfileCard.dart';
import 'package:pinext/constFiles/colors.dart';
import 'package:pinext/controller/transactionController.dart';
import 'package:pinext/controller/transDetailController.dart';
import 'package:pinext/customWidgets/textButton.dart';
import 'package:pinext/view/transactionList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Added for category support


bool isEnable = false;



class SubscriptionPlanFlutterwaveScreen extends StatefulWidget {
  const SubscriptionPlanFlutterwaveScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionPlanFlutterwaveScreenState createState() => _SubscriptionPlanFlutterwaveScreenState();

}

class _SubscriptionPlanFlutterwaveScreenState extends State<SubscriptionPlanFlutterwaveScreen> {

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
        //title: Text('Subscription Plans Flutterwave',
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



                Text('Available Plans',
                    style:
                    GoogleFonts.quicksand(color: ColorPalette.textColor)),
                /*
                RecentTransList(
                    transController: transactionController,
                    transDetailController: transactionDetailController),

                 */


                Text('',
                    style:
                    GoogleFonts.quicksand(color: ColorPalette.textColor)),
                /*
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      //Copy this
                      Navigator.pop(context);
                      //Copy this
                      /*
                      Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => FlutterwaveOne("Subscribe")
                          //MaterialPageRoute(builder: (context) => PlanTransactionDetail()



                          )
                      );

                       */
                    },
                    /*
                    onTap: () async {

                      //await makePayment();
                    },

                     */
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage('assets/images/1.png'),
                      ),
                    ),
                  ),
                ),

                 */
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      //Copy this
                      Navigator.pop(context);
                      //Copy this
                      Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => PlanList(transController: trans, transDetailController: transDetailController)
                          //This one is working
                          //MaterialPageRoute(builder: (context) => FlutterwaveOne("Subscribe")
                        //MaterialPageRoute(builder: (context) => const HomePage(),
                          //Activate this when you want to view all available subscriptions
                          //MaterialPageRoute(builder: (context) => const Subscriptions(),
                          //MaterialPageRoute(builder: (context) => PlanList(transController: PlantransController, transDetailController: transDetailController)
                          //MaterialPageRoute(builder: (context) => HomeScreen()
                          MaterialPageRoute(builder: (context) => const Plans(),

                          )
                      );
                    },
                    /*
                    onTap: () async {
                      //await monthPayment();
                    },

                     */
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
                      // await annualPayment();

                      //Copy this
                      Navigator.pop(context);
                      //Copy this
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PlansPlatinum(),
                          )
                      );
                    },
                    /*
                    onTap: () async {

                    },

                     */
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
