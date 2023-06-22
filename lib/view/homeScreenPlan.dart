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

class HomeScreenPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionController transactionController =
        Provider.of<TransactionController>(context);
    TransDetailController transactionDetailController =
    Provider.of<TransDetailController>(context);

    TransDetailControllerLiabilities transactionDetailControllerLiabilities =
    Provider.of<TransDetailControllerLiabilities>(context);

    return transactionController.fetching
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              //userData
              //UserProfileCard(),
              //balance container
              //HomeReportContainer(transactionController: transactionController),
              //recent transactions title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  /*
                  Expanded(
                      flex: 4,
                      child: Text("Recent transactions",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                  Expanded(
                    child: CustomTextButton(
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TransactionList())),
                      textStyle: TextStyle(
                          color: selectedTextButton,
                          fontWeight: FontWeight.bold),
                      text: 'See All',
                    ),
                  )
                   */

                ],
              ),

              //transaction List View
              RecentTransList(
                  transController: transactionController,
                  transDetailController: transactionDetailController),


            ],
          );
  }
}
