import 'dart:developer';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/app_constants/domentions.dart';
import 'package:pinext/app/app_data/extensions/string_extensions.dart';
import 'package:pinext/app/bloc/add_card_cubit/add_card_cubit.dart';
import 'package:pinext/app/bloc/cards_and_balances_cubit/cards_and_balances_cubit.dart';
import 'package:pinext/app/models/pinext_card_model.dart';
import 'package:pinext/app/shared/widgets/custom_snackbar.dart';
import 'package:pinext/app/shared/widgets/pinext_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../../app_data/app_constants/fonts.dart';
import '../../app_data/theme_data/colors.dart';
import '../../bloc/signup_cubit/signin_cubit_cubit.dart';
import 'package:pinext/app/shared/widgets/custom_button_life_checker.dart';
import '../../shared/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pinext/services/notifi_service.dart';


class GeneralTermsAndConditions extends StatefulWidget {
  //const GeneralTermsAndConditions({super.key, required this.title});

  const GeneralTermsAndConditions({super.key});
   //const GeneralTermsAndConditions({Key? key, required this.title,


    /*
    this.addCardForSignUpProcess = false,
    this.isEditCardScreen = false,
    this.pinextCardModel,

     */
  //}) : super(key: key);

  //final String title;
  //final String? scheduleTime;




  /*
  bool addCardForSignUpProcess;
  bool isEditCardScreen;
  PinextCardModel? pinextCardModel;

   */

  @override
  State<GeneralTermsAndConditions> createState() =>
      _LifeCheckerViewState();
}

class _LifeCheckerViewState extends State<GeneralTermsAndConditions> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: customBlackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        //child: Form(
          //key: _formKey,
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
                    Text(
                      "Life Checker",
                      style: boldTextStyle.copyWith(
                        color: customBlackColor.withOpacity(
                          .6,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    /*
                    ElevatedButton(
                      onPressed:  (){
                        _cancelAllNotifications();
                      },
                      child: const Text('Cancel Scheduled Notifications'),
                    ),

                     */



                    /*
                    //button 1
                    ElevatedButton(
                      onPressed:  (){
                        setState((){
                          setButton();
                        });
                      },
                      child: const Text('Button 1'),
                    ),

                    // button 2
                    ElevatedButton(
                      onPressed:  isDisable
                          ? () => null : clickButton(),
                      child: const Text('Button 2'),
                    ),

                     */
                    /*
                  ElevatedButton(

                    onPressed: _isEnabled ? _toggleEnabled : null,
                    child: const Text('My Button'),

                  ),


                     */


                    //Text(),
                    //DateTime.now()
                    //const DatePickerTxt(),
                    //ActivateLifeCheckerBtn(),
                    //const ScheduleBtn(),
                    const SizedBox(
                      height: 20,
                    ),
                    /*
                    GetCustomButtonLifeChecker(
                      title: "Deactivate",
                      titleColor: whiteColor,
                      buttonColor: customBlackColor,
                      callBackFunction: () {


                        setState((){
                          setButton();
                        });
                        enableActivateButton();

                      }, isEnabled: false
                    ),


                     */
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: defaultPadding,
                    ),



                  ],
                ),
              ),





            ],
          ),
        //),
      ),
    );
  }
}

/*
class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}


class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {


    return TextButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (date) => scheduleTime = date,
          onConfirm: (date) {},
        );
      },
      
      child: const Text(
        'Select Date Time',
        style: TextStyle(color: Colors.blue),
      ),
    );

  }
}

 */


//We are starting another StatefullWidget or StatelessWidget here start
//StatefullWidget or StatelessWidget starts here


//StatefullWidget or StatelessWidget end
//You can add another StatefullWidget or StatelessWidget here start


//We are starting another StatefullWidget or StatelessWidget here start
//StatefullWidget or StatelessWidget starts here

//StatefullWidget or StatelessWidget end
//You can add another StatefullWidget or StatelessWidget here start


//We are starting another StatefullWidget or StatelessWidget here start
//StatefullWidget or StatelessWidget starts here
////
//StatefullWidget or StatelessWidget end
//You can add another StatefullWidget or StatelessWidget here start


/*
Future<void> scheduleNewNotification() async {

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1, // -1 is replaced by a random number
          channelKey: 'alerts',
          title: "Huston! The eagle has landed!",
          body:
          "A small step for a man, but a giant leap to Flutter's community!",
          bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
          largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
          //'asset://assets/images/balloons-in-sky.jpg',
          notificationLayout: NotificationLayout.BigPicture,
          payload: {
            'notificationId': '1234567890'
          }),
      actionButtons: [
        NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
        NotificationActionButton(
            key: 'DISMISS',
            label: 'Dismiss',
            actionType: ActionType.DismissAction,
            isDangerousOption: true)
      ],
      schedule: NotificationCalendar.fromDate(
          date: DateTime.now().add(const Duration(seconds: 10))));
}

 */

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



