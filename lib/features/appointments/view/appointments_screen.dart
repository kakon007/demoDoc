import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/add_patient.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/book_appoint_for_me.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/select_appointment_widget.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:dashed_container/dashed_container.dart';

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
  bool forMe = true;
  bool addPatient = false;
  @override
  void initState() {
    super.initState();
    forMeBackColor = "#141D53";
    forMeTextColor = "#FFFFFF";
    forMe = true;
    addPatient = false;
    addPatientBackColor = "#00FFFFFF";
    addPatientTextColor = "#8389A9";
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var selectType = Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: HexColor("#E9ECFE"), borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor(forMeBackColor),
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * .4,
                child: Center(
                    child: Text(
                  "For Me",
                  style: GoogleFonts.poppins(color: HexColor(forMeTextColor)),
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
                      borderRadius: BorderRadius.circular(10)),
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
    );

    var doctorCard = Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor("#FFFFFF"),
              boxShadow: [
                BoxShadow(
                  color: HexColor("#0D1231").withOpacity(0.08),
                  spreadRadius: 10,
                  blurRadius: 15,
                  offset: Offset(0, 1), // changes position of shadow
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
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/doctor.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARDIOLOGIST",
                        style: GoogleFonts.poppins(height: 1.5,
                            color: AppTheme.appbarPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Md. Sohel Rana",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Assistant Professor",
                          style: GoogleFonts.poppins(height: 0.7 ,fontSize: 13)
                      ),
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
    );
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
              ),
              isLoggedIn==false ? Container(
                //margin: EdgeInsets.all(100.0),
                decoration: BoxDecoration(
                       shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                ),
                child: CircleAvatar(
                  backgroundImage:AssetImage("assets/images/alok.png"),radius: 15.0,),
              ) :SizedBox(),
              SizedBox(width: 10,)
            ],
            leading: IconButton(
                icon: Icon(Icons.notes),
                onPressed: () => _scaffoldKey.currentState.openDrawer())),
        drawer: Drawer(),
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
                        ? SelectAppointTime()
                        : Column(
                            children: [
                              selectType,
                              forMe == true ? BookAppointForMe() : AddPatient(),
                             // confirmBooking
                            ],
                          ),
                  ),
                ),
              ),
            ),
            doctorCard,
          ],
        ));
  }
}
