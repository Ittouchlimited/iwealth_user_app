import 'package:flutter/material.dart';
import 'package:pinext/app/screens/platinum/addons.dart';
import 'package:pinext/app/screens/platinum/comprehensive_will_preparation_third_party_addon.dart';
import 'package:pinext/app/screens/platinum/executorship_and_trusteeship_third_party_addon.dart';
import 'package:pinext/app/screens/platinum/platinum_portfolio_evaluation.dart';
import 'package:pinext/app/screens/platinum/platinum_will_preparation.dart';
import 'package:pinext/app/screens/platinum/simple_will_preparation_third_party_addon.dart';

import 'p_file_01.dart';
import 'p_file_02.dart';

const double defaultPaddingNew = 16.0;
const double defaultBorderNew = 16.0;
final Color greyColorNew = Colors.grey.shade200;
final TextStyle boldTextStyleNew = const TextStyle(fontWeight: FontWeight.bold);

class ThirdPartyAddOnsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '3rd Party Addons Services',
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
                    builder: (context) => const SimpleWillPreparationThirdPartyAddOnScreen(),
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
                          "Simple Will Preparation",
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
                    builder: (context) => const ComprehensiveWillPreparationThirdPartyAddOnScreen(),
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
                          //"View users File 02 uploaded by Admin",
                          "Comprehensive Will Preparation",
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
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExecutorshipAndTrusteeshipThirdPartyAddOnScreen(),
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
                          "Executorship & Trusteeship",
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
          ],
        ),
      ),
    );
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - (2 * defaultPaddingNew);
  }
}
