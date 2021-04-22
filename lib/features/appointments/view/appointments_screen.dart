import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/add_patient.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/no_available_slots.dart';
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
  bool ok = false;

  AppointmentScreen(
      {this.name,
        this.designation,
        this.fee,
        this.specialist,
        this.companyNo,
        this.doctorNo,
        this.orgNo,
        this.ok});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime pickedAppointDate;
  DateTime pickedAppointDate2;
  bool isClicked;

  Future<Null> selectAppointDate(BuildContext context) async {
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
  bool isSelected;
  var slotNo;
  bool isLoading = false;
  bool isStatusOk;
  double _crossAxisSpacing = 4, _mainAxisSpacing = 8, _aspectRatio = .5;

  AvailableSlotModel slotItem;
  var selectedPatientType = "";
  var selectedConsultationType = "";
  String color = "#EAEBED";

  startTimer() {
    Timer.periodic(const Duration(milliseconds: 2000), (t) {
      if (mounted) setState(() {});
      t.cancel();
    });
  }

  @override
  void initState() {
    isClicked = false;
    isStatusOk = false;
    isSelected = false;
    pickedAppointDate = DateTime.now();
    pickedAppointDate2 = DateTime.now();
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
    vm.getSlots(
        pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
  }

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = MediaQuery.of(context).size.height >= 700 ? 4 : 3;
    var height = MediaQuery.of(context).size.height;
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: true);
    if (pickedAppointDate != pickedAppointDate2) {
      vm.getSlots(
          pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
      pickedAppointDate2 = pickedAppointDate;
      startTimer();
      selectedCard = -1;
      isSelected = false;
    }
    List<Items> list = vm.slotList;
    var spaceBetween = SizedBox(
      height: 10,
    );
    String _formatDate = DateFormat("yyyy-MM-dd").format(pickedAppointDate);
    var appointmentDate = Row(
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
    var proceedButton = vm.isLoading == true
        ? SizedBox()
        : Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: AbsorbPointer(
        absorbing: isSelected == false ? true : false,
        child: isClicked == true
            ? Center(child: CircularProgressIndicator(  valueColor:
        AlwaysStoppedAnimation<Color>(
            AppTheme.appbarPrimary),))
            : FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          color: isSelected == false
              ? HexColor("#969EC8")
              : AppTheme.appbarPrimary,
          onPressed: () {
            vm.getSlotStatus(
                slotNo.toString(), widget.companyNo, widget.orgNo);
            setState(() {
              isClicked = true;
              Timer.periodic(const Duration(milliseconds: 0),
                      (t) {
                    if (vm.slotStatus == "OK")
                      setState(() {
                        isStatusOk = false; //set loading to false
                      });
                    t.cancel();
                    isStatusOk = true; //stops the timer
                  });
            });
          },
          textColor: Colors.white,
          child: Text(
            "Proceed",
            style: GoogleFonts.poppins(
                fontSize: height <= 600 ? 15 : 15,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
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
                    color: HexColor(vm.forMeBackColor),
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * .4,
                child: Center(
                    child: Text(
                      "For Me",
                      style: GoogleFonts.poppins(color: HexColor(vm.forMeTextColor)),
                    )),
              ),
              onTap: () {
                vm.getAppointType(true, false);
                if (vm.addPatient == false) {
                  vm.getButtonColor("#141D53", "#FFFFFF", "#00FFFFFF", "#8389A9");
                }
              },
            ),
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: HexColor(vm.addPatientBackColor),
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Center(
                      child: Text(
                        "Add patient",
                        style: GoogleFonts.poppins(
                            color: HexColor(vm.addPatientTextColor)),
                      ))),
              onTap: () {
                vm.getAppointType(false, true);
                if (vm.forMe == false) {
                  vm.getButtonColor("#00FFFFFF", "#8389A9", "#141D53", "#FFFFFF");
                }
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
                    width: 108,
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
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.specialist,
                        style: GoogleFonts.poppins(
                            height: 1.5,
                            color: AppTheme.appbarPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                          width: 185,
                          child: Text(
                            widget.name,
                            style: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.w700),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        width: 185,
                        child: Text(
                            widget.designation == null
                                ? ""
                                : widget.designation,
                            style:
                            GoogleFonts.poppins(height: 0.7, fontSize: 11)),
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
              isLoggedIn == false
                  ? Container(
                //margin: EdgeInsets.all(100.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/alok.png"),
                  radius: 15.0,
                ),
              )
                  : SizedBox(),
              SizedBox(
                width: 10,
              )
            ],
            // leading: IconButton(
            //     icon: Icon(Icons.notes),
            //     onPressed: () => _scaffoldKey.currentState.openDrawer())
        ),
        //drawer: Drawer(),
        body: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
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
                      padding: EdgeInsets.only(left: 20.0, right: 20, top: 60),
                      child: isStatusOk == true
                          ? Column(
                        children: [
                          selectType,
                          AddPatient(doctorNo: widget.doctorNo,companyNo: widget.companyNo, orgNo: widget.orgNo,),
                        ],
                      )
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appointmentDate,
                          spaceBetween,
                          Text("Available Slots",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          spaceBetween,
                          vm.isLoading == true
                              ? Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                AlwaysStoppedAnimation<Color>(
                                    AppTheme.appbarPrimary),
                              ))
                              : Expanded(
                              child: vm.slotList.length == 0
                                  ? NoAvailableSlots()
                                  : GridView.builder(
                                scrollDirection:
                                Axis.horizontal,
                                itemCount: list.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSelected = true;
                                          selectedCard = index;
                                          slotNo = vm
                                              .slotList[index]
                                              .slotNo;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration:
                                            BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment
                                                      .bottomRight,
                                                  stops: [
                                                    1.0,
                                                    1.0
                                                  ],
                                                  colors: [
                                                    selectedCard ==
                                                        index
                                                        ? HexColor(
                                                        "#8592E5")
                                                        : HexColor(
                                                        "#C1C8F1"),
                                                    selectedCard ==
                                                        index
                                                        ? HexColor(
                                                        "#F6F8FB")
                                                        : HexColor(
                                                        "#FAFBFC"),
                                                  ]),
                                              border: Border.all(
                                                color: selectedCard ==
                                                    index
                                                    ? HexColor(
                                                    "#8592E5")
                                                    : HexColor(
                                                    "#C1C8F1"),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height <= 800
                                                          ? height /
                                                          110
                                                          : height /
                                                          65.09),
                                                  child: Center(
                                                      child: Text(
                                                        "Serial - " +
                                                            list[index]
                                                                .slotSl
                                                                .toString(),
                                                        style: GoogleFonts.poppins(
                                                            fontSize:
                                                            MediaQuery.of(context).size.height >= 700
                                                                ? 14
                                                                : 12,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            color: selectedCard ==
                                                                index
                                                                ? HexColor(
                                                                "#354291")
                                                                : HexColor(
                                                                "#999FC7")),
                                                      )),
                                                ),
                                                SizedBox(
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height >=
                                                        700
                                                        ? 10
                                                        : 5),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height <= 800
                                                          ? height /
                                                          100
                                                          : height /
                                                          80),
                                                  child: Center(
                                                      child: Text(
                                                        "Time : " +
                                                            DateFormat("hh:mm:ss").format(DateTime.parse(list[index]
                                                                .startTime
                                                                .toString())
                                                                .toLocal()),
                                                        style: GoogleFonts.poppins(
                                                            fontSize:
                                                            12,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            color: Colors
                                                                .white),
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
                                  crossAxisCount:
                                  _crossAxisCount,
                                  crossAxisSpacing:
                                  _crossAxisSpacing,
                                  mainAxisSpacing:
                                  _mainAxisSpacing,
                                  childAspectRatio:
                                  _aspectRatio,
                                ),
                              )),
                          //  AvailableSlots(selectDate: _formatDate,doctorNo: widget.doctorNo, orgNo: widget.orgNo,companyNo: widget.companyNo,),
                          spaceBetween,
                          vm.slotList.length == 0
                              ? SizedBox()
                              : proceedButton,
                          spaceBetween,
                        ],
                      )),
                ),
              ),
            ),
            doctorCard,
          ],
        ));
  }
}