import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/video_article_blog_details.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

import 'no_available_slots.dart';
class AvailableSlots extends StatefulWidget {
  String doctorNo;
  String companyNo;
  String orgNo;
  AvailableSlots({this.orgNo, this.companyNo, this.doctorNo});
  @override
  _AvailableSlotsState createState() => _AvailableSlotsState();
}

class _AvailableSlotsState extends State<AvailableSlots> {
  double _crossAxisSpacing = 4, _mainAxisSpacing = 8, _aspectRatio = .5;
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
  bool isStatusOk;
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
    Future.delayed(Duration.zero,()async{
      var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
      vm.getSlots(
          pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = MediaQuery.of(context).size.height >= 700 ? 4 : 3;
    var height = MediaQuery.of(context).size.height;
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: true);
    var spaceBetween = SizedBox(
      height: 10,
    );
    if (pickedAppointDate != pickedAppointDate2) {
      vm.getSlots(
          pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
      pickedAppointDate2 = pickedAppointDate;
      startTimer();
      selectedCard = -1;
      isSelected = false;
    }
    List<Items> list = vm.slotList;
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
    return Column(
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
    );
  }
}
