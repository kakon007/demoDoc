import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class BookAppointForMe extends StatefulWidget {
  @override
  _BookAppointForMeState createState() => _BookAppointForMeState();
}

class _BookAppointForMeState extends State<BookAppointForMe> {
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
  var selectedPatientType= "";
  var selectedConsultationType= "";
  String color = "#EAEBED";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickBirthDate = DateTime.now();
    selectedPatientType= "";
    selectedConsultationType= "";
  }
  String _selectedType;
  String _selectedConsultation;
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
                      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
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
              child: Padding(
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
                                                    selectedPatientType= newValue;
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
                    ),
                    spaceBetween,
                    Row(
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
                                                    selectedConsultationType= newValue;
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
                                  selectedPatientType!= "" && selectedConsultationType!= ""  ? "500" :"",
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
            ),
          ),
          confirmBooking
        ],
      ),
    );
  }
}
