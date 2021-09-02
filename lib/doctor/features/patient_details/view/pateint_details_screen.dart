import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/view/emr_screen.dart';
import 'package:myhealthbd_app/doctor/features/patient_details/view_models/consultation_history_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class PatientDetails extends StatefulWidget {
  String id;
  String name;
  String age;
  String gender;
  String bloodGroup;
  String phoneNumber;
  String consultationTime;
  String consultType;
  int serial;
  PatientDetails({
    this.id,
    this.name,
    this.age,
  this.gender,
    this.bloodGroup,
    this.phoneNumber,
    this.consultationTime,
    this.consultType,
    this.serial
  });
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  DateTime pickBirthDate;
  DateTime pickBirthDate2;
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
    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
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
  @override
  void initState() {
    // TODO: implement initState
 var vm=Provider.of<ConsultationHistoryListDocViewModel>(context,listen:false);
 vm.getData(id:widget.id);
 pickBirthDate=pickBirthDate!=null?pickBirthDate:DateTime.now();
 pickBirthDate2=pickBirthDate2!=null?pickBirthDate2:DateTime.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<ConsultationHistoryListDocViewModel>(context);
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;


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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141D53),
        title: Text(
          'Patient Details',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    //height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5, // Change this
                      shadowColor: Color(0xffE3E3E3), // Change this
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, right: 20, left: 20, bottom: 10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 28.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              //color:HexColor('#F0F2FF'),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),

                                            // height: 60,
                                            //width: 20,
                                            child: SvgPicture.asset(
                                              "assets/icons/userna.svg",
                                              fit: BoxFit.fill,
                                              width: deviceWidth > 650
                                                  ? 100
                                                  : deviceWidth <= 360
                                                      ? 50
                                                      : 60,
                                              height: deviceWidth > 650
                                                  ? 100
                                                  : deviceWidth <= 360
                                                      ? 50
                                                      : 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.name??'',
                                          style: GoogleFonts.poppins(
                                              // color: HexColor(
                                              //   '#354291',
                                              // ),
                                              fontSize: isTablet
                                                  ? 20
                                                  : width <= 330
                                                      ? 16
                                                      : 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Age: ',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              widget.age??'',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Gender: ',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              widget.gender??'',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Blood Group: ',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              widget.bloodGroup??'',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Phone No: ',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              widget.phoneNumber??'',
                                              style: GoogleFonts.poppins(
                                                  // color: HexColor(
                                                  //   '#354291',
                                                  // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                          ? 13
                                                          : 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 20, left: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    fromDate,
                                    SizedBox(
                                      width: 24,
                                    ),
                                    toDate,
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: InkWell(
                              onTap:(){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return EmrScreen(pickBirthDate: pickBirthDate,pickBirthDate2: pickBirthDate2,);
                                    }));
                              },
                              child: Material(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: HexColor("#6374DF"),
                                child: SizedBox(
                                  width: isTablet
                                      ? 200
                                      : deviceWidth <= 360 && deviceWidth > 330
                                          ? 105
                                          : deviceWidth <= 330
                                              ? 95
                                              : 180,
                                  height: isTablet
                                      ? 45
                                      : deviceWidth <= 360
                                          ? 28
                                          : 35,
                                  child: Center(
                                    child: Text(
                                      "View Patient EMR",
                                      //key: Key('rebookKey$index'),
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: isTablet
                                              ? 18
                                              : deviceWidth <= 360 &&
                                                      deviceWidth > 330
                                                  ? 9
                                                  : deviceWidth <= 330
                                                      ? 8
                                                      : 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    //height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5, // Change this
                      shadowColor: Color(0xffE3E3E3), // Change this
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/con.svg",
                                  //key: Key('filterIconKey'),
                                  width: 10,
                                  height: 28,
                                  fit: BoxFit.fitWidth,
                                  allowDrawingOutsideViewBox: true,
                                  matchTextDirection: true,
                                  //color:  Color(0xffAFBBFF),
                                  //semanticsLabel: 'Acme Logo'
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Consultation Info',
                                  style: GoogleFonts.poppins(
                                      // color: HexColor(
                                      //   '#354291',
                                      // ),
                                      fontSize: isTablet
                                          ? 20
                                          : width <= 330
                                              ? 15
                                              : 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateUtil().formattedDate(DateTime.parse(widget.consultationTime).toLocal()),
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        Time().formattedDate(DateTime.parse(widget.consultationTime).toLocal()),
                                      style: GoogleFonts.poppins(
                                          // color: HexColor(
                                          //   '#354291',
                                          // ),
                                          fontSize: isTablet
                                              ? 20
                                              : width <= 330
                                                  ? 13
                                                  : 16,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor('#7785E3')),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Status: ',
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
                                        Text(
                                          widget.consultType==1?"Complete":'Waiting',
                                          style: GoogleFonts.poppins(
                                              // color: HexColor(
                                              //   '#354291',
                                              // ),
                                              fontSize: isTablet
                                                  ? 20
                                                  : width <= 330
                                                      ? 13
                                                      : 16,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor('#FFB14A')),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: isTablet ? 60 : 40.0,
                                      backgroundColor: HexColor('#6374DF'),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Serial No",
                                            //key: Key('rebookKey$index'),
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: isTablet
                                                    ? 18
                                                    : deviceWidth <= 360 &&
                                                            deviceWidth > 330
                                                        ? 9
                                                        : deviceWidth <= 330
                                                            ? 8
                                                            : 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            widget.serial.toString(),
                                            //key: Key('rebookKey$index'),
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: isTablet
                                                    ? 18
                                                    : deviceWidth <= 360 &&
                                                            deviceWidth > 330
                                                        ? 9
                                                        : deviceWidth <= 330
                                                            ? 8
                                                            : 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: HexColor("#AFBBFF"),
                              child: SizedBox(
                                width: double.infinity,
                                height: isTablet
                                    ? 45
                                    : deviceWidth <= 360
                                        ? 28
                                        : 35,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, //Center Row contents vertically,
                                    children: [
                                      Text(
                                        "Start video consultation",
                                        //key: Key('rebookKey$index'),
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: isTablet
                                                ? 18
                                                : deviceWidth <= 360 &&
                                                        deviceWidth > 330
                                                    ? 9
                                                    : deviceWidth <= 330
                                                        ? 8
                                                        : 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: VerticalDivider(
                                          color: Colors.white,
                                          thickness: 2,
                                        ),
                                      ),
                                      Text(
                                        "00d 00h 24m 22s",
                                        //key: Key('rebookKey$index'),
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: isTablet
                                                ? 18
                                                : deviceWidth <= 360 &&
                                                        deviceWidth > 330
                                                    ? 9
                                                    : deviceWidth <= 330
                                                        ? 8
                                                        : 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    //height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5, // Change this
                      shadowColor: Color(0xffE3E3E3), // Change this
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/hiss.svg",
                                  //key: Key('filterIconKey'),
                                  width: 8,
                                  height: 25,
                                  fit: BoxFit.fitWidth,
                                  allowDrawingOutsideViewBox: true,
                                  matchTextDirection: true,
                                  //color:  Color(0xffAFBBFF),
                                  //semanticsLabel: 'Acme Logo'
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Consultation History',
                                  style: GoogleFonts.poppins(
                                      // color: HexColor(
                                      //   '#354291',
                                      // ),
                                      fontSize: isTablet
                                          ? 20
                                          : width <= 330
                                              ? 15
                                              : 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:vm.consList==null?Center(
                              child: Text('No Data Found'),
                            ):ListView.separated(
                                itemCount: vm.consList.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: isTablet
                                                  ? 350
                                                  : MediaQuery.of(context)
                                                              .size
                                                              .width >
                                                          350
                                                      ? 220
                                                      : 200,
                                              child: Text(
                                                vm.consList[index].doctorName,
                                                style: GoogleFonts.poppins(
                                                    // color: HexColor(
                                                    //   '#354291',
                                                    // ),
                                                    fontSize: isTablet
                                                        ? 20
                                                        : width <= 330
                                                            ? 13
                                                            : 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/icons/calendoc.svg",
                                                    //key: Key('filterIconKey'),
                                                    width: 10,
                                                    height: 18,
                                                    fit: BoxFit.fitWidth,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    matchTextDirection: true,
                                                    color: Color(0xffAFBBFF),
                                                    //semanticsLabel: 'Acme Logo'
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    DateUtil().formattedDate(DateTime.parse(vm.consList[index].createdDate).toLocal()),
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, top: 5),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Disease: ',
                                                    style: GoogleFonts.poppins(
                                                        // color: HexColor(
                                                        //   '#354291',
                                                        // ),
                                                        fontSize: isTablet
                                                            ? 20
                                                            : width <= 330
                                                                ? 13
                                                                : 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: HexColor(
                                                            '#FFA7A7')),
                                                  ),
                                                  Text(
                                                    vm.consList[index].disease??'Not Available',
                                                    style: GoogleFonts.poppins(
                                                        // color: HexColor(
                                                        //   '#354291',
                                                        // ),
                                                        fontSize: isTablet
                                                            ? 20
                                                            : width <= 330
                                                                ? 13
                                                                : 16,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                                  BorderRadius.circular(5)),
                                          color: HexColor("#6374DF"),
                                          child: SizedBox(
                                            width: isTablet
                                                ? 170
                                                : deviceWidth <= 360 &&
                                                        deviceWidth > 330
                                                    ? 105
                                                    : deviceWidth <= 330
                                                        ? 50
                                                        : 80,
                                            height: isTablet
                                                ? 40
                                                : deviceWidth <= 360
                                                    ? 28
                                                    : 25,
                                            child: Center(
                                              child: Text(
                                                "View",
                                                key: Key('rebookKey$index'),
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontSize: isTablet
                                                        ? 18
                                                        : deviceWidth <= 360 &&
                                                                deviceWidth >
                                                                    330
                                                            ? 9
                                                            : deviceWidth <= 330
                                                                ? 8
                                                                : 10,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider();
                                }),
                          ),
                          SizedBox(
                            height: isTablet
                                ? 60
                                : deviceWidth <= 360
                                    ? 40
                                    : 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            // padding: EdgeInsets.only(top: 650.0),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: isTablet
                  ? 70
                  : deviceWidth <= 360
                      ? 50
                      : 60,
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.2),
                    spreadRadius: 6,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
                child: Material(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: HexColor("#6374DF"),
                  child: SizedBox(
                    width: isTablet
                        ? 170
                        : deviceWidth <= 360 && deviceWidth > 330
                            ? 105
                            : deviceWidth <= 330
                                ? 95
                                : 180,
                    height: deviceWidth <= 360 ? 28 : 35,
                    child: Center(
                      child: Text(
                        "Create Prescription",
                        //key: Key('rebookKey$index'),
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: isTablet
                                ? 18
                                : deviceWidth <= 360 && deviceWidth > 330
                                    ? 9
                                    : deviceWidth <= 330
                                        ? 8
                                        : 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateUtil {
  static const DATE_FORMAT = 'dd/MM/yyyy';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}

class Time {
  static const DATE_FORMAT = 'hh:mm a';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}
