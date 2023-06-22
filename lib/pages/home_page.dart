import 'package:flutter/material.dart';
import 'package:pinext/common_widgets/dog_builder.dart';
import 'package:pinext/common_widgets/breed_builder.dart';
import 'package:pinext/common_widgets/plan_builder.dart';
import 'package:pinext/models/breed.dart';
import 'package:pinext/models/dog.dart';
import 'package:pinext/pages/breed_form_page.dart';
import 'package:pinext/pages/dog_form_page.dart';
import 'package:pinext/services/database_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Create category at load

bool _clicked = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Dog>> _getDogs() async {
    return await _databaseService.dogs();
  }

  Future<List<Breed>> _getBreeds() async {
    return await _databaseService.breeds();
  }

  Future<void> _onDogDelete(Dog dog) async {
    await _databaseService.deleteDog(dog.id!);
    setState(() {});
  }

  Future<void> _onBreedDelete(Dog dog) async {
    await _databaseService.deleteDog(dog.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //Increase or decrease for more or less tabs
      length:2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your iWealth Plan Management'),
          backgroundColor: Colors.grey,
          centerTitle: true,
          bottom: TabBar(
            tabs: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Plans'),
              ),

              /*
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Dogs'),
              ),

               */
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Breeds'),
              ),


            ],
          ),
        ),
        body: TabBarView(
          children: [

            //First tab Experimental
            PlanBuilder(
              future: _getDogs(),
              onEdit: (value) {
                {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (_) => DogFormPage(dog: value),
                      fullscreenDialog: true,
                    ),
                  )
                      .then((_) => setState(() {}));
                }
              },
              onDelete: _onDogDelete,
            ),

            /*
            //Second tab Bakup
            DogBuilder(
              future: _getDogs(),
              onEdit: (value) {
                {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (_) => DogFormPage(dog: value),
                      fullscreenDialog: true,
                    ),
                  )
                      .then((_) => setState(() {}));
                }
              },
              onDelete: _onDogDelete,
            ),

             */
            BreedBuilder(
              future: _getBreeds(),
            ),


          ],
        ),
          backgroundColor: Colors.grey,

          //Subscription verification end

        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => BreedFormPage(),
                    fullscreenDialog: true,
                  ),
                )
                    .then((_) => setState(() {}));
              },
              heroTag: 'addBreed',
              child: FaIcon(FontAwesomeIcons.plus),
            ),

            SizedBox(height: 12.0),
            FloatingActionButton(
              /*
              onPressed: _clicked
                  ? null
                  : () {
                setState(() => _clicked = true); // set it to true now
              },

               */
              onPressed: () {


                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => DogFormPage(),
                    fullscreenDialog: true,
                  ),
                )
                    .then((_) => setState(() {}));


              },
              heroTag: 'addDog',
              child: FaIcon(FontAwesomeIcons.paw),
            ),



          ],
        ),
      ),
    );
  }
}
