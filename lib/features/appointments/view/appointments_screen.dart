import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/add_patient.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/book_appoint_for_me.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppointmentScreen extends StatefulWidget {
  String specialist;
  String name;
  String designation;
  String fee;
  String doctorNo;
  String companyNo;
  String orgNo;
  bool ok=false;
  AppointmentScreen({this.name, this.designation, this.fee, this.specialist, this.companyNo, this.doctorNo, this.orgNo, this.ok});
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}
class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime pickedAppointDate;
  DateTime pickedAppointDate2;
  Future<Null> selectAppointDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedAppointDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (date != null && date != pickedAppointDate) {
      setState(() {
        pickedAppointDate = date;
      });
    }
  }
  int selectedCard = -1;
  var slotNo;
  bool isLoading = false;
  bool isOk;
  double _crossAxisSpacing = 4, _mainAxisSpacing = 8, _aspectRatio = .5;
  int _crossAxisCount = 4;
  AvailableSlotModel slotItem;
  var selectedPatientType= "";
  var selectedConsultationType= "";
  String color = "#EAEBED";
  void startTimer() {
    Timer.periodic(const Duration(seconds: 2), (t) {
      if(mounted)
        setState(() {
          isLoading = false; //set loading to false
        });
      t.cancel();
      isLoading=true;//stops the timer
    });
  }
  @override
  void initState() {
    isOk= false;
    forMeBackColor = "#141D53";
    forMeTextColor = "#FFFFFF";
    forMe = true;
    addPatient = false;
    addPatientBackColor = "#00FFFFFF";
    addPatientTextColor = "#8389A9";
    print(widget.ok);
    startTimer();
    pickedAppointDate = DateTime.now();
    pickedAppointDate2 = DateTime.now();
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
    vm.getSlots(pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
  }

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoggedIn = false;
  String forMeBackColor = "#141D53";
  String forMeTextColor = "#FFFFFF";
  String addPatientBackColor = "#00FFFFFF";
  String addPatientTextColor = "#8389A9";
  bool forMe = true;
  bool addPatient = false;

  @override
  Widget build(BuildContext context) {
    print("babababababababbabaababbababbabaa" + widget.ok.toString());
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
    if(pickedAppointDate!=pickedAppointDate2){
      vm.getSlots(pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
      pickedAppointDate2 = pickedAppointDate;
      Timer.periodic(const Duration(milliseconds: 1000), (t) {
        setState(() {
          isLoading = false; //set loading to false
        });
        t.cancel();
        isLoading=true;//stops the timer
      });
    }
    List<Items> list = vm.slotList;
    var spaceBetween= SizedBox(height: 10,);
    String _formatDate = DateFormat("yyyy-MM-dd").format(pickedAppointDate);
    var appointmentDate = Row(
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
              spaceBetween,
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#D6DCFF")),
                    borderRadius: BorderRadius.circular(20)),
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
            selectAppointDate(context);
          },
        ),
      ],
    );
    var proceedButton=      isLoading== false ? SizedBox() :    Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: FlatButton(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        color: AppTheme.appbarPrimary,
        onPressed: () {
          vm.getSlotStatus(slotNo.toString(), widget.companyNo, widget.orgNo);
          setState(() {
            Timer.periodic(const Duration(milliseconds: 1000), (t) {
              if(vm.slotStatus=="OK")
              setState(() {
                isOk = false; //set loading to false
              });
              t.cancel();
              isOk=true;//stops the timer
            });
          });
        },
        textColor: Colors.white,
        child: Text(
          "Proceed",
          style: GoogleFonts.poppins(
              fontSize: height <= 600 ? 8 : 15,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );

    var selectType = Container(
      height: 65.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
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
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.06,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .4,
                child: Center(
                    child: Text(
                      "For Me",
                      style: GoogleFonts.poppins(
                          color: HexColor(forMeTextColor)),
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.06,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .4,
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
                        widget.specialist,
                        style: GoogleFonts.poppins(height: 1.5,
                            color: AppTheme.appbarPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.name, overflow: TextOverflow.clip, maxLines: 3,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Text(widget.designation == null ? "" : widget.designation,
                          style: GoogleFonts.poppins(height: 0.7, fontSize: 13)
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.fee,
                        style: GoogleFonts.poppins(
                          color: AppTheme.appbarPrimary,
                        ),
                      ),
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
              isLoggedIn == false ? Container(
                //margin: EdgeInsets.all(100.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/alok.png"),
                  radius: 15.0,),
              ) : SizedBox(),
              SizedBox(width: 10,)
            ],
            leading: IconButton(
                icon: Icon(Icons.notes),
                onPressed: () => _scaffoldKey.currentState.openDrawer())),
        drawer: Drawer(),
        body: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
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
                    EdgeInsets.only(left: 20.0, right: 20, top: 60),
                    child: isOk == true ?
                    Column(
                      children: [
                        selectType,
                        forMe == true ? BookAppointForMe() : AddPatient(),
                        // confirmBooking
                      ],
                    ) : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appointmentDate,
                        spaceBetween,
                        Text("Available Slots",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                        spaceBetween,
                        isLoading== false ? Center(child: CircularProgressIndicator()) : Expanded(
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                              itemBuilder: (context, index) => GestureDetector(

                                onTap: () {
                                  setState(() {
                                    selectedCard = index;
                                    slotNo = vm.slotList[index].slotNo;
                                  });
                                },
                                child: Stack(
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
                                              selectedCard == index ?   HexColor("#8592E5") : HexColor("#C1C8F1"),
                                              selectedCard == index ? HexColor("#F6F8FB") : HexColor("#FAFBFC"),
                                            ]),
                                        border: Border.all(
                                          color: selectedCard == index ? HexColor("#8592E5") :  HexColor("#C1C8F1"),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
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
                                                  "Serial - " + list[index].slotSl.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      color: selectedCard == index ? HexColor("#354291") :  HexColor("#999FC7")),
                                                )),
                                          ),
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height <= 800
                                                    ? height / 100
                                                    : height / 80),
                                            child: Center(
                                                child: Text(
                                                  "Time : " + DateFormat("hh:mm:ss").format(DateTime.parse(list[index].startTime.toString()).toLocal()),
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
                              ),
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: _crossAxisCount,
                                crossAxisSpacing: _crossAxisSpacing,
                                mainAxisSpacing: _mainAxisSpacing,
                                childAspectRatio: _aspectRatio,
                              ),
                            )),
                        //  AvailableSlots(selectDate: _formatDate,doctorNo: widget.doctorNo, orgNo: widget.orgNo,companyNo: widget.companyNo,),
                        spaceBetween,
                        vm.slotList.length==0? SizedBox() : proceedButton,
                        spaceBetween,
                      ],
                    )
                  ),
                ),
              ),
            ),
            doctorCard,
          ],
        )
    );
  }
}






//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:myhealthbd_app/features/appointments/view/widgets/add_patient.dart';
// import 'package:myhealthbd_app/features/appointments/view/widgets/book_appoint_for_me.dart';
// import 'package:myhealthbd_app/features/appointments/view/widgets/select_appointment_widget.dart';
// import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
// import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
// import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
// import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
// import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
// import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
// import 'package:myhealthbd_app/features/my_health/view/doctor_filters.dart';
// import 'package:myhealthbd_app/main_app/resource/colors.dart';
// import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
// import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';
// import 'package:http/http.dart' as http;
// import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class AppointmentScreen extends StatefulWidget {
//   String specialist;
//   String name;
//   String designation;
//   String fee;
//   String doctorNo;
//   String companyNo;
//   String orgNo;
//   bool ok=false;
//   AppointmentScreen({this.name, this.designation, this.fee, this.specialist, this.companyNo, this.doctorNo, this.orgNo, this.ok});
//   @override
//   _AppointmentScreenState createState() => _AppointmentScreenState();
// }
// class _AppointmentScreenState extends State<AppointmentScreen> {
//   @override
//   void initState() {
//     forMeBackColor = "#141D53";
//     forMeTextColor = "#FFFFFF";
//     forMe = true;
//     addPatient = false;
//     addPatientBackColor = "#00FFFFFF";
//     addPatientTextColor = "#8389A9";
//     print(widget.ok);
//   }
//
//   BorderRadiusGeometry radius = BorderRadius.only(
//     topLeft: Radius.circular(25.0),
//     topRight: Radius.circular(25.0),
//   );
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   bool isLoggedIn = false;
//   String forMeBackColor = "#141D53";
//   String forMeTextColor = "#FFFFFF";
//   String addPatientBackColor = "#00FFFFFF";
//   String addPatientTextColor = "#8389A9";
//   bool forMe = true;
//   bool addPatient = false;
//
//   @override
//   Widget build(BuildContext context) {
//     print("babababababababbabaababbababbabaa" + widget.ok.toString());
//     var height = MediaQuery
//         .of(context)
//         .size
//         .height;
//     var spaceBetween = SizedBox(
//       height: height >= 600 ? 10.0 : 5.0,
//     );
//     var selectType = Container(
//       height: 65.0,
//       width: MediaQuery
//           .of(context)
//           .size
//           .width,
//       decoration: BoxDecoration(
//           color: HexColor("#E9ECFE"), borderRadius: BorderRadius.circular(13)),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10.0, right: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: HexColor(forMeBackColor),
//                     borderRadius: BorderRadius.circular(10)),
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .height * 0.06,
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width * .4,
//                 child: Center(
//                     child: Text(
//                       "For Me",
//                       style: GoogleFonts.poppins(
//                           color: HexColor(forMeTextColor)),
//                     )),
//               ),
//               onTap: () {
//                 setState(() {
//                   if (addPatient == true) {
//                     forMe = true;
//                     addPatient = false;
//                   } else {
//                     forMe = true;
//                   }
//                   if (addPatient == false) {
//                     addPatientBackColor = "#00FFFFFF";
//                     addPatientTextColor = "#8389A9";
//                     forMeBackColor = "#141D53";
//                     forMeTextColor = "#FFFFFF";
//                   }
//                 });
//               },
//             ),
//             InkWell(
//               child: Container(
//                   decoration: BoxDecoration(
//                       color: HexColor(addPatientBackColor),
//                       borderRadius: BorderRadius.circular(10)),
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height * 0.06,
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width * .4,
//                   child: Center(
//                       child: Text(
//                         "Add patient",
//                         style: GoogleFonts.poppins(
//                             color: HexColor(addPatientTextColor)),
//                       ))),
//               onTap: () {
//                 setState(() {
//                   if (forMe == true) {
//                     forMe = false;
//                     addPatient = true;
//                   } else {
//                     addPatient = true;
//                   }
//                   if (forMe == false) {
//                     forMeBackColor = "#00FFFFFF";
//                     forMeTextColor = "#8389A9";
//                     addPatientBackColor = "#141D53";
//                     addPatientTextColor = "#FFFFFF";
//                   }
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//     var doctorCard = Positioned(
//       top: 10,
//       left: 0,
//       right: 0,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
//         child: Container(
//           height: 100,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: HexColor("#FFFFFF"),
//               boxShadow: [
//                 BoxShadow(
//                   color: HexColor("#0D1231").withOpacity(0.08),
//                   spreadRadius: 10,
//                   blurRadius: 15,
//                   offset: Offset(0, 1), // changes position of shadow
//                 ),
//               ]),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 120,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                       child: Image.asset(
//                         "assets/images/doctor.png",
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.specialist,
//                         style: GoogleFonts.poppins(height: 1.5,
//                             color: AppTheme.appbarPrimary,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         widget.name, overflow: TextOverflow.clip, maxLines: 3,
//                         style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.bold, fontSize: 12),
//                       ),
//                       Text(widget.designation == null ? "" : widget.designation,
//                           style: GoogleFonts.poppins(height: 0.7, fontSize: 13)
//                       ),
//                       SizedBox(
//                         height: 3,
//                       ),
//                       Text(
//                         widget.fee,
//                         style: GoogleFonts.poppins(
//                           color: AppTheme.appbarPrimary,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//     var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         //key: _scaffoldKey,
//         appBar: new AppBar(
//             title: new Text(
//               "Book your appointment",
//               style: GoogleFonts.poppins(fontSize: 15),
//             ),
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(
//                   Icons.notifications,
//                   color: Colors.white,
//                   size: 20,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isLoggedIn == true ? isLoggedIn = false : isLoggedIn = true;
//                   });
//                 },
//               ),
//               isLoggedIn == false ? Container(
//                 //margin: EdgeInsets.all(100.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.white,
//                   ),
//                 ),
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage("assets/images/alok.png"),
//                   radius: 15.0,),
//               ) : SizedBox(),
//               SizedBox(width: 10,)
//             ],
//             leading: IconButton(
//                 icon: Icon(Icons.notes),
//                 onPressed: () => _scaffoldKey.currentState.openDrawer())),
//         drawer: Drawer(),
//         body: Stack(
//           children: <Widget>[
//             Positioned(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 90.0),
//                 child: Container(
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width,
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(25),
//                           topRight: Radius.circular(25)),
//                       color: HexColor("#FFFFFF"),
//                       boxShadow: [
//                         BoxShadow(
//                           color: HexColor("#0D1231").withOpacity(0.08),
//                           spreadRadius: 10,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ]),
//                   child: Padding(
//                     padding:
//                     EdgeInsets.only(left: 20.0, right: 20, top: 60),
//                     child: isLoggedIn == true ?
//                     Column(
//                       children: [
//                         selectType,
//                         forMe == true ? BookAppointForMe() : AddPatient(),
//                         // confirmBooking
//                       ],
//                     ) : SelectAppointTime(orgNo: widget.orgNo,
//                       doctorNo: widget.doctorNo,
//                       companyNo: widget.companyNo,),
//                   ),
//                 ),
//               ),
//             ),
//             doctorCard,
//           ],
//         )
//     );
//   }
// }
//
//