// ignore_for_file: deprecated_member_use

import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';

class RelationshipManagerScreen extends StatefulWidget {
  const RelationshipManagerScreen({super.key});

  @override
  State<RelationshipManagerScreen> createState() => _RelationshipManagerScreenState();
}

class _RelationshipManagerScreenState extends State<RelationshipManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackIcon(),
                Text(
                  "Relationship Manager",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(
                  height: 24,
                  width: 24,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Your relationship manager",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Name:"" " "Jane Doe",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),const SizedBox(height: 30),
                      Text(
                        "Email:"" " "jane@doe.com",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),/*const SizedBox(height: 30),
                      Text(
                        "Mobile:",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),*/
                      /*CustomTextField(
                        hintText: "Promo code",
                        prefix: null,
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                      )*/
                    ],
                  )
                ],
              ),
            ),
            /*
            CustomButton(
              text: "Call Now",
              onTap: () {
                Navigator.pop(context);
              },
            ),*/
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
