import 'package:flutter/material.dart';
import 'package:pinext/app/screens/platinum/addons.dart';

import 'p_file_01.dart';
import 'p_file_02.dart';

const double defaultPaddingNew = 16.0;
const double defaultBorderNew = 16.0;
final Color greyColorNew = Colors.grey.shade200;
final TextStyle boldTextStyleNew = TextStyle(fontWeight: FontWeight.bold);

class PlatinumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Platinum Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: IconButton(
            icon: Icon(
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
                    builder: (context) => PlatinumFilesOneScreen(),
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
                          "View users File 01 uploaded by Admin",
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
                    builder: (context) => PlatinumFilesTwoScreen(),
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
                          "View users File 02 uploaded by Admin",
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
                        "View Rep set to this user by Admin",
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddonsScreen(),
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
                          "Add-ons",
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
