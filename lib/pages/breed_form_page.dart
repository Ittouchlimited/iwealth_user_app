import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinext/app/screens/home/pages/home_page.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/models/breed.dart';
import 'package:pinext/services/database_service.dart';

import '../app/app_data/routing/routes.dart';

class BreedFormPage extends StatefulWidget {
  const BreedFormPage({Key? key}) : super(key: key);

  @override
  _BreedFormPageState createState() => _BreedFormPageState();

}

class _BreedFormPageState extends State<BreedFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();


  Future<void> _onSave() async {
    final name = _nameController.text = "iWealthSubscriptions";
    final description = _descController.text = "Subscribe to an iWealthSubscription and enjoy more features and services from Norrenberger";


    await _databaseService
        .insertBreed(Breed(name: name, description: description));

    //Navigator.pop(context);
    /*
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepage(),
        )
    );

     */


    Navigator.pushNamedAndRemoveUntil(
      context,
      ROUTES.getLoginRoute,
          (route) => false,
    );

  }

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

              ],
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [

                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: const [

                          SizedBox(width: 14),

                        ],
                      ),

                      const SizedBox(height: 20),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == true
                              ? HexColor(AppTheme.lightGrayString!)
                              : HexColor(AppTheme.darkGrayString!),
                          borderRadius: BorderRadius.circular(20),
                        ),


                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [

                                  //const SizedBox(width: 14),
                                  Text(
                                    "Welcome to iWealth Subscriptions",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),


                                ],
                              ),

                              const SizedBox(height: 20),

                              Text(
                                "With iWealth Subscriptions you get more from Norrenberger",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  //color: HexColor(
                                  //    AppTheme.secondaryColorString!),
                                ),
                              ),


                              SizedBox(height: 20.0),
                              SizedBox(
                                height: 40.0,
                                width: 300.0,
                                child: ElevatedButton(
                                  onPressed: _onSave,
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              /*
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text("RM Contact feature not available now"),
                                      )
                                      )
                                  );
                                },

                                child: Container(
                                  height: 0,
                                  width: Get.width,
                                  /*
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                    HexColor(AppTheme.primaryColorString!),
                                  ),

                                  child: Center(
                                    child: Text(
                                      "Send email",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                   */
                                ),
                              ),
    */
                            ],
                          ),
                        ),
                      ),



                      /*
                      const SizedBox(height: 15),
                      Container(
                        height: 256,
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppTheme.isLightTheme == true
                                  ? DefaultImages.p9
                                  : DefaultImages.darklevel,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
*/







                    ],
                  ),







                ],
              ),
            ),

















          ],
        ),
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'iWealth Subscriptions',
                style: TextStyle(
            color: Colors.black,
                  fontSize: 25,

        ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              'Welcome to iWealth Subscriptions',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,

              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              'With iWealth Subscriptions you get more from Norrenberger',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,

              ),
            ),
            SizedBox(
              height: 20,
            ),

            Text(
              'Click Continue to Proceed',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,

              ),
            ),

            /*
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of the subscription here',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description about the subscription here',
              ),
            ),

             */
            SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _onSave,
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 */
}
