import 'package:flutter/material.dart';
import 'package:pinext/app/screens/platinum/addons.dart';
import 'package:pinext/app/screens/platinum/platinum_portfolio_evaluation.dart';
import 'package:pinext/app/screens/platinum/platinum_will_preparation.dart';
import 'package:pinext/app/screens/platinum/tax_advisory_services_norrenberger_services_platinum.dart';
import 'package:pinext/app/screens/platinum/value_statement_guarantee_norrenberger_services_platinum.dart';

import '../../../view/profile/user_relationship_manager_screen.dart';
import 'inheritance_planning_norrenberger_services_platinum.dart';
import 'p_file_01.dart';
import 'p_file_02.dart';

const double defaultPaddingNew = 16.0;
const double defaultBorderNew = 16.0;
final Color greyColorNew = Colors.grey.shade200;
final TextStyle boldTextStyleNew = const TextStyle(fontWeight: FontWeight.bold);

class NorrenbergerServicesListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Norrenberger Services',
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
                    builder: (context) => const ValueStatementGuaranteeNorrenbergerServicesPlatinumScreen(),
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
                          "Value Statement Guarantee",
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
            /*
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlatinumWillPreparationScreen(),
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
            */
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => const RelationshipManagerScreen(),
                    builder: (context) => const InheritancePlanningNorrenbergerServicesPlatinumScreen(),
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
                          "Inheritance Planning",
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
                    builder: (context) => const TaxAdvisoryServicesNorrenbergerServicesPlatinumScreen(),
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
                          "Tax Advisory Services",
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
