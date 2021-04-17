import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:http/http.dart' as http;
class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final List<PatientItem> patientTypeList = List<PatientItem>();
  final List<ConsultType> consultTypeList = List<ConsultType>();
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
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
      });
    }
  }

  String _selectedGender;
  String color = "#EAEBED";
  var selectedPatientType = "";
  var selectedConsultationType = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickBirthDate = DateTime.now();
    selectedPatientType = "";
    selectedConsultationType = "";
    fetchConsultType();
    fetchPatientType();
  }

  Future<PatientTypeModel> fetchPatientType() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/findPatTypeList?doctorNo=2000011";
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      PatientTypeModel data = patientTypeModelFromJson(response.body);
      setState(() {
        data.patientItem.forEach((element) {
          patientTypeList.add(element);
        });
      });
      print('Data:: ' + data.patientItem[0].patientTypeName);
      return data;
    } else {
      return null;
    }
  }

  Future<ConsultTypeModel> fetchConsultType() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/findConTypeList?doctorNo=2000011&patTypeNo=$_selectedType&companyNo=2&ogNo=2";
    var client = http.Client();
    var response = await client.get(url);

    if (response.statusCode == 200) {
      ConsultTypeModel data = consultTypeModelFromJson(response.body);
      setState(() {
        data.consultType.forEach((element) {
          consultTypeList.add(element);
        });
      });
      print('Data:: ' + data.consultType[0].name);
      return data;
    } else {
      return null;
    }
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
                  width: MediaQuery.of(context).size.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.gender,
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
                width: MediaQuery.of(context).size.width * .42,
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
                            width: 120,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  StringResources.gender,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                                items: StringResources.genderList.map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      gender,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120.0, top: 5),
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
                  width: MediaQuery.of(context).size.width * .23,
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
                width: MediaQuery.of(context).size.width * .38,
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
    var patientType = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
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
                            width: MediaQuery.of(context).size.width * .72,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  StringResources.patientTypeText,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedType = newValue;
                                    selectedPatientType = newValue;
                                    fetchConsultType();
                                  });
                                },
                                items: patientTypeList.map((patNo) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      patNo.patientTypeName,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: patNo.patientTypeNo,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 260.0, top: 5),
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
            ],
          ),
        ),
      ],
    );
    var consultationType = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
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
                            width: MediaQuery.of(context).size.width * .72,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  StringResources.consultationTypeText,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedConsultation,
                                onChanged: (newValue) {
                                  setState(() {
                                    //print(newValue);
                                    _selectedConsultation = newValue;
                                    selectedConsultationType = newValue;
                                  });
                                },
                                items: consultTypeList.map((consNo) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      consNo.name,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: consNo.no,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 260.0, top: 5),
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
            ],
          ),
        ),
      ],
    );
    var confirmBooking = Column(
      children: [
        spaceBetween,
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
        spaceBetween,
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
                    padding: const EdgeInsets.only(right: 15.0, left: 15),
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
                            gender,
                            dateOfBirth,
                          ],
                        ),
                        spaceBetween,
                        spaceBetween,
                        DashedContainer(
                          dashColor: HexColor("#E9ECFE"),
                          borderRadius: 10.0,
                          dashedLength: 10.0,
                          blankLength: 2.0,
                          child: Container(
                            height: 90.0,
                            width: MediaQuery.of(context).size.width * .5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      selectedPatientType != "" &&
                                              selectedConsultationType != ""
                                          ? "500"
                                          : "",
                                      style: GoogleFonts.poppins(
                                          color: AppTheme.appbarPrimary,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            selectedPatientType != "" &&
                                                    selectedConsultationType !=
                                                        ""
                                                ? "BDT"
                                                : "",
                                            style: GoogleFonts.poppins(
                                                color: AppTheme.appbarPrimary,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    selectedPatientType != "" &&
                                            selectedConsultationType != ""
                                        ? "Consultation Fee"
                                        : "",
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.appbarPrimary,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                        ),
                        spaceBetween,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          confirmBooking
        ],
      ),
    );
  }
}
