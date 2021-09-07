import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/patient_details/view/pateint_details_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class TodayWorkList extends StatefulWidget {
  String id;
  String patientName;
  String appointmentTime;
  String appointType;
  String age;
  String gender;
  String bloodGroup;
  String phoneNumber;
  int serial;
  int regNo;
  int doctorNo;
  String consultationId;
  var consultationTypeNo;
  var patTypeNumber;
  var appointmentNumber;
  var departmentNumber;
  var departmentName;
  var consultationNumber;
  var isPatientOut;
  var ipdFlag;
  var companyNumber;
  var consultationOut;

  TodayWorkList(
      {this.consultationOut,
        this.appointmentNumber,
      this.companyNumber,
      this.consultationNumber,
      this.consultationTypeNo,
      this.departmentName,
      this.departmentNumber,
      this.ipdFlag,
      this.isPatientOut,
      this.patTypeNumber,
      this.consultationId,
      this.id,
      this.patientName,
      this.appointmentTime,
      this.appointType,
      this.age,
      this.gender,
      this.bloodGroup,
      this.doctorNo,
      this.regNo,
      this.serial,
      this.phoneNumber});

  @override
  _TodayWorkListState createState() => _TodayWorkListState();
}

class _TodayWorkListState extends State<TodayWorkList> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 5,
    );
    print(widget.appointType);
    return Container(
      constraints: BoxConstraints(minHeight: 130),
      margin: EdgeInsets.only(bottom: 7),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HexColor("#FFFFFF"),
        // boxShadow: [
        //   BoxShadow(
        //     color:
        //     HexColor("#0D1231").withOpacity(0.08),
        //     spreadRadius: 3,
        //     blurRadius: 2,
        //     offset: Offset(
        //         0, 1), // changes position of shadow
        //   ),
        // ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              height: width <= 330 ? 60 : 80,
              width: width <= 330 ? 60 : 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/images/doc.png",
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.patientName == null ? "" : widget.patientName,
                    style: GoogleFonts.poppins(
                        fontSize: width <= 330 ? 12 : 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Consultation time :   ",
                        style: GoogleFonts.poppins(
                          fontSize: width <= 330 ? 10 : 12,
                        ),
                      ),
                      Text(
                        widget.appointmentTime == null
                            ? "08:00 PM, 22/05/2021"
                            : DateFormat("hh:mm a, dd/MM/yyyy").format(
                                DateTime.parse(widget.appointmentTime)
                                    .toLocal()),
                        style: GoogleFonts.poppins(
                          fontSize: width <= 330 ? 10 : 12,
                          fontWeight: FontWeight.w600,
                          color: HexColor("#FFB14A"),
                        ),
                      ),
                    ],
                  ),
                  spaceBetween,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Consultation type :   ",
                        style: GoogleFonts.poppins(
                          fontSize: width <= 330 ? 10 : 12,
                        ),
                      ),
                      Text(
                        widget.appointType == null
                            ? "1st Follow Up"
                            : widget.appointType == '1'
                                ? "Fresh Visit"
                                : widget.appointType == "2"
                                    ? "Follow Up"
                                    : widget.appointType == "3"
                                        ? "2nd Follow Up"
                                        : "Report Check",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  spaceBetween,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Shared Documents:   ",
                        style: GoogleFonts.poppins(
                          fontSize: width <= 330 ? 10 : 12,
                        ),
                      ),
                      Container(
                        child: Text(
                          "2 Documents,2 reports",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: width <= 330 ? 10 : 12,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PatientDetails(
                            patTypeNumber: widget.patTypeNumber,
                                isPatientOut: widget.isPatientOut,
                                ipdFlag: widget.ipdFlag,
                                departmentNumber: widget.departmentNumber,
                                departmentName: widget.departmentName,
                                consultationTypeNo: widget.consultationTypeNo,
                                consultationNumber: widget.consultationNumber,
                                companyNumber: widget.companyNumber,
                                appointmentNumber: widget.appointmentNumber,
                                consultationId: widget.consultationId,
                                id: widget.id,
                                name: widget.patientName,
                                gender: widget.gender,
                                serial: widget.serial,
                                phoneNumber: widget.phoneNumber,
                                bloodGroup: widget.bloodGroup,
                                age: widget.age,
                                consultationTime: widget.appointmentTime,
                                consultType: widget.appointType,
                                regNo: widget.regNo,
                                doctorNo: widget.doctorNo,
                           // consultationOut: widget.consultationOut,
                              )));
                    },
                    child: Container(
                      width: width <= 330 ? width * .68 : width * .7,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 0,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                minWidth: 90,
                              ),
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.buttonActiveColor),
                              //color: HexColor("#107B3E"),
                              child: Center(
                                child: Text(
                                  "View Details",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              //color: AppTheme.buttonActiveColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
