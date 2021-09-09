import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/patient_details/view/pateint_details_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class WorklistAll extends StatefulWidget {
  String id;
  String patientName;
  String age;
  String gender;
  String bloodGroup;
  String phoneNumber;
  String consultTime;
  String consultType;
  int serial;
  int regNo;
  int doctorNo;
  String consultationId;
  String consultationTypeNo;
  var patTypeNumber;
  var appointmentNumber;
  var departmentNumber;
  var departmentName;
  var consultationNumber;
  var isPatientOut;
  var ipdFlag;
  var companyNumber;
  var consultationOut;
  WorklistAll(
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
      this.consultTime,
      this.patientName,
      this.age,
      this.gender,
      this.bloodGroup,
      this.phoneNumber,
      this.serial,
      this.consultType,
      this.regNo,
      this.doctorNo});
  @override
  _WorklistAllState createState() => _WorklistAllState();
}

class _WorklistAllState extends State<WorklistAll> {
  @override
  Widget build(BuildContext context) {
    print('constypeNo ${widget.consultType}');
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(width);
    var spaceBetween = SizedBox(
      height: 5,
    );
    return Container(
      constraints: BoxConstraints(minHeight: 130),
      margin: EdgeInsets.only(bottom: 7),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HexColor("#FFFFFF"),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 0.0, right: 0, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              height: isTablet
                  ? 100
                  : width <= 330
                      ? 50
                      : 80,
              width: isTablet
                  ? 100
                  : width <= 330
                      ? 50
                      : 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/images/dPro.png",
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
                        fontSize: isTablet
                            ? 16
                            : width <= 330
                                ? 11
                                : 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Consultation time :  ",
                        style: GoogleFonts.poppins(
                          fontSize: isTablet
                              ? 14
                              : width <= 330
                                  ? 9
                                  : 11,
                        ),
                      ),
                      Text(
                        widget.consultTime == null
                            ? "08:00 PM, 22/05/2021"
                            : DateFormat("hh:mm a, dd/MM/yyyy").format(
                                DateTime.parse(widget.consultTime).toLocal()),
                        style: GoogleFonts.poppins(
                          fontSize: isTablet
                              ? 14
                              : width <= 330
                                  ? 9
                                  : 11,
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
                        "Consultation type :  ",
                        style: GoogleFonts.poppins(
                          fontSize: isTablet
                              ? 14
                              : width <= 330
                                  ? 9
                                  : 11,
                        ),
                      ),
                      Text(
                         widget.consultTypeDesc??"",
                          // widget.consultTypeDesc!=null?      widget.consultTypeDesc :  widget.consultType == null
                          //   ? "1st Follow Up"
                          //   : widget.consultType.toString() == '1'
                          //       ? "Fresh Visit"
                          //       : widget.consultType.toString() == "2"
                          //           ? "Follow Up"
                          //           : widget.consultType.toString() == "3"
                          //               ? "2nd Follow Up"
                          //               : "Report Check",
                        style: GoogleFonts.poppins(
                          fontSize: isTablet
                              ? 14
                              : width <= 330
                                  ? 9
                                  : 11,
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
                        "Shared Documents:  ",
                        style: GoogleFonts.poppins(
                          fontSize: isTablet
                              ? 14
                              : width <= 330
                                  ? 9
                                  : 11,
                        ),
                      ),
                      Container(
                        child: Text(
                          "2 Documents, 2 reports",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: isTablet
                                  ? 14
                                  : width <= 330
                                      ? 9
                                      : 11,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PatientDetails(
                                patTypeNumber: widget.patTypeNumber,
                                //consultationOut: widget.consultationOut,
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
                                consultationTime: widget.consultTime,
                                consultType: widget.consultType,
                                regNo: widget.regNo,
                                doctorNo: widget.doctorNo,
                              )));
                    },
                    child: Container(
                      width: isTablet
                          ? width * .75
                          : width <= 330
                              ? width * .63
                              : width * .64,
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
                                minWidth: 110,
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
                                      fontSize: isTablet
                                          ? 16
                                          : width <= 330
                                              ? 12
                                              : 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
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
