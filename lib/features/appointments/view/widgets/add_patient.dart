import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

import 'book_appoint_for_me.dart';
class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  DateTime pickBirthDate;
  Future<Null> selectBirthDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.appbarPrimary,
            accentColor: AppTheme.appbarPrimary,
            colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 6)),
    );

    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
      });
    }
  }
  String _selectedGender;
  String color = "#EAEBED";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickBirthDate = DateTime.now();
  }
  String _selectedType;
  String _selectedConsultation;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var name = SignUpFormField(
      margin: EdgeInsets.all(2),
      labelText: "Name",
      isRequired: true,
      hintText: StringResources.name,
    );
    var email = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Email",
      hintText: StringResources.email,
    );
    var mobile = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Mobile",
      hintText: StringResources.mobileNumber,
    );
    var password = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Password",
      hintText: StringResources.password,
    );
    var confirmPassword = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Confirm Password",
      hintText: StringResources.confirmPassword,
    );
    var address = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Address",
      hintText: StringResources.address,
    );
    var gender = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width*.4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.gender,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style:
                          GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width*.42,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 145,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(StringResources.gender, style:  GoogleFonts.roboto(fontSize: 15, color: HexColor("#D2D2D2")),), // Not necessary for Option 1
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                                items: StringResources.genderList.map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(gender, style: GoogleFonts.roboto(fontSize: 14),),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120.0, top: 5),
                          child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#D2D2D2"),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    String formatBirthDate = DateFormat("dd/MM/yyyy").format(pickBirthDate);
    var dateOfBirth = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width*.2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.dateOfBirth,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width*.38,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        pickBirthDate == DateTime.now()
                            ? "Date of birth"
                            : "$formatBirthDate",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 18,
                          child:
                          Image.asset("assets/images/calender_icon.png")),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            selectBirthDate(context);
          },
        ),
      ],
    );
    var patientType=  Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width*.82,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .77,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(StringResources.patientTypeText, style:  GoogleFonts.roboto(fontSize: 15, color: HexColor("#D2D2D2")),), // Not necessary for Option 1
                                value: _selectedType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedType = newValue;
                                  });
                                },
                                items: StringResources.patientType.map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(gender, style: GoogleFonts.roboto(fontSize: 14),),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 280.0, top: 5),
                          child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#D2D2D2"),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    var consultationType= Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width*.82,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width:
                            MediaQuery.of(context).size.width * .77,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(StringResources.consultationTypeText, style:  GoogleFonts.roboto(fontSize: 15, color: HexColor("#D2D2D2")),), // Not necessary for Option 1
                                value: _selectedConsultation,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedConsultation = newValue;
                                  });
                                },
                                items: StringResources.consultationType.map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(gender, style: GoogleFonts.roboto(fontSize: 14),),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 280.0, top: 5),
                          child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#D2D2D2"),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  spaceBetween,
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 15.0, left: 15),
                    child: Column(
                      children: [
                        spaceBetween,
                        patientType,
                        spaceBetween,
                        consultationType,
                        spaceBetween,
                        name,
                        email,
                        mobile,
                        password,
                        confirmPassword,
                        address,
                        spaceBetween,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            gender, dateOfBirth,

                          ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
