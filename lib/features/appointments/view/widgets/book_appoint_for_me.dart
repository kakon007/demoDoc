import 'dart:convert';

import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient__fee.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:http/http.dart' as http;
class BookAppointForMe extends StatefulWidget {
  String companyNo;
  String orgNo;
  String doctorNo;
  BookAppointForMe({this.orgNo, this.companyNo, this.doctorNo});
  @override
  _BookAppointForMeState createState() => _BookAppointForMeState();
}

class _BookAppointForMeState extends State<BookAppointForMe> {
  DateTime pickBirthDate;
  final List<PatientItem> patientTypeList = List<PatientItem>();
  final List<ConsultType> consultTypeList = List<ConsultType>();
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
  var selectedPatientType= "";
  var selectedConsultationType= "";
  String color = "#EAEBED";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPatientType();
   // fetchConsultType();
    pickBirthDate = DateTime.now();
    selectedPatientType= "";
    selectedConsultationType= "";
  }
  String _selectedType;
  String _selectedConsultation;
  Future<PatientTypeModel> fetchPatientType() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/findPatTypeList?doctorNo=2000011";
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      PatientTypeModel data = patientTypeModelFromJson(response.body) ;
      setState(() {
        data.patientItem.forEach((element) {
          patientTypeList.add(element);
        });
      });
      //print('Data:: ' + data.patientItem[0].patientTypeName);
      return data;
    }else {
      return null;
    }
  }
  Future<ConsultTypeModel> fetchConsultType(String _selectedType, String companyNo, String orgNo) async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/findConTypeList?doctorNo=2000011&patTypeNo=$_selectedType&companyNo=$companyNo&ogNo=$orgNo";
    var client = http.Client();
    var response = await client.get(url);
    consultTypeList.clear();
    if (response.statusCode == 200) {
      ConsultTypeModel data = consultTypeModelFromJson(response.body);
      setState(() {
        data.consultType.forEach((element) {
          consultTypeList.add(element);
        });
      });
      // print('Data:: ' + data.consultType[0].name);
      return data;
    } else {
      return null;
    }
  }
  Future<PatientFee> fetchFee(String companyNo, String conTypeNo, String doctorNo, String orgNo, String patTypeNo) async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/getConsultationFee";
    final http.Response response = await http.post(url,body: jsonEncode(<String, String>{
      "companyNo": companyNo,
      "conTypeNo": conTypeNo,
      "doctorNo": doctorNo,
      "ogNo": orgNo,
      "patTypeNo": patTypeNo
    }),);
    print(response.body);
    if (response.statusCode == 200) {
      PatientFee data = patientFeeFromJson(response.body);
      setState(() {
        fee = data.obj.toString();
      });
      // print('Data:: ' + data.consultType[0].name);
      return data;
    } else {
      return null;
    }
  }
  String fee;
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
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
                    padding:
                    const EdgeInsets.only(right: 15.0, left: 15),
                    child: Column(
                      children: [
                        spaceBetween,
                        Row(
                          children: [
                            GestureDetector(
                              child: Column(
                                children: [
                                  Container(
                                    height: 45.0,
                                    width: MediaQuery.of(context).size.width*.8,
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
                                                    hint: Text(StringResources.patientTypeText, style:  GoogleFonts.roboto(fontSize: 15, color: HexColor("#D2D2D2")),), // Not necessary for Option 1
                                                    value: _selectedType,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedType = newValue;
                                                        selectedPatientType= newValue;
                                                        fetchConsultType(_selectedType, widget.companyNo, widget.orgNo);
                                                      });
                                                    },
                                                    items: patientTypeList.map((patNo) {
                                                      return DropdownMenuItem(
                                                        child: Text(patNo.patientTypeName, style: GoogleFonts.roboto(fontSize: 14),),
                                                        value: patNo.patientTypeNo,
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 260.0, top: 5),
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
                        ),
                        spaceBetween,
                        Row(
                          children: [
                            GestureDetector(
                              child: Column(
                                children: [
                                  Container(
                                    height: 45.0,
                                    width: MediaQuery.of(context).size.width*.80,
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
                                                MediaQuery.of(context).size.width * .72,
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    iconSize: 0.0,
                                                    hint: Text(StringResources.consultationTypeText, style:  GoogleFonts.roboto(fontSize: 15, color: HexColor("#D2D2D2")),), // Not necessary for Option 1
                                                    value: _selectedConsultation,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        //print(newValue);
                                                        _selectedConsultation = newValue;
                                                        selectedConsultationType= newValue;
                                                        fetchFee(widget.companyNo, _selectedConsultation, widget.doctorNo, widget.orgNo, _selectedType);
                                                      });
                                                    },
                                                    items: consultTypeList.map((consNo) {
                                                      return DropdownMenuItem(
                                                        child: new Text(consNo.name, style: GoogleFonts.roboto(fontSize: 14),),
                                                        value: consNo.no,
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 260.0, top: 5),
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
                        ),
                        spaceBetween,
                        spaceBetween,
                        spaceBetween,
                        spaceBetween,
                        spaceBetween,
                        spaceBetween,
                        DashedContainer(
                          dashColor:HexColor("#E9ECFE"),
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
                                      selectedPatientType!= "" && selectedConsultationType!= ""  ? fee==null? "": fee :"",
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
                                        Text(selectedPatientType!= "" && selectedConsultationType!= ""  ? "BDT" :"",
                                            style: GoogleFonts.poppins(
                                                color: AppTheme.appbarPrimary,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    )
                                  ],
                                ),
                                Text(selectedPatientType!= "" && selectedConsultationType!= ""  ? "Consultation Fee" :"",
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.appbarPrimary,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                        ),
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
