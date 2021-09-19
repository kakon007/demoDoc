import 'package:badges/badges.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/admin/appointment_report/view/widgets/details_pop_up.dart';
import 'package:myhealthbd_app/admin/appointment_report/view_models/appointment_company_list_view_model.dart';
import 'package:myhealthbd_app/admin/appointment_report/view_models/initial_list_view_model.dart';
import 'package:myhealthbd_app/features/book_test/model/company_list_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/test_item_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class DoctorAppointmentReport extends StatefulWidget {
  @override
  _DoctorAppointmentReportState createState() => _DoctorAppointmentReportState();
}

class _DoctorAppointmentReportState extends State<DoctorAppointmentReport> {
  DropdownEditingController<String> tx=DropdownEditingController();
  DateTime pickBirthDate;
  DateTime pickBirthDate2;
  DateTime docpickBirthDate;
  DateTime docpickBirthDate2;
  String _selectedGender;
  var genderBorderColor = "#EAEBED";
  TextEditingController ogController=TextEditingController();
  int companyNo;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      var initialCompany = Provider.of<InitialCompanyListViewModel>(context,listen: false);
      await initialCompany.getData();
      var appointmentCompanyList = Provider.of<AppointmentCompanyListViewModel>(context,listen: false);
      appointmentCompanyList.getData(ogNo: initialCompany.companyList.items.first.id);
    });
    pickBirthDate=DateTime.now();
    pickBirthDate2=DateTime.now();
    docpickBirthDate=DateTime.now();
    docpickBirthDate2=DateTime.now();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var initialCompany = Provider.of<InitialCompanyListViewModel>(context);
    var appointmentCompanyList = Provider.of<AppointmentCompanyListViewModel>(context);
    // List<String> companyList=appointmentCompanyList.companyList.items.map((e) => e.companyName).toList();
    // print('bf $companyList');
    print('bf $companyNo');
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.34;
    final ExpandableController controller=ExpandableController();
    final ExpandableController controller2=ExpandableController();

    Future<Null> selectDate(BuildContext context) async {
      final DateTime date = await showDatePicker(
        //initialDatePickerMode: DatePickerMode.year,
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

        initialDate: pickBirthDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (date != null && date !=pickBirthDate) {
        setState(() {
          pickBirthDate = date;
        });
      }
    }

    Future<Null> docselectDate(BuildContext context) async {
      final DateTime date = await showDatePicker(
        //initialDatePickerMode: DatePickerMode.year,
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

        initialDate: docpickBirthDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (date != null && date !=docpickBirthDate) {
        setState(() {
          docpickBirthDate = date;
        });
      }
    }

    Future<Null> selectDate2(BuildContext context) async {
      final DateTime date = await showDatePicker(
        //initialDatePickerMode: DatePickerMode.year,
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

        initialDate: pickBirthDate2,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (date != null && date != pickBirthDate2) {
        setState(() {
          pickBirthDate2 = date;
        });
      }
    }

    Future<Null> docselectDate2(BuildContext context) async {
      final DateTime date = await showDatePicker(
        //initialDatePickerMode: DatePickerMode.year,
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

        initialDate: docpickBirthDate2,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (date != null && date != docpickBirthDate2) {
        setState(() {
          docpickBirthDate2 = date;
        });
      }
    }

    //
    // var detailsAlert=
    //     showAlert(context);



    var organizationName= Padding(
      padding: const EdgeInsets.only(left:18.0,right: 18),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(color:  HexColor('#3E58FF')),borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,bottom: 10,top: 18),
              child: Text(initialCompany.companyList?.items?.first?.ogName??'',style: TextStyle(fontSize: 15),),
            ),
          ),

          Positioned(
            left: 5,
            bottom: 42,
            child: Container(width: 80,color: Colors.white, child: Center(child: Text('Organization',style: TextStyle(fontSize: 12,color: HexColor('#3E58FF')),))),
          )
        ],
      )
    );

    // var companyName= Padding(
    //   padding: const EdgeInsets.only(left:18.0,right: 18),
    //   child: TextDropdownFormField(
    //     controller: tx,
    //     options: companyList,
    //     decoration: InputDecoration(
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         suffixIcon: Icon(Icons.keyboard_arrow_down_sharp,color: HexColor('#3E58FF'),),
    //         focusedBorder: OutlineInputBorder(
    //           borderSide: BorderSide(color: HexColor('#3E58FF'), width: 1.0),
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         labelText: "Company Name",
    //         labelStyle: TextStyle(color: HexColor('#3E58FF'))
    //     ),
    //     dropdownHeight: 120,
    //   ),
    // );

    var companyName=
    Padding(padding:const EdgeInsets.only(left:18.0,right: 18) ,
      child:
      Stack(
        children: [
          Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color:  HexColor('#3E58FF')),borderRadius: BorderRadius.circular(15),
          ),
          child:appointmentCompanyList.companyList==null?Center(child: Text('No hospital available!'),): Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10),
            child: Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: Container(
                width: width ,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    onTap: () {
                      FocusManager.instance.primaryFocus.unfocus();
                    },
                    key: Key('signUpGenderKey'),
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: _selectedGender != null
                          ? Colors.black54
                          : HexColor("#D2D2D2"),
                    ),
                    iconSize: 25,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        enabledBorder: InputBorder.none),
                    isExpanded: true,
                    hint: Text(
                      "Select Company",
                      style: GoogleFonts.roboto(
                          fontSize: isTablet ? 17 : 15,
                          color: Colors.black),
                    ),
                    value: companyNo,
                    onChanged: (newValue) async{
                      companyNo = newValue;
                      //await appointmentCompanyList.companyInfo(companyNo: companyNo);
                      // testItemVm.getData(companyNo: vm.companyNo);
                      // testItemVm.getMoreData(companyNo: vm.companyNo);
                      setState(()   {

                      });
                    },
                    items: appointmentCompanyList.companyList.items.map((gender) {
                      return DropdownMenuItem(
                        child:  Text(
                          gender.companyName,
                          style: GoogleFonts.roboto(fontSize: 14),
                        ),
                        value: gender.id,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
    ),
          Positioned(
            left: 5,
            bottom: 42,
            child: Container(width: 80,color: Colors.white, child: Center(child: Text('Company',style: TextStyle(fontSize: 12,color: HexColor('#3E58FF')),))),
          )
        ],
      ) ,);

    var fromDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            // width:MediaQuery.of(context).size.width>350?140:100,
            width: isTablet
                ? MediaQuery.of(context).size.width * 0.35
                : width <= 330
                ? MediaQuery.of(context).size.width *
                0.27
                : MediaQuery.of(context).size.width *
                0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor(
                    "#6374DF"), // set border color
                //width: 3.0
              ), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(
                      10.0)), // set rounded corner radius
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    pickBirthDate == DateTime.now()
                        ? "Date of birth"
                        : "${DateFormat("dd-MM-yyyy").format(pickBirthDate)}",
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child:
                  SvgPicture.asset(
                    "assets/icons/calendoc.svg",
                    //key: Key('filterIconKey'),
                    width: 10,
                    height: 18,
                    fit: BoxFit.fitWidth,
                    allowDrawingOutsideViewBox: true,
                    matchTextDirection: true,
                    //color:  Colors.grey.withOpacity(0.5),
                    //semanticsLabel: 'Acme Logo'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        selectDate(context);
        FocusManager.instance.primaryFocus.unfocus();
      },
    );
    var docFromDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            // width:MediaQuery.of(context).size.width>350?140:100,
            width: isTablet
                ? MediaQuery.of(context).size.width * 0.35
                : width <= 330
                ? MediaQuery.of(context).size.width *
                0.40
                : MediaQuery.of(context).size.width *
                0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor(
                    "#6374DF"), // set border color
                //width: 3.0
              ), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(
                      10.0)), // set rounded corner radius
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    docpickBirthDate == DateTime.now()
                        ? "Date of birth"
                        : "${DateFormat("dd-MM-yyyy").format(docpickBirthDate)}",
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child:
                  SvgPicture.asset(
                    "assets/icons/calendoc.svg",
                    //key: Key('filterIconKey'),
                    width: 10,
                    height: 18,
                    fit: BoxFit.fitWidth,
                    allowDrawingOutsideViewBox: true,
                    matchTextDirection: true,
                    //color:  Colors.grey.withOpacity(0.5),
                    //semanticsLabel: 'Acme Logo'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        docselectDate(context);
        FocusManager.instance.primaryFocus.unfocus();
      },
    );
    var toDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            // width:MediaQuery.of(context).size.width>350?140:100,
            width: isTablet
                ? MediaQuery.of(context).size.width * 0.35
                : width <= 330
                ? MediaQuery.of(context).size.width *
                0.27
                : MediaQuery.of(context).size.width *
                0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor(
                    "#6374DF"), // set border color
                //width: 3.0
              ), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(
                      10.0)), // set rounded corner radius
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    pickBirthDate2 == DateTime.now()
                        ? "Date of birth"
                        : "${DateFormat("dd-MM-yyyy").format(pickBirthDate2)}",
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child:
                  SvgPicture.asset(
                    "assets/icons/calendoc.svg",
                    //key: Key('filterIconKey'),
                    width: 10,
                    height: 18,
                    fit: BoxFit.fitWidth,
                    allowDrawingOutsideViewBox: true,
                    matchTextDirection: true,
                    //color:  Colors.grey.withOpacity(0.5),
                    //semanticsLabel: 'Acme Logo'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        selectDate2(context);
        FocusManager.instance.primaryFocus.unfocus();
      },
    );
    var docToDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            // width:MediaQuery.of(context).size.width>350?140:100,
            width: isTablet
                ? MediaQuery.of(context).size.width * 0.35
                : width <= 330
                ? MediaQuery.of(context).size.width *
                0.40
                : MediaQuery.of(context).size.width *
                0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor(
                    "#6374DF"), // set border color
                //width: 3.0
              ), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(
                      10.0)), // set rounded corner radius
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    docpickBirthDate2 == DateTime.now()
                        ? "Date of birth"
                        : "${DateFormat("dd-MM-yyyy").format(docpickBirthDate2)}",
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child:
                  SvgPicture.asset(
                    "assets/icons/calendoc.svg",
                    //key: Key('filterIconKey'),
                    width: 10,
                    height: 18,
                    fit: BoxFit.fitWidth,
                    allowDrawingOutsideViewBox: true,
                    matchTextDirection: true,
                    //color:  Colors.grey.withOpacity(0.5),
                    //semanticsLabel: 'Acme Logo'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        docselectDate2(context);
        FocusManager.instance.primaryFocus.unfocus();
      },
    );

var shift= Container(
  height: isTablet ? 50 : 50.0,
  width: width,
  decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: HexColor("#6374DF")),
      borderRadius: BorderRadius.circular(10)),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Container(
          width: width * .87,
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              onTap: () {
                FocusManager.instance.primaryFocus.unfocus();
              },
              key: Key('signUpGenderKey'),
              icon: Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: _selectedGender != null
                      ? Colors.black54
                      : HexColor("#D2D2D2"),
                ),
              ),
              iconSize: 25,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  enabledBorder: InputBorder.none),
              isExpanded: true,
              hint: Text(
                'Shift',
                style: GoogleFonts.roboto(
                    fontSize: isTablet ? 17 : 15,
                    color: HexColor("#D2D2D2")),
              ),
              value: _selectedGender,
              onChanged: (newValue) {
                setState(() {
                  genderBorderColor = "#EAEBED";
                  _selectedGender = newValue;
                });
              },
              items: StringResources.shiftList.map((gender) {
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
      )
    ],
  ),
);

var alertDownload=
Container(
  child: FlatButton(
      minWidth: isTablet? width*.4 : width * .25,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppTheme.buttonInActiveColor,
      onPressed: () async {
        // SVProgressHUD.show(status: 'Loading');
        // await appointmentReport.getData(fromDate:TimeUtil().formattedDate(DateTime.parse( pickedFromDate.toString()??DateTime.now())),toDate:TimeUtil().formattedDate(DateTime.parse( pickedToDate.toString()??DateTime.now())),doctorNo: companyInfoVm.details.doctorNo,ogNo: companyInfoVm.details.organizationNo,shiftNo: selectedIndex==0?0:selectedIndex==1?2000001:2000002);
        // SVProgressHUD.dismiss();
      },
      child: Row(
        children: [
          Text(
            'Download',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: isTablet? 17 : width <= 330 ? 14 : 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      )),
);

var downloadButton = Align(
      child: FlatButton(
          minWidth: isTablet? width*.4 : width * .45,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: AppTheme.buttonInActiveColor,
          onPressed: () async {
            print("ting");

              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: [
                      Row(
                        children: [
                          Column(
                            children: [

    SvgPicture.asset(
    "assets/icons/excel.svg",
    width: 30,
    height: width<=330? 65 :35,
    fit: BoxFit.fitWidth,
    allowDrawingOutsideViewBox: true,
    matchTextDirection: true,
    ),
                              alertDownload,
                            ],
                          ),
                          SizedBox(width: 5,),

                          Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/docx.svg",
                                width: 20,
                                height: width<=330? 65 :30,
                                fit: BoxFit.fitWidth,
                                allowDrawingOutsideViewBox: true,
                                matchTextDirection: true,
                              ),
                              alertDownload,
                            ],
                          ),
                          SizedBox(width: 5,),
                          Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/pdf.svg",
                                width: 20,
                                height: width<=330? 65 :30,
                                fit: BoxFit.fitWidth,
                                allowDrawingOutsideViewBox: true,
                                matchTextDirection: true,
                              ),
                              alertDownload,
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },

          child: Row(
            children: [
              Icon(Icons.download_rounded,color: Colors.white,),
              SizedBox(width: 5,),
              Text(
                'Download',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: isTablet? 17 : width <= 330 ? 17 : 15,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );

    var previewButton = Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
          minWidth: isTablet? width*.4 : width * .45,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: AppTheme.buttonInActiveColor,
          onPressed: () async {
            // SVProgressHUD.show(status: 'Loading');
            // await appointmentReport.getData(fromDate:TimeUtil().formattedDate(DateTime.parse( pickedFromDate.toString()??DateTime.now())),toDate:TimeUtil().formattedDate(DateTime.parse( pickedToDate.toString()??DateTime.now())),doctorNo: companyInfoVm.details.doctorNo,ogNo: companyInfoVm.details.organizationNo,shiftNo: selectedIndex==0?0:selectedIndex==1?2000001:2000002);
            // SVProgressHUD.dismiss();
          },
          child:Row(
            children: [
              Icon(Icons.remove_red_eye,color: Colors.white,),
              SizedBox(width: 5,),
              Text(
                'Preview',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: isTablet? 17 : width <= 330 ? 17 : 15,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );

var doctorName=Padding(
  padding: const EdgeInsets.only(left:18.0,right:18),
  child: TypeAheadFormField<CompanyItem>(
    textFieldConfiguration: TextFieldConfiguration(
        textInputAction: TextInputAction.search,
        //controller: bookTestController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 10),
          labelText: "Doctor Name",
          labelStyle: TextStyle(color: Color(0xff3E58FF)),
          //hintText: "Route",
          //hintStyle: TextStyle(color: Colors.grey),
          // prefixIcon: Icon(
          //   Icons.search,
          //   color: Colors.grey,
          // ),
          suffix: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: HexColor("#D2D2D2"),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Color(0xff3E58FF)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0),
          ),
        )),
    itemBuilder: (_, v) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("${v.companyName}"),
      );
    },
    onSuggestionSelected: (v) async {
      // bookTestController.text = v.companyName;
      // await vm.companyInfo(companyNo: v.companyNo);
      // testItemVm.getData(companyNo: vm.companyNo);
      // testItemVm.getMoreData(companyNo: vm.companyNo);
      // setState(() {});
    },
    suggestionsBoxDecoration: SuggestionsBoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    suggestionsCallback: (v) {
      // return vm.companyList.items.where((element) => element
      //     .companyName
      //     .toString()
      //     .toLowerCase()
      //     .contains(v.toLowerCase()));
    },
  ),
);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back)),
        title: Text("MHB-APPADMIN"),
        backgroundColor: AppTheme.appbarPrimary,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Badge(
              position: BadgePosition.topEnd(top: 5, end: 8),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.scale,
              badgeContent: Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  icon: Icon(Icons.notifications),
                  padding: EdgeInsets.only(right: 5.0),
                  onPressed: () {
                  }),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: HexColor('#E9ECFE'),
                child: TabBar(
                  indicatorColor: HexColor('#8592E5'),
                  indicatorWeight: 4,
                  tabs: [
                    ...[
                      "Appointment Report",
                      'Doctor Schedule',
                    ].map(
                          (e) => FittedBox(
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Text(
                                e,
                                style: GoogleFonts.roboto(
                                    color: HexColor(
                                      '#354291',
                                    ),
                                    fontSize: isMobile ? 12 : 20,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RefreshIndicator(
                      onRefresh: () {},
                      child: Scaffold(
                          body: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 350,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15,),
                                      organizationName,
                                      SizedBox(height: 15,),
                                      companyName,
                                      SizedBox(height: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:18.0,right:18),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            fromDate,
                                            toDate,
                                            shift,

                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      doctorName,
                                      SizedBox(height: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:18.0,right: 18),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            downloadButton,
                                            SizedBox(width: 15,),
                                            previewButton
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        SizedBox(height: 20,),
                        ExpandableNotifier(
                              controller:controller,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: isTablet ? 20 : 10,
                                  right: isTablet ? 20 : 10,
                                  top: isTablet ? 10 : 5,
                                  bottom: isTablet ? 10 : 5,
                                ),
                                child: ScrollOnExpand(
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      children: <Widget>[
                                        ExpandablePanel(
                                          controller:controller,
                                          theme: ExpandableThemeData(
                                            headerAlignment: ExpandablePanelHeaderAlignment.center,
                                            tapBodyToExpand: true,
                                            tapBodyToCollapse: true,
                                            hasIcon: false,
                                          ),
                                          header: Container(
                                            decoration: BoxDecoration(
                                              color: AppTheme.buttonActiveColor,
                                              border: Border(
                                                top: BorderSide(
                                                  color: AppTheme.buttonActiveColor,
                                                ),
                                                right: BorderSide(
                                                  color:AppTheme.buttonActiveColor,
                                                ),
                                                left: BorderSide(
                                                  color:  AppTheme.buttonActiveColor,
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: isTablet ? 140 : 30,
                                                              width: isTablet
                                                                  ? 180
                                                                  : width < 330
                                                                  ? 20
                                                                  : 80,
                                                              child: Image.asset(
                                                                "assets/icons/dct.png",
                                                                fit: BoxFit.contain,
                                                              ),
                                                            ),
                                                            SizedBox(width: 8,),
                                                            Text(
                                                              "Assoc. Prof. Dr. Mahmud Rahim",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .copyWith(
                                                                  color:  Colors.white,
                                                                  fontSize: isTablet ? 18 : 16),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      ExpandableIcon(
                                                        theme: ExpandableThemeData(
                                                          expandIcon:
                                                          Icons.keyboard_arrow_down_outlined,
                                                          collapseIcon:
                                                          Icons.keyboard_arrow_up_outlined,
                                                          iconColor: Colors.white,
                                                          iconSize: isTablet ? 35 : 28.0,
                                                          iconRotationAngle: math.pi / 2,
                                                          iconPadding: EdgeInsets.only(right: 5),
                                                          hasIcon: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: isTablet ? 8 : 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height:40,
                                                  decoration:  BoxDecoration(
                                                    color: HexColor('#E9ECFE'),
                                                    border: Border(
                                                      bottom: BorderSide( //                    <--- top side
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                    width:double.infinity,
                                                    child: Center(child: Text('Today , 22 February 2021 (5)',style: TextStyle(fontSize: 15,color: Colors.grey),)),
                                                  ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'New Patient (3)',
                                                  style: GoogleFonts.poppins(
                                                    // color: HexColor(
                                                    //   '#354291',
                                                    // ),
                                                      fontSize: isTablet
                                                          ? 20
                                                          : width <= 330
                                                          ? 13
                                                          : 16,
                                                      fontWeight: FontWeight.w500,color: Color(0xff6374DF)),
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 200,
                                                    decoration:BoxDecoration(
                                                        borderRadius:  BorderRadius.all(
                                                         Radius.circular(10.0),
                                                        ),
                                                        border: Border.all(color: Colors.grey)
                                                    ),
                                                    child:  ListView.separated(
                                                        itemCount: 8,
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (BuildContext context,
                                                            int index) {
                                                          return Padding(
                                                            padding:
                                                            const EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 10,bottom: 8),
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Container(
                                                                        width: isTablet
                                                                            ? MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                            0.65
                                                                            : width <=
                                                                            330
                                                                            ? MediaQuery.of(context).size.width *
                                                                            0.50
                                                                            : MediaQuery.of(context).size.width *
                                                                            0.50,
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'Name: ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                                Text(
                                                                                  'Jahid Hasan kakon ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500,color: Color(0xffFFBC64)),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'App ID: ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                                Text(
                                                                                  '22107018771 ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500,color: Color(0xff56CF8A)),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'Start Time: ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                                Text(
                                                                                  '10:00 AM ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w400),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                              Align(
                                                                alignment: Alignment.centerRight,
                                                                child: FlatButton(
                                                                    minWidth: isTablet? width*.4 : width * .45,
                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                    color: AppTheme.buttonInActiveColor,
                                                                    onPressed: () async {
                                                                      showAlert(context);
                                                                    },
                                                                    child:Row(
                                                                      children: [
                                                                        Text(
                                                                          'Details',
                                                                          style: GoogleFonts.roboto(
                                                                              color: Colors.white,
                                                                              fontSize: isTablet? 17 : width <= 330 ? 17 : 15,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ],
                                                                    )),
                                                              ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return Divider();
                                                        }),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '1st Follow Up (2)',
                                                  style: GoogleFonts.poppins(
                                                    // color: HexColor(
                                                    //   '#354291',
                                                    // ),
                                                      fontSize: isTablet
                                                          ? 20
                                                          : width <= 330
                                                          ? 13
                                                          : 16,
                                                      fontWeight: FontWeight.w500,color: Color(0xff6374DF)),
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 200,
                                                    decoration:BoxDecoration(
                                                        borderRadius:  BorderRadius.all(
                                                          Radius.circular(10.0),
                                                        ),
                                                        border: Border.all(color: Colors.grey)
                                                    ),
                                                    child:  ListView.separated(
                                                        itemCount: 8,
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (BuildContext context,
                                                            int index) {
                                                          return Padding(
                                                            padding:
                                                            const EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 10,bottom: 8),
                                                            child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Container(
                                                                        width: isTablet
                                                                            ? MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                            0.65
                                                                            : width <=
                                                                            330
                                                                            ? MediaQuery.of(context).size.width *
                                                                            0.50
                                                                            : MediaQuery.of(context).size.width *
                                                                            0.50,
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'Name: ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                                Text(
                                                                                  'Jahid Hasan kakon ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500,color: Color(0xffFFBC64)),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'App ID: ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                                Text(
                                                                                  '22107018771 ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500,color: Color(0xff56CF8A)),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'Start Time: ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w500),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                                Text(
                                                                                  '10:00 AM ',
                                                                                  style: GoogleFonts.poppins(
                                                                                    // color: HexColor(
                                                                                    //   '#354291',
                                                                                    // ),
                                                                                      fontSize: isTablet
                                                                                          ? 20
                                                                                          : width <= 330
                                                                                          ? 13
                                                                                          : 16,
                                                                                      fontWeight: FontWeight.w400),
                                                                                  maxLines: 1,
                                                                                  overflow:
                                                                                  TextOverflow
                                                                                      .ellipsis,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  Align(
                                                                    alignment: Alignment.centerRight,
                                                                    child: FlatButton(
                                                                        minWidth: isTablet? width*.4 : width * .45,
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        color: AppTheme.buttonInActiveColor,
                                                                        onPressed: () async {
                                                                          showAlert(context);
                                                                        },
                                                                        child:Row(
                                                                          children: [
                                                                            Text(
                                                                              'Details',
                                                                              style: GoogleFonts.roboto(
                                                                                  color: Colors.white,
                                                                                  fontSize: isTablet? 17 : width <= 330 ? 17 : 15,
                                                                                  fontWeight: FontWeight.w600),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return Divider();
                                                        }),
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                              ],
                            ),
                          ))),

                 //Doctor Schedule
                  RefreshIndicator(
                      onRefresh: () {},
                      child: Scaffold(
                          body: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:18.0,right:18),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            docFromDate,
                                            docToDate,
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      doctorName,
                                      SizedBox(height: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:18.0,right: 18),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            downloadButton,
                                            SizedBox(width: 15,),
                                            previewButton
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,),
                                ExpandableNotifier(
                                    controller:controller2,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: isTablet ? 20 : 10,
                                        right: isTablet ? 20 : 10,
                                        top: isTablet ? 10 : 5,
                                        bottom: isTablet ? 10 : 5,
                                      ),
                                      child: ScrollOnExpand(
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          child: Column(
                                            children: <Widget>[
                                              ExpandablePanel(
                                                controller:controller2,
                                                theme: ExpandableThemeData(
                                                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                  tapBodyToExpand: true,
                                                  tapBodyToCollapse: true,
                                                  hasIcon: false,
                                                ),
                                                header: Container(
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.buttonActiveColor,
                                                    border: Border(
                                                      top: BorderSide(
                                                        color: AppTheme.buttonActiveColor,
                                                      ),
                                                      right: BorderSide(
                                                        color:AppTheme.buttonActiveColor,
                                                      ),
                                                      left: BorderSide(
                                                        color:  AppTheme.buttonActiveColor,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(10.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: isTablet ? 140 : 30,
                                                                    width: isTablet
                                                                        ? 180
                                                                        : width < 330
                                                                        ? 20
                                                                        : 80,
                                                                    child: Image.asset(
                                                                      "assets/icons/dct.png",
                                                                      fit: BoxFit.contain,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 8,),
                                                                  Text(
                                                                    "Assoc. Prof. Dr. Mahmud Rahim",
                                                                    style: Theme.of(context)
                                                                        .textTheme
                                                                        .bodyText1
                                                                        .copyWith(
                                                                        color:  Colors.white,
                                                                        fontSize: isTablet ? 18 : 16),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            ExpandableIcon(
                                                              theme: ExpandableThemeData(
                                                                expandIcon:
                                                                Icons.keyboard_arrow_down_outlined,
                                                                collapseIcon:
                                                                Icons.keyboard_arrow_up_outlined,
                                                                iconColor: Colors.white,
                                                                iconSize: isTablet ? 35 : 28.0,
                                                                iconRotationAngle: math.pi / 2,
                                                                iconPadding: EdgeInsets.only(right: 5),
                                                                hasIcon: false,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: isTablet ? 8 : 5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                collapsed: Container(),
                                                expanded: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: ListView.separated(
                                                            itemCount: 8,
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (BuildContext context,
                                                                int index) {
                                                              return Padding(
                                                                padding:
                                                                const EdgeInsets.only(
                                                                    left: 10.0,
                                                                    right: 10,bottom: 8),
                                                                child: Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                            children: [
                                                                              Container(
                                                                                width: isTablet
                                                                                    ? MediaQuery.of(context)
                                                                                    .size
                                                                                    .width *
                                                                                    0.65
                                                                                    : width <=
                                                                                    330
                                                                                    ? MediaQuery.of(context).size.width *
                                                                                    0.50
                                                                                    : MediaQuery.of(context).size.width *
                                                                                    0.50,
                                                                                child: Column(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'Name: ',
                                                                                          style: GoogleFonts.poppins(
                                                                                            // color: HexColor(
                                                                                            //   '#354291',
                                                                                            // ),
                                                                                              fontSize: isTablet
                                                                                                  ? 20
                                                                                                  : width <= 330
                                                                                                  ? 13
                                                                                                  : 16,
                                                                                              fontWeight: FontWeight.w500),
                                                                                          maxLines: 1,
                                                                                          overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                        ),
                                                                                        Text(
                                                                                          'Jahid Hasan kakon ',
                                                                                          style: GoogleFonts.poppins(
                                                                                            // color: HexColor(
                                                                                            //   '#354291',
                                                                                            // ),
                                                                                              fontSize: isTablet
                                                                                                  ? 20
                                                                                                  : width <= 330
                                                                                                  ? 13
                                                                                                  : 16,
                                                                                              fontWeight: FontWeight.w500,color: Color(0xffFFBC64)),
                                                                                          maxLines: 1,
                                                                                          overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'App ID: ',
                                                                                          style: GoogleFonts.poppins(
                                                                                            // color: HexColor(
                                                                                            //   '#354291',
                                                                                            // ),
                                                                                              fontSize: isTablet
                                                                                                  ? 20
                                                                                                  : width <= 330
                                                                                                  ? 13
                                                                                                  : 16,
                                                                                              fontWeight: FontWeight.w500),
                                                                                          maxLines: 1,
                                                                                          overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                        ),
                                                                                        Text(
                                                                                          '22107018771 ',
                                                                                          style: GoogleFonts.poppins(
                                                                                            // color: HexColor(
                                                                                            //   '#354291',
                                                                                            // ),
                                                                                              fontSize: isTablet
                                                                                                  ? 20
                                                                                                  : width <= 330
                                                                                                  ? 13
                                                                                                  : 16,
                                                                                              fontWeight: FontWeight.w500,color: Color(0xff56CF8A)),
                                                                                          maxLines: 1,
                                                                                          overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          'Start Time: ',
                                                                                          style: GoogleFonts.poppins(
                                                                                            // color: HexColor(
                                                                                            //   '#354291',
                                                                                            // ),
                                                                                              fontSize: isTablet
                                                                                                  ? 20
                                                                                                  : width <= 330
                                                                                                  ? 13
                                                                                                  : 16,
                                                                                              fontWeight: FontWeight.w500),
                                                                                          maxLines: 1,
                                                                                          overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                        ),
                                                                                        Text(
                                                                                          '10:00 AM ',
                                                                                          style: GoogleFonts.poppins(
                                                                                            // color: HexColor(
                                                                                            //   '#354291',
                                                                                            // ),
                                                                                              fontSize: isTablet
                                                                                                  ? 20
                                                                                                  : width <= 330
                                                                                                  ? 13
                                                                                                  : 16,
                                                                                              fontWeight: FontWeight.w400),
                                                                                          maxLines: 1,
                                                                                          overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Spacer(),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                            children: [
                                                                              Text(
                                                                                'New Patient ',
                                                                                style: GoogleFonts.poppins(
                                                                                  // color: HexColor(
                                                                                  //   '#354291',
                                                                                  // ),
                                                                                    fontSize: isTablet
                                                                                        ? 20
                                                                                        : width <= 330
                                                                                        ? 13
                                                                                        : 16,
                                                                                    fontWeight: FontWeight.w500,color: Color(0xff56CF8A)),
                                                                                maxLines: 1,
                                                                                overflow:
                                                                                TextOverflow
                                                                                    .ellipsis,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    'Total Sale: ',
                                                                                    style: GoogleFonts.poppins(
                                                                                      // color: HexColor(
                                                                                      //   '#354291',
                                                                                      // ),
                                                                                        fontSize: isTablet
                                                                                            ? 20
                                                                                            : width <= 330
                                                                                            ? 13
                                                                                            : 16,
                                                                                        fontWeight: FontWeight.w500),
                                                                                    maxLines: 1,
                                                                                    overflow:
                                                                                    TextOverflow
                                                                                        .ellipsis,
                                                                                  ),
                                                                                  Text(
                                                                                    '800 ',
                                                                                    style: GoogleFonts.poppins(
                                                                                      // color: HexColor(
                                                                                      //   '#354291',
                                                                                      // ),
                                                                                        fontSize: isTablet
                                                                                            ? 20
                                                                                            : width <= 330
                                                                                            ? 13
                                                                                            : 16,
                                                                                        fontWeight: FontWeight.w500,color: Color(0xff535EA1)),
                                                                                    maxLines: 1,
                                                                                    overflow:
                                                                                    TextOverflow
                                                                                        .ellipsis,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    'Net Collec: ',
                                                                                    style: GoogleFonts.poppins(
                                                                                      // color: HexColor(
                                                                                      //   '#354291',
                                                                                      // ),
                                                                                        fontSize: isTablet
                                                                                            ? 20
                                                                                            : width <= 330
                                                                                            ? 13
                                                                                            : 16,
                                                                                        fontWeight: FontWeight.w500),
                                                                                    maxLines: 1,
                                                                                    overflow:
                                                                                    TextOverflow
                                                                                        .ellipsis,
                                                                                  ),
                                                                                  Text(
                                                                                    '800 ',
                                                                                    style: GoogleFonts.poppins(
                                                                                      // color: HexColor(
                                                                                      //   '#354291',
                                                                                      // ),
                                                                                        fontSize: isTablet
                                                                                            ? 20
                                                                                            : width <= 330
                                                                                            ? 13
                                                                                            : 16,
                                                                                        fontWeight: FontWeight.w400,color: Color(0xff535EA1)),
                                                                                    maxLines: 1,
                                                                                    overflow:
                                                                                    TextOverflow
                                                                                        .ellipsis,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.only(left:80.0,right:80 ),
                                                                          child: FlatButton(
                                                                              minWidth: isTablet? width*.4 : width * .45,
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                              color: AppTheme.buttonInActiveColor,
                                                                              onPressed: () async {
                                                                                showAlert(context);
                                                                              },
                                                                              child:Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'View Details',
                                                                                    style: GoogleFonts.roboto(
                                                                                        color: Colors.white,
                                                                                        fontSize: isTablet? 17 : width <= 330 ? 17 : 15,
                                                                                        fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            separatorBuilder:
                                                                (context, index) {
                                                              return Divider();
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Material(
            color: Colors.transparent, child: AdminPopup()));
  }
}
