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
import 'package:uuid/uuid.dart';

import '../../app_data/app_constants/fonts.dart';
import '../../app_data/theme_data/colors.dart';
import '../../bloc/signup_cubit/signin_cubit_cubit.dart';
import 'package:pinext/app/shared/widgets/custom_button_life_checker.dart';
import '../../shared/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:pinext/services/notifi_service.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


DateTime scheduleTime = DateTime.now();

DateTime addedTime = scheduleTime.add(const Duration(seconds: 20));

late TextEditingController titleController;

var isDisable=true;

bool _isEnabled = true;


class LifeCheckerView extends StatefulWidget {
  //const LifeCheckerView({super.key, required this.title});

  const LifeCheckerView({super.key, required this.title});
   //const LifeCheckerView({Key? key, required this.title,


    /*
    this.addCardForSignUpProcess = false,
    this.isEditCardScreen = false,
    this.pinextCardModel,

     */
  //}) : super(key: key);

  final String title;
  //final String? scheduleTime;




  /*
  bool addCardForSignUpProcess;
  bool isEditCardScreen;
  PinextCardModel? pinextCardModel;

   */

  @override
  State<LifeCheckerView> createState() =>
      _LifeCheckerViewState();
}

class _LifeCheckerViewState extends State<LifeCheckerView> {




  void _toggleEnabled() {
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }

  @override
  void initState() {
    super.initState();
    //requestNotificationPermissions();
    titleController = TextEditingController();
    //titleController.text = scheduleTime.hour.minutes.inSeconds.toString();
    //titleController.text = "$scheduleTime";
    //titleController.text = scheduleTime.add(const Duration(hours: 1, minutes: 1, seconds: 1, microseconds: 1, milliseconds: 1)).toString();
    titleController.text = addedTime.toString();
    //sendFirstNotification(context);
    _cancelAllNotifications();
    _sendLocalNotification();
  }



  /*
  String? isEditCardColor;


   */
  @override
  void dispose() {

    super.dispose();
    titleController.dispose();
  }


 // final _formKey = GlobalKey<FormState>();

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
                /*
                GetCustomButton(
                  title: "Activate",
                  titleColor: whiteColor,
                  buttonColor: customBlueColor,
                  callBackFunction: () {

                  },
                ),

                 */
                    const SizedBox(
                      height: 8,
                    ),
                    /*
                    CustomTextFormField(
                      controller: titleController,
                      hintTitle: "Enter title",
                      textInputType: TextInputType.text ,
                      onChanged: (String value) {},
                      validator: (value) {
                        return InputValidation(value).isNotEmpty();
                      },
                      suffixButtonAction: () {},
                    ),

                     */
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Welcome to the Life Checker page. This feature is already active and running, and is still under development.\n \n'
                        'So the time to notify you is 20 seconds'),
                    const SizedBox(
                      height: 12,
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

clickButton() {
}

Future<void> cancelAllNotifications() async {
  //var flutterLocalNotificationsPlugin;
  //flutterLocalNotificationsPlugin.cancel(0);
  await flutterLocalNotificationsPlugin.cancelAll();
}

Future<void> sendFirstNotifications() async {
  /*
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Notification Scheduled for $scheduleTime'),
    duration: const Duration(seconds: 20),
  )
  );

   */
  //scheduleTime = titleController as DateTime;
  debugPrint('Notification Scheduled for $scheduleTime');

  NotificationService().scheduleNotification(
      title: 'Hello there!',
      //body: '$scheduleTime',
      body: 'We noticed you have not used the iWealthApp for some time now. Just checking on you.',
      //scheduledNotificationDateTime: scheduleTime
      scheduledNotificationDateTime: scheduleTime.add(const Duration(seconds: 20)));
  //scheduledNotificationDateTime =

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



class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return ElevatedButton(
      child: const Text('Schedule notifications'),
      onPressed: () {

            */


         /*
        debugPrint('Notification Scheduled for $scheduleTime');
        NotificationService().scheduleNotification(
            title: 'Hello there!',
            //body: '$scheduleTime',
            body: 'We noticed you have not used the iWealthApp for some time now. Just checking on you.',
            scheduledNotificationDateTime: scheduleTime);
      },
    );

          */




    return GetCustomButtonLifeChecker(
      title: "Activate",
      titleColor: whiteColor,
      buttonColor: customBlueColor,
      isEnabled: false,
      callBackFunction: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Notification Scheduled for $scheduleTime'),
          duration: const Duration(seconds: 5),
        )
        );
        //scheduleTime = titleController as DateTime;
        debugPrint('Notification Scheduled for $scheduleTime');

        NotificationService().scheduleNotification(
            title: 'Hello there!',
            //body: '$scheduleTime',
            body: 'We noticed you have not used the iWealthApp for some time now. Just checking on you.',
            //scheduledNotificationDateTime: scheduleTime
            scheduledNotificationDateTime: scheduleTime.add(const Duration(seconds: 20)));
            //scheduledNotificationDateTime =

      },

    );

  }


}
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





Future<void> _cancelAllNotifications() async {
  await flutterLocalNotificationsPlugin.cancelAll();
}


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


Future<void> _sendLocalNotification() async {

  //scheduleTime = titleController as DateTime;
  //debugPrint('Notification Scheduled for $scheduleTime');
  debugPrint('Notification Scheduled for $addedTime');

  NotificationService().scheduleNotification(
      title: 'Hello there!',
      //body: '$scheduleTime',
      body: 'We noticed you have not used the iWealthApp for some time now. Just checking on you.',
      //scheduledNotificationDateTime: scheduleTime);
      //scheduledNotificationDateTime: scheduleTime.add(const Duration(minutes: 2)));
      scheduledNotificationDateTime: addedTime);
  //scheduledNotificationDateTime =



}



//Method for enable and disable button2
void setButton(){
  if(isDisable){
    isDisable = false;
  }else{
    isDisable = true;
  }

}
//Method to activate button again
void enableActivateButton(){
  if(_isEnabled){
    _isEnabled = false;
  }else{
    _isEnabled = true;
  }

}

//function to send notification
void sendFirstNotification(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Notification Scheduled for $scheduleTime'),
    duration: const Duration(seconds: 20),
  )
  );
  //scheduleTime = titleController as DateTime;
  debugPrint('Notification Scheduled for $scheduleTime');

  NotificationService().scheduleNotification(
      title: 'Hello there!',
      //body: '$scheduleTime',
      body: 'We noticed you have not used the iWealthApp for some time now. Just checking on you.',
      //scheduledNotificationDateTime: scheduleTime
      scheduledNotificationDateTime: scheduleTime.add(const Duration(seconds: 20)));
  //scheduledNotificationDateTime =

}

/*
Future<void> requestNotificationPermissions() async {
  final PermissionStatus status = await Permission.notification.request();
  if (status.isGranted) {
    // Notification permissions granted
    print("Permission granted");
  } else if (status.isDenied) {
    // Notification permissions denied
  } else if (status.isPermanentlyDenied) {
    // Notification permissions permanently denied, open app settings
    await openAppSettings();
  }
}

 */


