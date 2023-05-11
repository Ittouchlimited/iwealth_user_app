

import 'package:flutter/material.dart';
import 'package:pinext/app/screens/platinum/addon_01.dart';
import 'package:pinext/app/screens/platinum/addon_02.dart';
import 'package:pinext/app/screens/silver/file_02.dart';

//Added on the 11052023
//10am+
//12pm+
import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/profile_controller.dart';
import 'package:pinext/main.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinext/view/profile/norrenberger_services_screen.dart';

//6pm+
//import 'package:path/path.dart' as Path;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_data/app_constants/constants.dart';
import '../../app_data/app_constants/fonts.dart';
import '../../app_data/theme_data/colors.dart';
import '../../services/handlers/user_handler.dart';
import '../../shared/widgets/custom_snackbar.dart';

const double defaultPaddingNew = 16.0;
const double defaultBorderNew = 16.0;
final Color greyColorNew = Colors.grey.shade200;
const TextStyle boldTextStyleNew = TextStyle(fontWeight: FontWeight.bold);

//Added after 12pm+
final Uri _url = Uri.parse('https://google.com');

class AddonsScreen extends StatelessWidget {
  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Addon services',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddingNew),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddonOneScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(
                  defaultPaddingNew,
                ),
                width: getWidth(context),
                decoration: BoxDecoration(
                  color: greyColorNew,
                  borderRadius: BorderRadius.circular(
                    defaultBorderNew,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Norrenberger services",
                          style: boldTextStyleNew.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "",
                          style: boldTextStyleNew.copyWith(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {


                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddonTwoScreen(),
                  ),
                );
                */

                /*
                  Get.to(
                  showAlertDialog(context)
                  );

                  */
                  showDialogTermsAndConditions(context);


              },
              child: Container(
                padding: const EdgeInsets.all(
                  defaultPaddingNew,
                ),
                width: getWidth(context),
                decoration: BoxDecoration(
                  color: greyColorNew,
                  borderRadius: BorderRadius.circular(
                    defaultBorderNew,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3rd Party services",
                          style: boldTextStyleNew.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "",
                          style: boldTextStyleNew.copyWith(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),



            /*
            GestureDetector(
              onTap: () {

                showDialog(
                  context: context,
                  builder: (BuildContext builderContext) {
                    return AlertDialog(
                      title: Text(
                        "Please select a year to view records from that year.",
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),

                    );
                  },
                );
              },

            ),
            */

          ],
        ),
      ),
    );
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - (2 * defaultPaddingNew);
  }


/*
  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Title"),
            content: new Text("This is one time dialog"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              SmallButton(text: "Dismiss", onTap:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddonTwoScreen(),
                  ),
                );
              },
              ),
         /* FlatButton(
                child: new Text("Dismiss"),
                onPressed: () {
                  // Close the dialog

                },
              ),*/
            ],
          );
        },
      );
    }
  }
*/

/*
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Hello, ${UserHandler().currentUser.username} 👋",
            style: boldTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "To continue you have to accept our terms and conditions \n"
                      "Do you wish to continue?",
                  style: regularTextStyle,
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorder),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Yes',
                style: boldTextStyle.copyWith(
                  color: customBlackColor.withOpacity(
                    .8,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Dismiss',
                style: boldTextStyle.copyWith(
                  color: customBlackColor.withOpacity(
                    .8,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          actionsPadding: dialogButtonPadding,
        );
      },
    );
  */




  /*
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title: const Text('3rd Party Services'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('You must accept our terms and conditions to continue.'),

              ],

            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: _launchUrl,
              child: const Text('Please read our terms and conditions here before you accept.'),
            ),

            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: HexColor(AppTheme.secondaryColorString!)
                  .withOpacity(0.2),
            ),

            TextButton(
              child: const Text('No, I do not accept.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: const Text('Yes, I accept.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  */


  Future<void> showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title: const Text('3rd Party Services'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('You must accept our terms and conditions to continue.'),

              ],

            ),
          ),
          actions: <Widget>[
            TextButton(

              child: const Text('Please read our terms and conditions here before you accept.'),
              onPressed: _openTermsAndConditions(context),
            ),

            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: HexColor(AppTheme.secondaryColorString!)
                  .withOpacity(0.2),
            ),

            TextButton(
              child: const Text('No, I do not accept.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: const Text('Yes, I accept.'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddonTwoScreen(),
                  ),
                );
                //AddonTwoScreen();
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showDialogTermsAndConditions(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog( // <-- SEE HERE
            title: const Text('3rd Party Services'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('You must accept our terms and conditions to continue.'),

                ],

              ),
            ),
            actions: <Widget>[



              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: IconButton(
                  icon: const Icon(
                    Icons.web_asset,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _openTermsAndConditions(context);
                    //Navigator.pop(context);
                    //Navigator.of(context).pop();
                  },
                ),
              ),


              TextButton(
                child: const Text('Terms and conditions.'),
                onPressed: () {
                  //Navigator.of(context).pop();
                },
              ),

              /*
              TextButton(

          child: Text('Please read our terms and conditions here before you accept.'),
          onPressed: _openTermsAndConditions(context),
              ),
              */

              const SizedBox(height: 20),
              Divider(
                height: 1,
                color: HexColor(AppTheme.secondaryColorString!)
                    .withOpacity(0.2),
              ),

              TextButton(
                child: const Text('No, take me back.'),
                onPressed: () {
                  //Navigator.of(context).pop();
                },
              ),

              /*
              TextButton(
                child: const Text('Yes, I accept.'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddonTwoScreen(),
                    ),
                  );
                },

              ),
              */
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();


                    //Navigator.pop(context);
                    //Navigator.of(context).pop();
                  },
                ),



              ),
              TextButton(
                child: const Text('Yes, continue'),
                onPressed: () {
                  //Navigator.of(context).pop();
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.green,
                  ),
                  onPressed: () {

                    //_openThirdPartyServices(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddonTwoScreen(),
                      ),
                    );


                    //Navigator.pop(context);

                    //Navigator.of(context).pop();
                  },
                ),



              ),

            ],

          );
        },
      );
    }
  }


  Future<void> _launchUrl() async {
    /*if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }*/
  }

  _openTermsAndConditions(BuildContext context) async {
    String url = "https://ittouch.io";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
      Navigator.of(context).pop();
    } else {
      GetCustomSnackbar(
        title: "Snap",
        message: "An error occurred! Please try again later",
        snackbarType: SnackbarType.error,
        context: context,
      );
      Navigator.of(context).pop();
    }
  }

  _openThirdPartyServices(BuildContext context) async {

    Get.to(
      const AddonTwoScreen(),
      transition: Transition.rightToLeft,
    );

      GetCustomSnackbar(
        title: "Snap",
        message: "An error occurred! Please try again later",
        snackbarType: SnackbarType.error,
        context: context,
      );

      //Navigator.of(context).pop();
    }
  }




