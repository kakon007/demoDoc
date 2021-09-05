import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/view_model/doctor_document_view_model.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/view_model/prescription_list_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/pdf_viewer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:http/http.dart' as http;

class EmrScreen extends StatefulWidget {
  String id;
  DateTime pickBirthDate;
  DateTime pickBirthDate2;
  int regNo;
  int docNo;
  EmrScreen({this.id,this.pickBirthDate,this.pickBirthDate2,this.regNo,this.docNo});
  @override
  _EmrScreenState createState() => _EmrScreenState();
}

class _EmrScreenState extends State<EmrScreen> {
  int indexx=0;
  TextEditingController _searchValueForDocumentation = TextEditingController();
  TextEditingController _searchValueForPrescription = TextEditingController();

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

      initialDate: widget.pickBirthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null && date != widget.pickBirthDate) {
      setState(() {
        widget.pickBirthDate = date;
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

      initialDate: widget.pickBirthDate2,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null && date != widget.pickBirthDate2) {
      setState(() {
        widget.pickBirthDate2 = date;
      });
    }
  }

  Future fetchPDF(String index) async {
    try {
      print("FETCHPDFDATA");
      print('INDEX' + index);
      var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
      var headers = {'Authorization': 'Bearer $accessToken'};
      var request = http.MultipartRequest('POST', Uri.parse(Urls.prescriptionViewUrl));
      request.fields.addAll({'prescriptionId': index, 'pClient': 'aalok', 'pLayout': '1'});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print('impress ${response.statusCode}');
      if (response.statusCode == 200) {
        var body = await response.stream.toBytes();
        print("BODYOFSTRING:::" + body.toString());
        return body;
      } else {
        print("ERROROFSTRING::::" + response.reasonPhrase);
        return null;
      }
    } on Exception catch (e) {
      // TODO
      print("PDFDATAERROR");
      print(e.toString());
      return null;
    }
  }

  Future<File> _createPdfFileFromString(String index) async {
    SVProgressHUD.show(status: 'Opening Pdf');
    String dir = (await pp.getApplicationDocumentsDirectory()).path;
    File file = File("$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
    await file.writeAsBytes(await fetchPDF(index), flush: true);
    print("FILEEEEE" + file.toString());
    SVProgressHUD.dismiss();
    return file;
  }

  @override
  void initState() {
    // TODO: implement initState
    var vm=Provider.of<PrescriptionListDocViewModel>(context,listen: false);
    vm.getData(fromDate: widget.pickBirthDate,todate: widget.pickBirthDate2,id: widget.id);
    var vm2=Provider.of<DoctorDocumentationListDocViewModel>(context,listen: false);
    vm2.getData(regNo: widget.regNo,doctorNo: widget.docNo);
    print('ctt $indexx');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    var vm=Provider.of<PrescriptionListDocViewModel>(context,listen: true);
    var vm2=Provider.of<DoctorDocumentationListDocViewModel>(context);


    print('Date ${widget.pickBirthDate}');
    print('Date2 ${widget.pickBirthDate2}');

    var searchFieldForDocument = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: isTablet
              ? width * .85
              : width <= 330
              ? 280
              : 290,
          child: TextField(
            // onChanged: (value) {
            //   vm.getWorkListData(
            //       toDate: toDate, fromDate: fromDate, searchValue: value,shift: vm.shift);
            // },
              onSubmitted: (value) {
                vm2.getData(
                    regNo: widget.regNo,doctorNo: widget.docNo,
                    searchValue: value,);
              },
             controller: _searchValueForDocumentation,
              decoration: new InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                hintText: "Search Here",
                hintStyle: GoogleFonts.poppins(
                    fontSize: isTablet
                        ? 17
                        : width < 350
                        ? 12
                        : 14.0,
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#D2D2D2"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: new BorderSide(color: Colors.grey)),
                contentPadding: width < 350
                    ? EdgeInsets.fromLTRB(15.0, 0.0, 40.0, 0.0)
                    : EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
              )),
        ),
      ],
    );

    var searchFieldForPrescription = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: isTablet
              ? width * .85
              : width <= 330
              ? 280
              : 290,
          child: TextField(
            // onChanged: (value) {
            //   vm.getWorkListData(
            //       toDate: toDate, fromDate: fromDate, searchValue: value,shift: vm.shift);
            // },
              onSubmitted: (value) {
                vm.getData(fromDate: widget.pickBirthDate,todate: widget.pickBirthDate2,id: widget.id,searchValue: value);
              },
              controller: _searchValueForPrescription,
              decoration: new InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                hintText: "Search Here",
                hintStyle: GoogleFonts.poppins(
                    fontSize: isTablet
                        ? 17
                        : width < 350
                        ? 12
                        : 14.0,
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#D2D2D2"), width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: new BorderSide(color: Colors.grey)),
                contentPadding: width < 350
                    ? EdgeInsets.fromLTRB(15.0, 0.0, 40.0, 0.0)
                    : EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
              )),
        ),
      ],
    );

    var fromDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 20.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(StringResources.fromText,
                    style: GoogleFonts.roboto(fontSize: isTablet ? 15 : 12)),
              )),
          Container(
            height: 45,
            // width:MediaQuery.of(context).size.width>350?140:100,
            width: isTablet
                ? MediaQuery.of(context).size.width * 0.35
                : width <= 330
                ? MediaQuery.of(context).size.width *
                0.32
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
                    widget.pickBirthDate == DateTime.now()
                        ? "Date of birth"
                        : "${DateFormat("dd-MM-yyyy").format(widget.pickBirthDate)}",
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

    var toDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 20.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(StringResources.fromText,
                    style: GoogleFonts.roboto(fontSize: isTablet ? 15 : 12)),
              )),
          Container(
            height: 45,
            // width:MediaQuery.of(context).size.width>350?140:100,
            width: isTablet
                ? MediaQuery.of(context).size.width * 0.35
                : width <= 330
                ? MediaQuery.of(context).size.width *
                0.32
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
                    widget.pickBirthDate2 == DateTime.now()
                        ? "Date of birth"
                        : "${DateFormat("dd-MM-yyyy").format(widget.pickBirthDate2)}",
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141D53),
        title: Text(
          'EMR',
          key: Key('emrAppbarKey'),
          style: GoogleFonts.poppins(
              fontSize: isTablet ? 20 : 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 215.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: HexColor("#FFFFFF"),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#E4E4E4"),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            searchFieldForDocument,
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, left: 25),
                              child: SvgPicture.asset(
                                "assets/icons/fliter.svg",
                                key: Key('filterIconKey'),
                                width: 10,
                                height: 18,
                                fit: BoxFit.fitWidth,
                                allowDrawingOutsideViewBox: true,
                                matchTextDirection: true,
                                color: Colors.grey.withOpacity(0.5),
                                //semanticsLabel: 'Acme Logo'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: DefaultTabController(
                            length: 4,
                              child: Builder(

                                builder: (context) {
                                  return Scaffold(
                            backgroundColor: Colors.white,
                            body: Column(
                                      children: [
                                        Container(
                                          constraints:
                                          BoxConstraints(maxHeight: 150.0),
                                          child: Material(
                                            color: Colors.white,
                                            child: TabBar(
                                              onTap: (int index) {
                                                indexx=DefaultTabController.of(context).index;
                                                print(
                                                    'Current Index: $indexx');
                                              },
                                              isScrollable: true,
                                              indicator: UnderlineTabIndicator(
                                                  borderSide: BorderSide(
                                                    width: 3.0,
                                                    color: HexColor('#8592E5'),
                                                  ),
                                                  insets: EdgeInsets.only(
                                                    left: 30,
                                                    right: 30,
                                                  )),
                                              // labelPadding: EdgeInsets.only(left: 0, right: 20),
                                              unselectedLabelColor: Colors.grey,
                                              labelColor: Colors.black,
                                              labelStyle: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 12
                                                      : 15,
                                                  fontWeight: FontWeight
                                                      .w500), //For Selected tab
                                              unselectedLabelStyle:
                                              GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 11
                                                      : 13,
                                                  fontWeight: FontWeight
                                                      .w500), //For Un-selected Tabs
                                              tabs: [
                                                Container(
                                                  height: 40,
                                                  //width: 10.0,
                                                  child: Center(
                                                      child: Text(
                                                        'Prescriptions',
                                                      )),
                                                ),
                                                Container(
                                                  height: 40,
                                                  child: Center(
                                                      child: Text(
                                                        'Pathology',
                                                        //key: Key('reportsTabKey'),
                                                      )),
                                                ),
                                                Container(
                                                  height: 40,
                                                  //width: 30.0,
                                                  child: Center(
                                                      child: Text(
                                                        'Imaging',
                                                        //key: Key('documentationTabKey'),
                                                      )),
                                                ),
                                                Container(
                                                  height: 40,
                                                  //width: 30.0,
                                                  child: Center(
                                                      child: Text(
                                                        'Documents',
                                                        //key: Key('documentationTabKey'),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Expanded(
                                          child: TabBarView(
                                            physics: NeverScrollableScrollPhysics(),
                                            children: [
                                              Scaffold(
                                                backgroundColor: Colors.white,
                                                body: vm.prescriptionList.length == 0
                                                    ?
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'No prescription available now',
                                                          textAlign: TextAlign.center,
                                                          style: GoogleFonts.poppins(
                                                              color: HexColor('#AEB0BA'),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: isTablet ? 22 : 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                    :ListView.separated(
                                                    itemCount: vm.prescriptionList.length,
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
                                                                    child: Text(
                                                                      vm.prescriptionList[index].doctorName,
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
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                        12.0),
                                                                    child: Row(
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          "assets/icons/calendoc.svg",
                                                                          //key: Key('filterIconKey'),
                                                                          width: 10,
                                                                          height:
                                                                          18,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                          allowDrawingOutsideViewBox:
                                                                          true,
                                                                          matchTextDirection:
                                                                          true,
                                                                          color: Color(
                                                                              0xffAFBBFF),
                                                                          //semanticsLabel: 'Acme Logo'
                                                                        ),
                                                                        SizedBox(
                                                                          width: 8,
                                                                        ),
                                                                        Text(
                                                                          DateUtil().formattedDate(DateTime.parse(vm.prescriptionList[index].ssCreatedOn)),
                                                                          style: GoogleFonts.poppins(
                                                                            // color: HexColor(
                                                                            //   '#354291',
                                                                            // ),
                                                                              fontSize: isTablet
                                                                                  ? 20
                                                                                  : width <= 330
                                                                                  ? 12
                                                                                  : 15,
                                                                              color: Colors.grey),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Spacer(),
                                                              InkWell(
                                                                onTap: () async {
                                                                  final file =
                                                                  vm.prescriptionList[index].id ==
                                                                      null
                                                                      ? Fluttertoast.showToast(
                                                                      msg: 'Prescription Not Saved yet!')
                                                                      : await _createPdfFileFromString(vm
                                                                      .prescriptionList[index]
                                                                      .id
                                                                      .toString());
                                                                  vm.prescriptionList[index].id ==
                                                                      null
                                                                      ? Fluttertoast.showToast(
                                                                      msg: 'Prescription Not Saved yet!')
                                                                      : Navigator.push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType.rightToLeft,
                                                                      child: PdfFileViewerScreen(
                                                                          file,
                                                                          vm.prescriptionList[index]
                                                                              .consultationId),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Material(
                                                                  elevation: 0,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          5)),
                                                                  color: HexColor(
                                                                      "#6374DF"),
                                                                  child: SizedBox(
                                                                    width: isTablet
                                                                        ? 170
                                                                        : deviceWidth <=
                                                                        360 &&
                                                                        deviceWidth >
                                                                            330
                                                                        ? 90
                                                                        : deviceWidth <=
                                                                        330
                                                                        ? 50
                                                                        : 80,
                                                                    height:
                                                                    deviceWidth <=
                                                                        360
                                                                        ? 28
                                                                        : 25,
                                                                    child: Center(
                                                                      child: Text(
                                                                        "View",
                                                                        key: Key(
                                                                            'rebookKey$index'),
                                                                        style: GoogleFonts.roboto(
                                                                            color: Colors.white,
                                                                            fontSize: isTablet
                                                                                ? 15
                                                                                : deviceWidth <= 360 && deviceWidth > 330
                                                                                ? 9
                                                                                : deviceWidth <= 330
                                                                                ? 8
                                                                                : 10,
                                                                            fontWeight: FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                  ),
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

                                              //Pathology
                                              Scaffold(
                                                backgroundColor: Colors.white,
                                                body: SingleChildScrollView(
                                                  child: ListView.separated(
                                                      itemCount: 4,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                          int index) {
                                                        return Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10),
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
                                                                      // width: MediaQuery.of(context)
                                                                      //             .size
                                                                      //             .width >
                                                                      //         350
                                                                      //     ? 220
                                                                      //     : 200,
                                                                      child: Text(
                                                                        '1. Blood test lab report.jpg',
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
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                          12.0),
                                                                      child: Row(
                                                                        children: [
                                                                          SvgPicture
                                                                              .asset(
                                                                            "assets/icons/calendoc.svg",
                                                                            //key: Key('filterIconKey'),
                                                                            width: 10,
                                                                            height:
                                                                            18,
                                                                            fit: BoxFit
                                                                                .fitWidth,
                                                                            allowDrawingOutsideViewBox:
                                                                            true,
                                                                            matchTextDirection:
                                                                            true,
                                                                            //color:  Colors.grey.withOpacity(0.5),
                                                                            //semanticsLabel: 'Acme Logo'
                                                                          ),
                                                                          SizedBox(
                                                                            width: 8,
                                                                          ),
                                                                          Text(
                                                                            '22 February 2021',
                                                                            style: GoogleFonts.poppins(
                                                                              // color: HexColor(
                                                                              //   '#354291',
                                                                              // ),
                                                                                fontSize: isTablet
                                                                                    ? 20
                                                                                    : width <= 330
                                                                                    ? 12
                                                                                    : 15,
                                                                                color: Colors.grey),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Spacer(),
                                                                Material(
                                                                  elevation: 0,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          5)),
                                                                  color: HexColor(
                                                                      "#6374DF"),
                                                                  child: SizedBox(
                                                                    width: isTablet
                                                                        ? 170
                                                                        : deviceWidth <=
                                                                        360 &&
                                                                        deviceWidth >
                                                                            330
                                                                        ? 105
                                                                        : deviceWidth <=
                                                                        330
                                                                        ? 50
                                                                        : 80,
                                                                    height:
                                                                    deviceWidth <=
                                                                        360
                                                                        ? 28
                                                                        : 25,
                                                                    child: Center(
                                                                      child: Text(
                                                                        "View",
                                                                        key: Key(
                                                                            'rebookKey$index'),
                                                                        style: GoogleFonts.roboto(
                                                                            color: Colors.white,
                                                                            fontSize: isTablet
                                                                                ? 15
                                                                                : deviceWidth <= 360 && deviceWidth > 330
                                                                                ? 9
                                                                                : deviceWidth <= 330
                                                                                ? 8
                                                                                : 10,
                                                                            fontWeight: FontWeight.w700),
                                                                      ),
                                                                    ),
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
                                              ),

                                              //Imaging

                                              Scaffold(
                                                backgroundColor: Colors.white,
                                                body: SingleChildScrollView(
                                                  child: ListView.separated(
                                                      itemCount: 4,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                          int index) {
                                                        return Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10),
                                                          child: Container(
                                                            child: Row(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Container(
                                                                      // width: MediaQuery.of(context)
                                                                      //             .size
                                                                      //             .width >
                                                                      //         350
                                                                      //     ? 220
                                                                      //     : 200,
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
                                                                      child: Text(
                                                                        '1. X-Ray Image.jpg',
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
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                          12.0),
                                                                      child: Row(
                                                                        children: [
                                                                          SvgPicture
                                                                              .asset(
                                                                            "assets/icons/calendoc.svg",
                                                                            //key: Key('filterIconKey'),
                                                                            width: 10,
                                                                            height:
                                                                            18,
                                                                            fit: BoxFit
                                                                                .fitWidth,
                                                                            allowDrawingOutsideViewBox:
                                                                            true,
                                                                            matchTextDirection:
                                                                            true,
                                                                            //color:  Colors.grey.withOpacity(0.5),
                                                                            //semanticsLabel: 'Acme Logo'
                                                                          ),
                                                                          SizedBox(
                                                                            width: 8,
                                                                          ),
                                                                          Text(
                                                                            '22 February 2021',
                                                                            style: GoogleFonts.poppins(
                                                                              // color: HexColor(
                                                                              //   '#354291',
                                                                              // ),
                                                                                fontSize: isTablet
                                                                                    ? 20
                                                                                    : width <= 330
                                                                                    ? 12
                                                                                    : 15,
                                                                                color: Colors.grey),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Spacer(),
                                                                Material(
                                                                  elevation: 0,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          5)),
                                                                  color: Color(
                                                                      0xff6374DF),
                                                                  child: SizedBox(
                                                                    width: isTablet
                                                                        ? 170
                                                                        : deviceWidth <=
                                                                        360 &&
                                                                        deviceWidth >
                                                                            330
                                                                        ? 105
                                                                        : deviceWidth <=
                                                                        330
                                                                        ? 50
                                                                        : 80,
                                                                    height:
                                                                    deviceWidth <=
                                                                        360
                                                                        ? 28
                                                                        : 25,
                                                                    child: Center(
                                                                      child: Text(
                                                                        "View",
                                                                        //key: Key('rebookKey$index'),
                                                                        style: GoogleFonts.roboto(
                                                                            color: Colors.white,
                                                                            fontSize: isTablet
                                                                                ? 15
                                                                                : deviceWidth <= 360 && deviceWidth > 330
                                                                                ? 9
                                                                                : deviceWidth <= 330
                                                                                ? 8
                                                                                : 10,
                                                                            fontWeight: FontWeight.w700),
                                                                      ),
                                                                    ),
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
                                              ),

                                              //Documents
                                              Scaffold(
                                                backgroundColor: Colors.white,
                                                body: vm2.documentationList.length == 0
                                                    ?
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'No documentation available now',
                                                          textAlign: TextAlign.center,
                                                          style: GoogleFonts.poppins(
                                                              color: HexColor('#AEB0BA'),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: isTablet ? 22 : 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ):ListView.separated(
                                                    itemCount: vm2.documentationList.length,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                        int index) {
                                                      return Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10),
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
                                                                    child: Text(
                                                                      vm2.documentationList[index].attachmentName,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize: isTablet
                                                                              ? 20
                                                                              : width <= 330
                                                                              ? 13
                                                                              : 16,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                        12.0),
                                                                    child: Row(
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          "assets/icons/calendoc.svg",
                                                                          //key: Key('filterIconKey'),
                                                                          width: 10,
                                                                          height:
                                                                          18,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                          allowDrawingOutsideViewBox:
                                                                          true,
                                                                          matchTextDirection:
                                                                          true,
                                                                          //color:  Colors.grey.withOpacity(0.5),
                                                                          //semanticsLabel: 'Acme Logo'
                                                                        ),
                                                                        SizedBox(
                                                                          width: 8,
                                                                        ),
                                                                        Text(
                                                                          DateUtil().formattedDate(DateTime.parse(vm2.documentationList[index].reportDate??DateTime.now())),
                                                                          style: GoogleFonts.poppins(
                                                                            // color: HexColor(
                                                                            //   '#354291',
                                                                            // ),
                                                                              fontSize: isTablet
                                                                                  ? 20
                                                                                  : width <= 330
                                                                                  ? 12
                                                                                  : 15,
                                                                              color: Colors.grey),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Spacer(),
                                                              InkWell(
                                                                onTap: (){
                                                                  String fileExt = vm2
                                                                      .documentationList[index].attachmentPath
                                                                      .split('.')
                                                                      .last;
                                                                  Navigator.push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType.rightToLeft,
                                                                      child: fileExt == 'pdf'
                                                                          ? DoctorPdfByteViewerScreen(
                                                                          vm2
                                                                              .documentationList[index]
                                                                              .attachmentPath,
                                                                          vm2
                                                                              .documentationList[index]
                                                                              .attachmentName)
                                                                          : DoctorImagebyteViewerScreen(
                                                                          vm2
                                                                              .documentationList[index]
                                                                              .attachmentPath,
                                                                          vm2
                                                                              .documentationList[index]
                                                                              .attachmentName),
                                                                    ),
                                                                  );

                                                                  print('PDFPRESSEDFrom DOc');
                                                                },
                                                                child: Material(
                                                                  elevation: 0,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          5)),
                                                                  color: HexColor(
                                                                      "#6374DF"),
                                                                  child: SizedBox(
                                                                    width: isTablet
                                                                        ? 170
                                                                        : deviceWidth <=
                                                                        360 &&
                                                                        deviceWidth >
                                                                            330
                                                                        ? 105
                                                                        : deviceWidth <=
                                                                        330
                                                                        ? 50
                                                                        : 80,
                                                                    height:
                                                                    deviceWidth <=
                                                                        360
                                                                        ? 28
                                                                        : 25,
                                                                    child: Center(
                                                                      child: Text(
                                                                        "View",
                                                                        //key: Key('rebookKey$index'),
                                                                        style: GoogleFonts.roboto(
                                                                            color: Colors.white,
                                                                            fontSize: isTablet
                                                                                ? 15
                                                                                : deviceWidth <= 360 && deviceWidth > 330
                                                                                ? 9
                                                                                : deviceWidth <= 330
                                                                                ? 8
                                                                                : 10,
                                                                            fontWeight: FontWeight.w700),
                                                                      ),
                                                                    ),
                                                                  ),
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
                                        )
                                      ],
                                    ),
                                  );
                                }
                              )
                            ,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Select Date',
                      style: GoogleFonts.poppins(
                          fontSize: isTablet ? 20 : 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                  // height: isTablet ? 130 : 160,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5, // Change this
                      shadowColor: Color(0xffE3E3E3), // Change this
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                fromDate,
                                SizedBox(
                                  width: 10,
                                ),
                                toDate,
                              ],
                            ),
                            SizedBox(height: 15,),
                            InkWell(
                              onTap: () async {
                               SVProgressHUD.show(status: "Please Wait");
                               await vm.getData(fromDate: widget.pickBirthDate,todate: widget.pickBirthDate2,id: widget.id);
                                SVProgressHUD.dismiss();
                              },
                              child: Material(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        5)),
                                color: HexColor(
                                    "#6374DF"),
                                child: SizedBox(
                                  width: double.infinity,
                                  height:
                                  deviceWidth <=
                                      360
                                      ?32
                                      : 30,
                                  child: Center(
                                    child: Text(
                                      "Search",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: isTablet
                                              ? 15
                                              : deviceWidth <= 360 && deviceWidth > 330
                                              ? 9
                                              : deviceWidth <= 330
                                              ? 8
                                              : 11,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Medical Records',
                    style: GoogleFonts.poppins(
                        fontSize: isTablet ? 20 : 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DateUtil {
  static const DATE_FORMAT = 'dd/MM/yyyy   hh:mm a';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}