// ignore_for_file: deprecated_member_use

import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/authentication_screen.dart';
import 'package:pinext/view/auth/verification_screen.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinext/widget/image_picker_widget.dart';

class SafetyBoxScreen extends StatefulWidget {
  const SafetyBoxScreen({super.key});

  @override
  State<SafetyBoxScreen> createState() => _SafetyBoxScreenState();
}

class _SafetyBoxScreenState extends State<SafetyBoxScreen> {


  final List<String> incomerangeItems = [
    '100-1000',
    '2000-5000',
  ];
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  List<String> selectedItems = [];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            const BackIcon(),
            const SizedBox(height: 30),
            Text(
              "Safety Deposit Box",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "You can save your files here.",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: HexColor(AppTheme.secondaryColorString!),
                    height: 1.6,
                  ),
            ),
/*
            const SizedBox(height: 10),
            const CustomTextField(
              hintText: "Your Address",
              prefix: null,
              sufix: SizedBox(),
              //textEditingController:
              //TextEditingController(text: "982806"),
              //inputType: TextInputType.number,
              //isObsecure: false,
            ),

*/



            /*const SizedBox(height: 20),
            CustomTextField(
              hintText: "Mobile number",
              prefix: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      CountryPickerDropdown(
                        initialValue: 'IN',
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: HexColor(AppTheme.secondaryColorString!),
                          size: 20,
                        ),
                        itemBuilder: (Country country) => Container(
                          height: 26,
                          width: 26,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                            CountryPickerUtils.getDefaultFlagImage(country),
                          ),
                        ),
                        sortComparator: (Country a, Country b) =>
                            a.isoCode.compareTo(b.isoCode),
                        onValuePicked: (Country country) {
                          debugPrint(country.name);
                        },
                      ),


                      const SizedBox(width: 10),
                      Container(
                        height: 26,
                        width: 1.2,
                        color: HexColor(AppTheme.secondaryColorString!),
                      ),
                    ],
                  ),
                ),
              ),
              sufix: const SizedBox(),
              textEditingController: TextEditingController(),
              inputType: TextInputType.emailAddress,
              isObsecure: false,
            ),
            const Expanded(child: SizedBox()), */


            /*const SizedBox(height: 20),
            const CustomTextField(
              hintText: "Your Income Range",
              prefix: null,
              sufix: SizedBox(),
              //textEditingController:
              //TextEditingController(text: "982806"),
              //inputType: TextInputType.number,
              //isObsecure: false,
            ),*/
            /*const SizedBox(height: 20),
            CustomTextField(
              hintText: "Your Income Range",
              prefix: null,
              sufix: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).textTheme.bodyText1!.color,
                size: 20,
              ),
              textEditingController:
              TextEditingController(text: "Your Income Range"),
              inputType: TextInputType.number,
              isObsecure: false,
            ),*/

            /*const SizedBox(height: 30),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Select Items',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    //disable default onTap to avoid closing menu when selecting an item
                    enabled: false,
                    child: StatefulBuilder(
                      builder: (context, menuSetState) {
                        final _isSelected = selectedItems.contains(item);
                        return InkWell(
                          onTap: () {
                            _isSelected
                                ? selectedItems.remove(item)
                                : selectedItems.add(item);
                            //This rebuilds the StatefulWidget to update the button's text
                            setState(() {});
                            //This rebuilds the dropdownMenu Widget to update the check mark
                            menuSetState(() {});
                          },
                          child: Container(
                            height: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                _isSelected
                                    ? const Icon(Icons.check_box_outlined)
                                    : const Icon(Icons.check_box_outline_blank),
                                const SizedBox(width: 16),
                                Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
                //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (value) {},
                selectedItemBuilder: (context) {
                  return items.map(
                        (item) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          selectedItems.join(', '),
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),*/
            const SizedBox(height: 30),
            /*Text(
              "Income range",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: HexColor(AppTheme.secondaryColorString!),
                height: 1.6,
              ),
            ),*/

            //const SizedBox(height: 50),
            Text(
              "File 01",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: HexColor(AppTheme.secondaryColorString!),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: const [
                //This is the widget I am talking about
                ImagePickerWidget()
              ],
            ),



            const SizedBox(height: 30),
            Text(
              "File 01",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: HexColor(AppTheme.secondaryColorString!),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: const [
                //This is the widget I am talking about
                ImagePickerWidget()
              ],
            ),





            const Expanded(child: SizedBox()),
            CustomButton(
              text: "Save",
              /*onTap: () {
                /*if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }*/

                Get.to(
                  const AuthenticationScreen(),
                  transition: Transition.rightToLeft,
                );
              },*/

              onTap: () {
                Get.to(
                  const VerificationScreen(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
