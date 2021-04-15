// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:intl/intl.dart';
// import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
// import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
// import 'package:myhealthbd_app/features/appointments/view/widgets/no_available_slots.dart';
// import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
// import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
// import 'package:myhealthbd_app/main_app/resource/colors.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// class SelectAppointTime extends StatefulWidget {
//   String doctorNo;
//   String companyNo;
//   String orgNo;
//   SelectAppointTime({this.orgNo, this.companyNo, this.doctorNo});
//   @override
//   _SelectAppointTimeState createState() => _SelectAppointTimeState();
// }
//
// class _SelectAppointTimeState extends State<SelectAppointTime> {
//   DateTime pickedAppointDate;
//   DateTime pickedAppointDate2;
//   Future<Null> selectAppointDate(BuildContext context) async {
//     final DateTime date = await showDatePicker(
//       context: context,
//       initialDate: pickedAppointDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2025),
//     );
//     if (date != null && date != pickedAppointDate) {
//       setState(() {
//         pickedAppointDate = date;
//       });
//     }
//   }
//   double _crossAxisSpacing = 8, _mainAxisSpacing = 10, _aspectRatio = .4;
//   int _crossAxisCount = 4;
//   AvailableSlotModel slotItem;
//   final List<Items> availableSlotList = List<Items>();
//   Future<AvailableSlotModel>  fetchSpecializationList() async {
//    // print(widget.companyNo);
//     pickedAppointDate2=pickedAppointDate;
//     var url =
//         "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/getAvailableSlot";
//     final http.Response response = await http.post(url,body: jsonEncode(<String, String>{
//       "appointDate": DateFormat("yyyy-MM-dd").format(pickedAppointDate).toString(),
//       "companyNo": widget.companyNo,
//       "doctorNo": widget.doctorNo,
//       "ogNo": widget.orgNo
//     }),);
//    // print(response.body);
//     if (response.statusCode == 200) {
//       print(response.body);
//       slotItem = availableSlotModelFromJson(response.body) ;
//       // print(spItem);
//       availableSlotList.clear();
//       setState(() {
//         slotItem.items.forEach((element) {
//           availableSlotList.add(element);
//         });
//       });
//       // print('Data:: ' + spItem.specializationItem[2].dtlDescription);
//       return slotItem;
//     }else {
//       return null;
//     }
//   }
//   @override
//   void initState() {
//     super.initState();
//     pickedAppointDate = DateTime.now();
//     pickedAppointDate2 = DateTime.now();
//     fetchSpecializationList();
//     var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
//     vm.getSlots(pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     var vm = Provider.of<AvailableSlotsViewModel>(context);
//     List<Items> slots = vm.slotList;
//     print("slots" +  slots.length.toString());
//     var spaceBetween= SizedBox(height: 10,);
//     var height = MediaQuery.of(context).size.height;
//     String _formatDate = DateFormat("yyyy-MM-dd").format(pickedAppointDate);
//     pickedAppointDate!= pickedAppointDate2 ? vm.getSlots(pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo): pickedAppointDate=pickedAppointDate2;
//    // print(_formatDate);
//     var appointmentDate = Row(
//       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   height: 20.0,
//                   // width: MediaQuery.of(context).size.width,
//                   child: Row(
//                     children: [
//                       Text("Select Date",
//                           style: GoogleFonts.poppins(
//                               fontSize: 14, fontWeight: FontWeight.w600)),
//                     ],
//                   )),
//               spaceBetween,
//               Container(
//                 height: 45.0,
//                 width: MediaQuery.of(context).size.width * .85,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: HexColor("#D6DCFF")),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 12.0, right: 12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "$_formatDate",
//                         style: GoogleFonts.poppins(
//                             color: AppTheme.signInSignUpColor, fontSize: 13.0),
//                       ),
//                       Container(
//                           height: 18,
//                           child: Icon(
//                             Icons.calendar_today_outlined,
//                             color: AppTheme.appbarPrimary,
//                           )),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           onTap: () {
//             selectAppointDate(context);
//           },
//         ),
//       ],
//     );
//     var proceedButton=         Container(
//       width: MediaQuery.of(context).size.width,
//       height: 45,
//       child: FlatButton(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8)),
//         color: AppTheme.appbarPrimary,
//         onPressed: () {},
//         textColor: Colors.white,
//         child: Text(
//           "Proceed",
//           style: GoogleFonts.poppins(
//               fontSize: height <= 600 ? 8 : 15,
//               color: Colors.white,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         appointmentDate,
//         spaceBetween,
//         Text("Available Slots",
//             style: GoogleFonts.poppins(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600)),
//         spaceBetween,
//       Expanded(
//           child: GridView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: vm.slotList.length,
//             itemBuilder: (context, index) => Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.bottomRight,
//                         stops: [
//                           1.0,
//                           1.0
//                         ],
//                         colors: [
//                           HexColor('#8592E5'),
//                           HexColor('#F6F8FB'),
//                         ]),
//                     border: Border.all(
//                       color: HexColor("#8592E5"),
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                             top: height <= 800
//                                 ? height / 110
//                                 : height / 65.09),
//                         child: Center(
//                             child: Text(
//                               "Serial - " + vm.slotList[index].slotNo.toString(),
//                               style: GoogleFonts.poppins(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppTheme
//                                       .appbarPrimary),
//                             )),
//                       ),
//                       SizedBox(height: 10,),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             top: height <= 800
//                                 ? height / 100
//                                 : height / 80),
//                         child: Center(
//                             child: Text(
//                               "Time : " + DateFormat("hh:mm:ss").format(DateTime.parse(vm.slotList[index].startTime.toString()).toLocal()),
//                               style: GoogleFonts.poppins(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: _crossAxisCount,
//               crossAxisSpacing: _crossAxisSpacing,
//               mainAxisSpacing: _mainAxisSpacing,
//               childAspectRatio: _aspectRatio,
//             ),
//           )),
//         //  AvailableSlots(selectDate: _formatDate,doctorNo: widget.doctorNo, orgNo: widget.orgNo,companyNo: widget.companyNo,),
//         spaceBetween,
//         availableSlotList.length==0? SizedBox() : proceedButton,
//         spaceBetween,
//       ],
//     );
//   }
// }
import 'dart:async';
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/no_available_slots.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../appointments_screen.dart';
import 'NewFile.dart';
class SelectAppointTime extends StatefulWidget {
  String doctorNo;
  String companyNo;
  String orgNo;
  SelectAppointTime({this.orgNo, this.companyNo, this.doctorNo});
  @override
  _SelectAppointTimeState createState() => _SelectAppointTimeState();
}

class _SelectAppointTimeState extends State<SelectAppointTime> {
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
  double _crossAxisSpacing = 4, _mainAxisSpacing = 8, _aspectRatio = .5;
  int _crossAxisCount = 4;
  AvailableSlotModel slotItem;
  final List<Items> availableSlotList = List<Items>();
  Future<AvailableSlotModel>  fetchSpecializationList() async {
    print(widget.companyNo);
    pickedAppointDate2=pickedAppointDate;
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/getAvailableSlot";
    final http.Response response = await http.post(url,body: jsonEncode(<String, String>{
      "appointDate": DateFormat("yyyy-MM-dd").format(pickedAppointDate).toString(),
      "companyNo": widget.companyNo,
      "doctorNo": widget.doctorNo,
      "ogNo": widget.orgNo
    }),);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      slotItem = availableSlotModelFromJson(response.body) ;
      // print(spItem);
      availableSlotList.clear();
      setState(() {
        slotItem.items.forEach((element) {
          availableSlotList.add(element);
        });
      });
      // print('Data:: ' + spItem.specializationItem[2].dtlDescription);
      return slotItem;
    }else {
      return null;
    }
  }
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
    super.initState();
    startTimer();
    pickedAppointDate = DateTime.now();
    pickedAppointDate2 = DateTime.now();
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
   // print("shakil111111");
    vm.getSlots(pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);
    //print("shakil111111");
    fetchSpecializationList();
    AvailableSlotsRepository().fetchSlotInfo(pickedAppointDate, widget.companyNo, widget.doctorNo, widget.orgNo);

  }

  @override
  Widget build(BuildContext context) {
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
    print("abcd");
    print(vm.slotList.length);
    var height = MediaQuery.of(context).size.height;
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
          print(vm.slot);
          if(vm.slotStatus== "Ok") {
            BotToast.showText(text: "Unable to launch");
            setState(() {
              AppointmentScreen(ok: true,);
            });}
          // vm.slotStatus=="OK" ? Navigator.push(context, MaterialPageRoute(builder: (context){
          //   return  MyGridView();
          // }));
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
        isLoading== false ? Center(child: CircularProgressIndicator()) : Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) => GestureDetector(

                onTap: () {
                  setState(() {
                    // ontap of each card, set the defined int to the grid view index
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
    );
  }
}