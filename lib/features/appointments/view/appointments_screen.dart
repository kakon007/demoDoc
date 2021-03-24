import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/view/availableslots_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoggedIn = false;
  String forMeBackColor = "#141D53";
  String forMeTextColor = "#FFFFFF";
  String addPatientBackColor = "#00FFFFFF";
  String addPatientTextColor = "#8389A9";
  DateTime pickedDate;
  bool forMe = true;
  bool addPatient = false;
  String _selectedType;
  String _selectedConsultation;
  bool value = false;
  String _dropDownValue;
  List<String> selectedList;
  String selectedDuration;
  String abc = "#EAEBED";
  DateTime pickedDate2;
  BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(25), topRight: Radius.circular(25));

// Option 2
  String _selectedGender;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime(2003),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null && date != pickedDate) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  Future<Null> selectDate2(BuildContext context) async {
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

    if (date != null && date != pickedDate2) {
      setState(() {
        pickedDate2 = date;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
    pickedDate2 = DateTime.now();
    forMeBackColor = "#141D53";
    forMeTextColor = "#FFFFFF";
    forMe = true;
    addPatient = false;
    addPatientBackColor = "#00FFFFFF";
    addPatientTextColor = "#8389A9";
  }

  List<AvailableSlotsModel> slots = [
    AvailableSlotsModel(
      serialNumber: "1",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "2",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "3",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "4",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "5",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "6",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "7",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
    AvailableSlotsModel(
      serialNumber: "10",
      time: "06.30 am",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    selectedList = StringResources.genderList;
    var height = MediaQuery.of(context).size.height;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );

    double _crossAxisSpacing = 8, _mainAxisSpacing = 10, _aspectRatio = .5;
    int _crossAxisCount = 4;
    String _formatDate = DateFormat("dd/MM/yyyy").format(pickedDate);
    print(_formatDate);
    var date = Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20.0,
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Text("Select Date",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#D6DCFF")),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$_formatDate",
                        style: GoogleFonts.poppins(
                            color: AppTheme.signInSignUpColor, fontSize: 13.0),
                      ),
                      Container(
                          height: 18,
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: AppTheme.appbarPrimary,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            selectDate(context);
          },
        ),
      ],
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
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    border: Border.all(color: HexColor(abc)),
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
    String _formatDate2 = DateFormat("dd/MM/yyyy").format(pickedDate);
    var date2 = Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    border: Border.all(color: HexColor(abc)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        pickedDate2 == DateTime.now()
                            ? "Date of birth"
                            : "$_formatDate2",
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
            selectDate(context);
          },
        ),
      ],
    );

    var selectType = Expanded(
        child: Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 65.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: HexColor("#F1F9FF"),
              borderRadius: BorderRadius.circular(23)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor(forMeBackColor),
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * .4,
                    child: Center(
                        child: Text(
                      "For Me",
                      style:
                          GoogleFonts.poppins(color: HexColor(forMeTextColor)),
                    )),
                  ),
                  onTap: () {
                    setState(() {
                      if (addPatient == true) {
                        forMe = true;
                        addPatient = false;
                      } else {
                        forMe = true;
                      }
                      if (addPatient == false) {
                        addPatientBackColor = "#00FFFFFF";
                        addPatientTextColor = "#8389A9";
                        forMeBackColor = "#141D53";
                        forMeTextColor = "#FFFFFF";
                      }
                    });
                  },
                ),
                InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexColor(addPatientBackColor),
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Center(
                          child: Text(
                        "Add patient",
                        style: GoogleFonts.poppins(
                            color: HexColor(addPatientTextColor)),
                      ))),
                  onTap: () {
                    setState(() {
                      if (forMe == true) {
                        forMe = false;
                        addPatient = true;
                      } else {
                        addPatient = true;
                      }
                      if (forMe == false) {
                        forMeBackColor = "#00FFFFFF";
                        forMeTextColor = "#8389A9";
                        addPatientBackColor = "#141D53";
                        addPatientTextColor = "#FFFFFF";
                      }
                    });
                  },
                )
              ],
            ),
          ),
        ),
        (forMe == true) ? Expanded(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      spaceBetween,
                      Column(
                        children: [
                          spaceBetween,
                          Container(
                            height: 45.0,
                            width: MediaQuery.of(context).size.width * .89,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: HexColor("#354391")),
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
                                        MediaQuery.of(context).size.width * .8,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            iconSize: 0.0,
                                            hint: Text(
                                              StringResources.patientTypeText,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  color: HexColor("#D2D2D2")),
                                            ),
                                            // Not necessary for Option 1
                                            value: _selectedType,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedType = newValue;
                                              });
                                            },
                                            items: StringResources.patientType
                                                .map((gender) {
                                              return DropdownMenuItem(
                                                child: new Text(
                                                  gender,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14),
                                                ),
                                                value: gender,
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width *
                                              .8,
                                          top: 5),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: HexColor("#D2D2D2"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 45.0,
                            width: MediaQuery.of(context).size.width * .89,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: HexColor("#354391")),
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
                                        MediaQuery.of(context).size.width * .8,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            iconSize: 0.0,
                                            hint: Text(
                                              StringResources.consultationTypeText,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  color: HexColor("#D2D2D2")),
                                            ),
                                            // Not necessary for Option 1
                                            value: _selectedConsultation,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedConsultation = newValue;
                                              });
                                            },
                                            items: StringResources.consultationType
                                                .map((gender) {
                                              return DropdownMenuItem(
                                                child: new Text(
                                                  gender,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14),
                                                ),
                                                value: gender,
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width *
                                              .8,
                                          top: 5),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: HexColor("#D2D2D2"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                            ],
                          ),
                          spaceBetween,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 90.0,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor("#354391")),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "500",
                                style: GoogleFonts.poppins(
                                    color: AppTheme.appbarPrimary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("BDT",
                                      style: GoogleFonts.poppins(
                                          color: AppTheme.appbarPrimary,
                                          fontWeight: FontWeight.w500))
                                ],
                              )
                            ],
                          ),
                          Text("Consultation Fee",
                              style: GoogleFonts.poppins(
                                  color: AppTheme.appbarPrimary,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    child: Container(
                      child: Material(
                        child: Container(
                          child: Center(
                              child: Text(
                                "Confirm Booking",
                                style: GoogleFonts.poppins(color: Colors.white),
                              )),
                          height: 45.0,
                          width: MediaQuery.of(context).size.width * .89,
                          decoration: BoxDecoration(
                              color: AppTheme.appbarPrimary,
                              border: Border.all(color: HexColor("#354391")),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
            // ? Column(
            //     children: [
            //       Column(
            //         children: [
            //           SizedBox(
            //             height: 30,
            //           ),
            //           Container(
            //             height: 45.0,
            //             width: MediaQuery.of(context).size.width * .89,
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 border: Border.all(color: HexColor("#354391")),
            //                 borderRadius: BorderRadius.circular(10)),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Stack(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 15.0),
            //                       child: Container(
            //                         width:
            //                             MediaQuery.of(context).size.width * .8,
            //                         child: DropdownButtonHideUnderline(
            //                           child: DropdownButton(
            //                             iconSize: 0.0,
            //                             hint: Text(
            //                               StringResources.patientTypeText,
            //                               style: GoogleFonts.roboto(
            //                                   fontSize: 15,
            //                                   color: HexColor("#D2D2D2")),
            //                             ),
            //                             // Not necessary for Option 1
            //                             value: _selectedType,
            //                             onChanged: (newValue) {
            //                               setState(() {
            //                                 _selectedType = newValue;
            //                               });
            //                             },
            //                             items: StringResources.patientType
            //                                 .map((gender) {
            //                               return DropdownMenuItem(
            //                                 child: new Text(
            //                                   gender,
            //                                   style: GoogleFonts.roboto(
            //                                       fontSize: 14),
            //                                 ),
            //                                 value: gender,
            //                               );
            //                             }).toList(),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: EdgeInsets.only(
            //                           left: MediaQuery.of(context).size.width *
            //                               .8,
            //                           top: 5),
            //                       child: Icon(
            //                         Icons.keyboard_arrow_down_sharp,
            //                         color: HexColor("#D2D2D2"),
            //                       ),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Container(
            //             height: 45.0,
            //             width: MediaQuery.of(context).size.width * .89,
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 border: Border.all(color: HexColor("#354391")),
            //                 borderRadius: BorderRadius.circular(10)),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Stack(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 15.0),
            //                       child: Container(
            //                         width:
            //                             MediaQuery.of(context).size.width * .8,
            //                         child: DropdownButtonHideUnderline(
            //                           child: DropdownButton(
            //                             iconSize: 0.0,
            //                             hint: Text(
            //                               StringResources.consultationTypeText,
            //                               style: GoogleFonts.roboto(
            //                                   fontSize: 15,
            //                                   color: HexColor("#D2D2D2")),
            //                             ),
            //                             // Not necessary for Option 1
            //                             value: _selectedConsultation,
            //                             onChanged: (newValue) {
            //                               setState(() {
            //                                 _selectedConsultation = newValue;
            //                               });
            //                             },
            //                             items: StringResources.consultationType
            //                                 .map((gender) {
            //                               return DropdownMenuItem(
            //                                 child: new Text(
            //                                   gender,
            //                                   style: GoogleFonts.roboto(
            //                                       fontSize: 14),
            //                                 ),
            //                                 value: gender,
            //                               );
            //                             }).toList(),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: EdgeInsets.only(
            //                           left: MediaQuery.of(context).size.width *
            //                               .8,
            //                           top: 5),
            //                       child: Icon(
            //                         Icons.keyboard_arrow_down_sharp,
            //                         color: HexColor("#D2D2D2"),
            //                       ),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             height: 30,
            //           ),
            //           Container(
            //             height: 150.0,
            //             width: MediaQuery.of(context).size.width * .5,
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 border: Border.all(color: HexColor("#354391")),
            //                 borderRadius: BorderRadius.circular(10)),
            //             child: Padding(
            //               padding: const EdgeInsets.only(top: 40.0),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Text(
            //                         "500",
            //                         style: GoogleFonts.poppins(
            //                             color: AppTheme.appbarPrimary,
            //                             fontSize: 30,
            //                             fontWeight: FontWeight.w500),
            //                       ),
            //                       Column(
            //                         children: [
            //                           SizedBox(
            //                             height: 10,
            //                           ),
            //                           Text("BDT",
            //                               style: GoogleFonts.poppins(
            //                                   color: AppTheme.appbarPrimary,
            //                                   fontWeight: FontWeight.w500))
            //                         ],
            //                       )
            //                     ],
            //                   ),
            //                   Text("Consultation Fee",
            //                       style: GoogleFonts.poppins(
            //                           color: AppTheme.appbarPrimary,
            //                           fontWeight: FontWeight.w500))
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       GestureDetector(
            //         child: Container(
            //           child: Material(
            //             child: Container(
            //               child: Center(
            //                   child: Text(
            //                 "Confirm Booking",
            //                 style: GoogleFonts.poppins(color: Colors.white),
            //               )),
            //               height: 45.0,
            //               width: MediaQuery.of(context).size.width * .89,
            //               decoration: BoxDecoration(
            //                   color: AppTheme.appbarPrimary,
            //                   border: Border.all(color: HexColor("#354391")),
            //                   borderRadius: BorderRadius.circular(10)),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   )
            : Expanded(
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
                                    gender, date2,

                                  ],)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 90.0,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: HexColor("#354391")),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "500",
                                      style: GoogleFonts.poppins(
                                          color: AppTheme.appbarPrimary,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("BDT",
                                            style: GoogleFonts.poppins(
                                                color: AppTheme.appbarPrimary,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    )
                                  ],
                                ),
                                Text("Consultation Fee",
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.appbarPrimary,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        GestureDetector(
                          child: Container(
                            child: Material(
                              child: Container(
                                child: Center(
                                    child: Text(
                                      "Confirm Booking",
                                      style: GoogleFonts.poppins(color: Colors.white),
                                    )),
                                height: 45.0,
                                width: MediaQuery.of(context).size.width * .89,
                                decoration: BoxDecoration(
                                    color: AppTheme.appbarPrimary,
                                    border: Border.all(color: HexColor("#354391")),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ]),
    ));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        //key: _scaffoldKey,
        appBar: new AppBar(
            title: new Text(
              "Book your appointment",
              style: GoogleFonts.poppins(fontSize: 15),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isLoggedIn == true ? isLoggedIn = false : isLoggedIn = true;
                  });
                },
              )
            ],
            leading: new IconButton(
                icon: new Icon(Icons.notes),
                onPressed: () => _scaffoldKey.currentState.openDrawer())),
        drawer: new Drawer(),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: HexColor("#FFFFFF"),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("#0D1231").withOpacity(0.08),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 60),
                    child: isLoggedIn == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              date,
                              SizedBox(
                                height: 20,
                              ),
                              Text("Available Slots",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: slots.length,
                                itemBuilder: (context, index) => Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            stops: [
                                              1.0,
                                              1.0
                                            ],
                                            colors: [
                                              HexColor('#8592E5'),
                                              HexColor('#F6F8FB'),
                                            ]),
                                        border: Border.all(
                                          color: HexColor("#8592E5"),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height <= 800
                                                    ? height / 110
                                                    : height / 65.09),
                                            child: Center(
                                                child: Text(
                                              "Serial - " +
                                                  slots[index].serialNumber,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme
                                                      .signInSignUpColor),
                                            )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height <= 800
                                                    ? height / 100
                                                    : height / 56),
                                            child: Center(
                                                child: Text(
                                              "Time : " + slots[index].time,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: _crossAxisCount,
                                  crossAxisSpacing: _crossAxisSpacing,
                                  mainAxisSpacing: _mainAxisSpacing,
                                  childAspectRatio: _aspectRatio,
                                ),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  color: AppTheme.appbarPrimary,
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  child: Text(
                                    "Proceed",
                                    style: GoogleFonts.poppins(
                                        fontSize: height <= 600 ? 8 : 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              selectType,
                            ],
                          ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("#FFFFFF"),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("#0D1231").withOpacity(0.08),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              child: Image.asset(
                                "assets/images/doctor.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CARDIOLOGIST",
                                style: GoogleFonts.poppins(
                                    color: AppTheme.appbarPrimary,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Md. Sohel Rana",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text("Assistant Professor",
                                  style: GoogleFonts.poppins(fontSize: 13)),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Fee: 200 - 700 BDT",
                                style: GoogleFonts.poppins(
                                  color: AppTheme.appbarPrimary,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
