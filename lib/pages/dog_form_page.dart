import 'package:flutter/material.dart';
import 'package:pinext/common_widgets/age_slider.dart';
import 'package:pinext/common_widgets/breed_selector.dart';
import 'package:pinext/common_widgets/color_picker.dart';
import 'package:pinext/models/breed.dart';
import 'package:pinext/models/dog.dart';
import 'package:pinext/services/database_service.dart';

class DogFormPage extends StatefulWidget {
  const DogFormPage({Key? key, this.dog}) : super(key: key);
  final Dog? dog;

  @override
  _DogFormPageState createState() => _DogFormPageState();
}

class _DogFormPageState extends State<DogFormPage> {
  final TextEditingController _nameController = TextEditingController();
  static final List<Color> _colors = [
    Color(0xFF000000),
    Color(0xFFFFFFFF),
    Color(0xFF947867),
    Color(0xFFC89234),
    Color(0xFF862F07),
    Color(0xFF2F1B15),
  ];
  static final List<Breed> _breeds = [];

  final DatabaseService _databaseService = DatabaseService();

  int _selectedAge = 1;
  int _selectedColor = 0;
  int _selectedBreed = 0;

  @override
  void initState() {
    super.initState();
    if (widget.dog != null) {
      _nameController.text = widget.dog!.name;
      _selectedAge = widget.dog!.age;
      _selectedColor = _colors.indexOf(widget.dog!.color);
    }
  }

  Future<List<Breed>> _getBreeds() async {
    final breeds = await _databaseService.breeds();
    if (_breeds.length == 0) _breeds.addAll(breeds);
    if (widget.dog != null) {
      _selectedBreed = _breeds.indexWhere((e) => e.id == widget.dog!.breedId);
    }
    return _breeds;
  }

  Future<void> _onSave() async {
    //final name = _nameController.text = "Silver";
    final name = _nameController.text = "Subscription Active!";
    final age = _selectedAge;
    //const age = _selectedAge;
    final color = _colors[_selectedColor];
    final breed = _breeds[_selectedBreed];

    // Add save code here
    widget.dog == null
        ? await _databaseService.insertDog(
            Dog(name: name, age: age, color: color, breedId: breed.id!),
          )
        : await _databaseService.updateDog(
            Dog(
              id: widget.dog!.id,
              name: name,
              age: age,
              color: color,
              breedId: breed.id!,
            ),
          );

    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New User Plan Record'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            /*
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of the user plan here',
              ),
            ),
            SizedBox(height: 16.0),
            // Age Slider
            AgeSlider(
              max: 30.0,
              selectedAge: _selectedAge.toDouble(),
              onChanged: (value) {
                setState(() {
                  _selectedAge = value.toInt();
                });
              },
            ),
            SizedBox(height: 16.0),
            // Color Picker
            ColorPicker(
              colors: _colors,
              selectedIndex: _selectedColor,
              onChanged: (value) {
                setState(() {
                  _selectedColor = value;
                });
              },
            ),

             */

            SizedBox(height: 24.0),
            // Breed Selector
            FutureBuilder<List<Breed>>(
              future: _getBreeds(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading...");
                }
                return BreedSelector(
                  breeds: _breeds.map((e) => e.name).toList(),
                  selectedIndex: _selectedBreed,
                  onChanged: (value) {
                    setState(() {
                      _selectedBreed = value;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 24.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                //onPressed: _onSave,
                onPressed: () {
                  _onSave();
                  Navigator.pop(context);

                  //_onPressed();
                },
                child: Text(
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
}

class _onPressed {



}
