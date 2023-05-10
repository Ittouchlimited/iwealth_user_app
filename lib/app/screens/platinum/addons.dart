import 'package:flutter/material.dart';
import 'package:pinext/app/screens/platinum/addon_01.dart';
import 'package:pinext/app/screens/platinum/addon_02.dart';
import 'package:pinext/app/screens/silver/file_02.dart';

const double defaultPaddingNew = 16.0;
const double defaultBorderNew = 16.0;
final Color greyColorNew = Colors.grey.shade200;
const TextStyle boldTextStyleNew = TextStyle(fontWeight: FontWeight.bold);

class AddonsScreen extends StatelessWidget {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddonTwoScreen(),
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
          ],
        ),
      ),
    );
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - (2 * defaultPaddingNew);
  }
}
