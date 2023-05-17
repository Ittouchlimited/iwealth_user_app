import 'package:flutter/material.dart';
import 'package:pinext/app/shared/widgets/custom_button.dart';
import 'package:pinext/utils/constants.dart';
import 'package:pinext/utils/providers/provider.dart';
import 'package:pinext/view_models/theme_provider.dart';
import 'package:pinext/views/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinext/utils/providers/provider.dart';
import 'package:pinext/view_models/theme_provider.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:provider/provider.dart';

import 'app/app_data/theme_data/colors.dart';

class MarketApiStocks extends StatelessWidget {
  const MarketApiStocks({Key? key}) : super(key: key);


  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
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

          ],
        ),
      ),
    );
  }

   */



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

        const EdgeInsets.only(left: 20, right: 20);
        Column(
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

          ],
        );



    return MultiProvider(

      providers: providers,

      child: Consumer<AppProvider>(

        builder:
            (BuildContext context, AppProvider appProvider, Widget? child) {


              const EdgeInsets.only(left: 20, right: 20);
              Column(
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

                ],
              );


              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: Constants.appName,
                theme: themeData(
                  appProvider.dark ? Constants.lightTheme : Constants.darkTheme,
                ),
                home: const Home(),
              );

        }

      ),

    );

  }

}

// Apply font to our app's theme
ThemeData themeData(ThemeData theme) {
  return theme.copyWith(
    textTheme: GoogleFonts.nunitoTextTheme(
      theme.textTheme,
    ),
  );
}
