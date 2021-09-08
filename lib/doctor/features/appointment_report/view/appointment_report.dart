import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/view_model/appointment_report_view_model.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/view_model/shift_view_model.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/dashboard_drawer.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/worklists_widget.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/resource/doctor_const.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/manage_account_prompt.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../dashboard/view/widgets/all_workilist_view.dart';
import '../../dashboard/view/widgets/manage_doctor_profile_prompt.dart';

class AppointmentReport extends StatefulWidget {
  @override
  _AppointmentReportState createState() => _AppointmentReportState();
}

class _AppointmentReportState extends State<AppointmentReport> {

  DateTime pickedToDate;
  DateTime pickedFromDate;
  int selectedIndex;



  Future<Null> selectFromDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Container(
          child: Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppTheme.appbarPrimary,
              accentColor: AppTheme.appbarPrimary,
              colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          ),
        );
      },
      initialDate: pickedFromDate,
      firstDate: DateTime(2010),
      lastDate: pickedToDate,
    );
    if (date != null && pickedFromDate != null) {
      setState(() {
        pickedFromDate= date;
      });
    } else {

    }
  }

  Future<Null> selectToDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Container(
          child: Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppTheme.appbarPrimary,
              accentColor: AppTheme.appbarPrimary,
              colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          ),
        );
      },
      initialDate: pickedToDate,
      firstDate: pickedFromDate,
      lastDate: DateTime.now(),
    );
    if (date != null && date != pickedToDate) {
      setState(() {
        pickedToDate = date;
      });
    }}


  @override
  void initState() {
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      await companyInfoVm.userImage();
    });
    pickedToDate= DateTime.now();
    pickedFromDate= DateTime.now();
    var appointmentReport= Provider.of<AppointmentReportListDocViewModel>(context, listen: false);
    appointmentReport.getData(fromDate:TimeUtil().formattedDate(DateTime.parse( pickedFromDate.toString()??DateTime.now())),toDate:TimeUtil().formattedDate(DateTime.parse( pickedToDate.toString()??DateTime.now())),doctorNo: companyInfoVm.details.doctorNo,ogNo: companyInfoVm.details.organizationNo);

    var shift= Provider.of<ShiftListDocViewModel>(context, listen: false);
    shift.getData(ogNo: companyInfoVm.details.organizationNo);
    selectedIndex = 0;
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var dVm = Provider.of<PersonalInfoViewModel>(context, listen: true);
    var photo = companyInfoVm.details?.photo ?? '';
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appointmentReport= Provider.of<AppointmentReportListDocViewModel>(context);
    var shift= Provider.of<ShiftListDocViewModel>(context, listen: false);
    var spaceBetween = SizedBox(
      height: 10,
    );
    var fromDate = GestureDetector(
      onTap: (){
        selectFromDate(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From',
            style: GoogleFonts.poppins(
                fontSize: isTablet
                    ? 18
                    : width <= 330
                    ? 12
                    : 16,
                fontWeight: FontWeight.w500),
          ),
          Container(
            height: width<=330? 35 : 45,
            width: isTablet? 160 : width <= 330 ? 110 : 140,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#6374DF"), // set border color
                //width: 3.0
              ), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)), // set rounded corner radius
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat("dd/MM/yyyy").format(pickedFromDate),
                  style: GoogleFonts.poppins(
                    fontSize: isTablet
                        ? 18
                        : width <= 330
                        ? 12
                        : 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  "assets/icons/calendoc.svg",
                  //key: Key('filterIconKey'),
                  width: 10,
                  height: 18,
                  fit: BoxFit.fitWidth,
                  allowDrawingOutsideViewBox: true,
                  matchTextDirection: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
    var toDate = GestureDetector(
      onTap: (){
        selectToDate(context);
      },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To',
          style: GoogleFonts.poppins(
              fontSize: isTablet
                  ? 18
                  : width <= 330
                  ? 12
                  : 16,
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: width<=330? 35 : 45,
          width: isTablet? 160 : width <= 330 ? 110 : 140,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: HexColor("#6374DF"), // set border color
              //width: 3.0
            ), // set border width
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)), // set rounded corner radius
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat("dd/MM/yyyy").format(pickedToDate),
                style: GoogleFonts.poppins(
                  fontSize: isTablet
                      ? 18
                      : width <= 330
                      ? 12
                      : 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                "assets/icons/calendoc.svg",
                //key: Key('filterIconKey'),
                width: 10,
                height: 18,
                fit: BoxFit.fitWidth,
                allowDrawingOutsideViewBox: true,
                matchTextDirection: true,
              ),
            ],
          ),
        )
      ],
    ),);
    var shiftHeading = Text(
      'Shift:',
      style: GoogleFonts.poppins(fontSize: isTablet? 18 : width<=330? 12 : 16),
    );
    var shiftList = Expanded(
      child: Container(
        height: width<=330? 35 : 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, int index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        print('inddss $selectedIndex');
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      constraints: BoxConstraints(minWidth: isTablet? 130 : 100, minHeight: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffE2E2E2),
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: width<=330? 15 : 20,
                                  width: width<=330? 15 : 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.white),
                                      color: selectedIndex == index
                                          ? Color(0xff74FF9E)
                                          : Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  index == 0
                                      ? "All"
                                      : index == 1
                                          ? "Morning"
                                          : "Evening",
                                  style: GoogleFonts.poppins(fontSize: isTablet? 17 : width<=330? 12 : 14),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
    var viewButton = Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
          minWidth: isTablet? width*.4 : width * .45,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: AppTheme.buttonActiveColor,
          onPressed: () async {
            SVProgressHUD.show(status: 'Loading');
           await appointmentReport.getData(fromDate:TimeUtil().formattedDate(DateTime.parse( pickedFromDate.toString()??DateTime.now())),toDate:TimeUtil().formattedDate(DateTime.parse( pickedToDate.toString()??DateTime.now())),doctorNo: companyInfoVm.details.doctorNo,ogNo: companyInfoVm.details.organizationNo,shiftNo: selectedIndex==0?0:selectedIndex==1?2000001:2000002);
            SVProgressHUD.dismiss();
           },
          child: Text(
            'View Report',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: isTablet? 17 : width <= 330 ? 12 : 15,
                fontWeight: FontWeight.w600),
          )),
    );
    var dateSection = Container(
      constraints: BoxConstraints(
        minHeight: 120,
        minWidth: width <= 330 ? width * .9 : width * .925,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HexColor("#FFFFFF"),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          children: [
            spaceBetween,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [fromDate, SizedBox(), toDate],
            ),
            spaceBetween,
            Row(
              children: [shiftHeading, shiftList],
            ),
            width<=330? SizedBox() : spaceBetween,
            width<=330? SizedBox() :  spaceBetween,
            viewButton,
            spaceBetween,
            width<=330? SizedBox() :  spaceBetween
          ],
        ),
      ),
    );
    var widthSpace = SizedBox(
      width: 5,
    );
    var widthSpaceTab = SizedBox(
      width: 10,
    );
    return Scaffold(
      backgroundColor: AppTheme.dashboardBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Appointment Report',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceBetween,
              width<=330?  SizedBox() : spaceBetween,
              dateSection,
              spaceBetween,
              appointmentReport.appointmentReportList==null?Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'No report found',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: HexColor('#AEB0BA'),
                            fontWeight: FontWeight.w400,
                            fontSize: isTablet ? 22 : 16),
                      ),
                    ],
                  ),
                ),
              ) :ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:appointmentReport.appointmentReportList.length,
                  itemBuilder: (context, index) {
                    var indexInc = index;
                    return Container(
                        constraints: BoxConstraints(minHeight: width<=330? 60 : 80),
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                                constraints:
                                    BoxConstraints(minHeight: width<=330? 70 : 90, minWidth: 60),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppTheme.buttonActiveColor),
                                child: Center(
                                  child: Text(
                                    indexInc.toString(),
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: isTablet? 20 :  width<=330? 15 : 17 ,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                            Padding(
                              padding:  EdgeInsets.only(left: isTablet ? 25 : 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appointmentReport.appointmentReportList[index].patientName==null?"":appointmentReport.appointmentReportList[index].patientName,
                                    style: GoogleFonts.poppins(fontSize: isTablet? 18 : width<=330? 12 :  14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints:
                                            BoxConstraints(minWidth: 90),
                                        child: Text(
                                          appointmentReport.appointmentReportList[index].hospitalNo??"Not Available",
                                          style:
                                              GoogleFonts.poppins(fontSize: isTablet? 16: 11),
                                        ),
                                      ),
                                      widthSpace,
                                      isTablet? widthSpaceTab : SizedBox(),
                                      Container(
                                        width: 1,
                                        constraints:
                                            BoxConstraints(minHeight: 20),
                                        color: AppTheme.buttonActiveColor,
                                      ),
                                      widthSpace,
                                      isTablet? widthSpaceTab : SizedBox(),
                                      Text(
                                        appointmentReport.appointmentReportList[index].consultTypeName??"",
                                        style:
                                            GoogleFonts.poppins(fontSize:isTablet? 16 : 11),
                                      ),
                                      widthSpace,
                                      isTablet? widthSpaceTab : SizedBox(),
                                      width > 330
                                          ? Container(
                                              width: 1,
                                              constraints:
                                                  BoxConstraints(minHeight: 20),
                                              color: AppTheme.buttonActiveColor,
                                            )
                                          : SizedBox(),
                                      width > 330 ? widthSpace : SizedBox(),
                                      isTablet? widthSpaceTab : SizedBox(),
                                      width > 330
                                          ? Container(
                                              constraints:
                                                  BoxConstraints(minWidth: 60),
                                              child: Text(
                                                 DateUtil().formattedDate(DateTime.parse( appointmentReport.appointmentReportList[index].appointDate??DateTime.now())),
                                                style: GoogleFonts.poppins(
                                                    fontSize: isTablet? 16 : 11),
                                              ),
                                            )
                                          : SizedBox(),
                                      widthSpace,
                                      isTablet? widthSpaceTab : SizedBox(),
                                      isTablet
                                          ? Container(
                                              width: 1,
                                              constraints:
                                                  BoxConstraints(minHeight: 20),
                                              color: AppTheme.buttonActiveColor,
                                            )
                                          : SizedBox(),
                                      widthSpace,
                                      isTablet? widthSpaceTab : SizedBox(),
                                      isTablet
                                          ? Container(
                                              constraints:
                                                  BoxConstraints(minWidth: 90),
                                              child: Text(
                                                appointmentReport.appointmentReportList[index].shiftName??"",
                                                style: GoogleFonts.poppins(
                                                    fontSize: isTablet? 14 : 11),
                                              ),
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      isMobile
                                          ? Container(
                                              constraints:
                                                  BoxConstraints(minWidth: 90),
                                              child: Text(
                                                appointmentReport.appointmentReportList[index].shiftName??"",
                                                style: GoogleFonts.poppins(
                                                    fontSize: isTablet? 14 : 11),
                                              ),
                                            )
                                          : SizedBox(),
                                      width <= 330 ? widthSpace : SizedBox(),
                                      width <= 330
                                          ? Container(
                                              width: 1,
                                              constraints:
                                                  BoxConstraints(minHeight: 20),
                                              color: AppTheme.buttonActiveColor,
                                            )
                                          : SizedBox(),
                                      width <= 330 ? widthSpace : SizedBox(),
                                      width <= 330
                                          ? Container(
                                              constraints:
                                                  BoxConstraints(minWidth: 60),
                                              child: Text(
                                                DateUtil().formattedDate(DateTime.parse( appointmentReport.appointmentReportList[index].appointDate??DateTime.now())),
                                                style: GoogleFonts.poppins(
                                                    fontSize: isTablet? 14 : 11),
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    // var vm = Provider.of<UserDetailsViewModel>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) => Material(
            color: Colors.transparent, child: ManageDoctorProfilePrompt()));
  }
}


class DateUtil {
  static const DATE_FORMAT = 'dd/MM/yyyy ';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}

class TimeUtil {
  static const DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}
