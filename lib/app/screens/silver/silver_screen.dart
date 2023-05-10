import 'package:flutter/material.dart';
import 'package:pinext/app/screens/silver/file_02.dart';
import 'package:pinext/app/screens/silver/silver_will_preparation.dart';

import 'file_01.dart';

const double defaultPaddingNew = 16.0;
const double defaultBorderNew = 16.0;
final Color greyColorNew = Colors.grey.shade200;
const TextStyle boldTextStyleNew = TextStyle(fontWeight: FontWeight.bold);

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Silver Plan',
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
                    builder: (context) => const SilverPortfolioEvaluationScreen(),
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
                          //"View users File 01 uploaded by Admin",
                          "Portfolio Valuation",
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SilverWillPreparationScreen(),
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
                        //Image.asset(width: 5, height: 5, "assets/images/h19a.png"),
                        Text(
                          //"View users File 02 uploaded by Admin",
                          "Will Preparation",
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
            Container(
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
                        //"View Rep set to this user by Admin",
                        "Relationship Manager",
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
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - (2 * defaultPaddingNew);
  }
}
