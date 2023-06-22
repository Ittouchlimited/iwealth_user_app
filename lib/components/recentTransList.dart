import 'package:pinext/constFiles/colors.dart';
import 'package:pinext/constFiles/dateConvert.dart';
import 'package:pinext/constFiles/strings.dart';
import 'package:pinext/controller/transDetailController.dart';
import 'package:pinext/controller/transDetailControllerLiabilities.dart';
import 'package:pinext/controller/transactionController.dart';
import 'package:pinext/model/PlanTransactionModel.dart';
import 'package:pinext/model/transactionModel.dart';
import 'package:pinext/view/transactionDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentTransList extends StatelessWidget {
  const RecentTransList({
    Key? key,
    required this.transController,
    required this.transDetailController, //required this.transDetailControllerLiabilities,
  }) : super(key: key);

  final TransactionController transController;
  final TransDetailController transDetailController;
  //final TransDetailControllerLiabilities transDetailControllerLiabilities;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: transController.planTransactionList.length == 0
          ? Center(child: Text("No Records"))
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                if (transController.planTransactionList.length > index) {
                  PlanTransactionModel? data =
                      transController.planTransactionList[index];

                  String amountSign = data!.plan == 1 ? "+" : "-";

                  return ListTile(
                    onTap: () {
                      transDetailController.toTransactionDetail(
                          isSaved: true,
                          id: data.id,
                          title: data.plan,
                          description: data.planStartDateTime,
                          dateTime: data.planEndDateTime);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TransactionDetail()),
                      );
                    },
                    title: Text(data.plan ?? ""),
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: Container(
                      height: 50.0,
                      width: 50.0,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [BoxShadow(color: blackColor)],
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      /*
                      child: SvgPicture.asset(
                        transController.tileIcon(data.category ?? others),
                        height: 35.0,
                        color: svgColor,
                      ),

                       */
                    ),
                    subtitle: Text(dateConverter(DateTime.parse(
                        data.planStartDateTime ?? "2000-01-1 00:00:00.000"))),
                    trailing: Text(dateConverter(DateTime.parse(
                        data.planEndDateTime ?? "2000-01-1 00:00:00.000"))
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
    );
  }
}
