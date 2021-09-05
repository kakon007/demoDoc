import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/doctor_home_screen.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/dashboard_drawer.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/worklists_widget.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view_model/worklist_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/resource/doctor_const.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/manage_account_prompt.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'widgets/all_workilist_view.dart';
import 'widgets/manage_doctor_profile_prompt.dart';

class DoctorDashboard extends StatefulWidget {
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  void initState() {
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: false);
    var workVm = Provider.of<WorkListViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      await companyInfoVm.userImage();
      await workVm.getTodaysWorklist();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var workVm = Provider.of<WorkListViewModel>(context, listen: true);
    var photo = companyInfoVm.details?.photo ?? '';
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var welcomeToMyHealth = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to ',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: HexColor('#707070')),
        ),
        Text(
          'MyHealthBD',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: HexColor('#707070')),
        ),
      ],
    );
    var appointmentsCard = Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: HexColor("#FFFFFF"),
          boxShadow: [
            BoxShadow(
              color: HexColor("#0D1231").withOpacity(0.08),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding:
            EdgeInsets.only(left: width <= 330 ? 10 : 15.0, right: 10, top: 11),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularPercentIndicator(
              rotateLinearGradient: true,
              reverse: false,
              backgroundWidth: 0.7,
              radius: width <= 330 ? 70 : 100.0,
              lineWidth: 7.0,
              animation: true,
              startAngle: 1,
              percent: .5,
              center: new Text(
                "10",
                style: GoogleFonts.poppins(
                    //color: HexColor("#107B3E"),
                    color: AppTheme.buttonActiveColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0),
              ),
              backgroundColor: HexColor('#EFF5FF'),
              circularStrokeCap: CircularStrokeCap.round,
              //progressColor: Colors.green,
              progressColor: HexColor('#9CAAFF'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Appointments",
                        style: GoogleFonts.poppins(
                            fontSize: width <= 330 ? 12 : 15,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " for today",
                        style: GoogleFonts.poppins(
                            fontSize: width <= 330 ? 12 : 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    " 10 of 20 completed",
                    style: GoogleFonts.poppins(
                        fontSize: width <= 330 ? 12 : 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: width * .6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 0.0),
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: 90,
                            ),
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppTheme.buttonActiveColor),
                            //color: HexColor("#107B3E"),
                            child: Center(
                              child: Text(
                                "View All",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            //color: AppTheme.buttonActiveColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    var yourSummary = Container(
      constraints: BoxConstraints(minHeight: 120),
      //height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: HexColor("#FFFFFF"),
          boxShadow: [
            BoxShadow(
              color: HexColor("#0D1231").withOpacity(0.08),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0, top: 0),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 80),
              decoration: BoxDecoration(
                  color: AppTheme.buttonActiveColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SvgPicture.asset(
                          totalConsultIcon,
                          width: 20,
                          height: 30,
                          fit: BoxFit.fitWidth,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                        )
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Total patient consulted: ',
                        style: GoogleFonts.poppins(color: Colors.white,fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '10000',
                        style: GoogleFonts.poppins(color: Colors.white,fontSize: 18),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  constraints: BoxConstraints(minHeight: 120),
                  width: MediaQuery.of(context).size.width * .308,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SvgPicture.asset(
                          waitingIcon,
                          width: 20,
                          height: 30,
                           fit: BoxFit.fitWidth,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                        )
                      ),
                      Text(
                        "Waiting",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "100",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  constraints: BoxConstraints(minHeight: 120),
                  width: MediaQuery.of(context).size.width * .308,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SvgPicture.asset(
                          freshVisitIcon,
                          width: 20,
                          height: 30,
                          fit: BoxFit.fitWidth,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                        )
                      ),
                      Text(
                        "Fresh Visit",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "100",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minHeight: 120),
                  width: MediaQuery.of(context).size.width * .31,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SvgPicture.asset(
                          reportCheckIcon,
                          width: 20,
                          height: 30,
                          fit: BoxFit.fitWidth,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                        )
                      ),
                      Text(
                        "Report checked",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "100",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 0.5, color: Colors.grey),
                      top: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  constraints: BoxConstraints(minHeight: 120),
                  width: MediaQuery.of(context).size.width * .308,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SvgPicture.asset(
                          followUpIcon,
                          width: 20,
                          height: 30,
                          fit: BoxFit.fitWidth,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                        )
                      ),
                      Text(
                        "Follow Up",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "100",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 0.5, color: Colors.grey),
                      top: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  constraints: BoxConstraints(minHeight: 120),
                  width: MediaQuery.of(context).size.width * .308,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SvgPicture.asset(
                          doneIcon,
                          width: 20,
                          height: 30,
                          fit: BoxFit.fitWidth,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                        )
                      ),
                      Text(
                        "Done",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "100",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minHeight: 120),
                  width: MediaQuery.of(context).size.width * .31,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SvgPicture.asset(
                          absentIcon,
                          width: 20,
                          height: 30,
                          fit: BoxFit.fitWidth,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                        )
                      ),
                      Text(
                        "Absent",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "100",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    var spaceBetween = SizedBox(
      height: 10,
    );
    return Scaffold(
      backgroundColor: AppTheme.dashboardBackgroundColor,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){
              showAlert(context);
            },
            child: Container(
                decoration: BoxDecoration(
                    color:
                        photo != '' ? Colors.white : AppTheme.buttonActiveColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: photo != ''
                            ? AppTheme.buttonActiveColor
                            : Colors.white,
                        width: 1)),
                height: isTablet
                    ? 32
                    : width <= 330
                        ? 25
                        : 30,
                width: isTablet
                    ? 32
                    : width <= 330
                        ? 25
                        : 30,
                child: Center(
                  child: photo != ''
                      ? companyInfoVm.loadProfileImage(
                          photo,
                          isTablet
                              ? 25
                              : width <= 330
                                  ? 20
                                  : 22,
                          isTablet
                              ? 25
                              : width <= 330
                                  ? 20
                                  : 22,
                          50)
                      : Image.asset(
                          'assets/images/dPro.png',
                          height: isTablet
                              ? 22
                              : width <= 330
                                  ? 18
                                  : 20,
                          width: isTablet
                              ? 22
                              : width <= 330
                                  ? 18
                                  : 20,
                        ),
                )),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: AppTheme.buttonActiveColor,
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.notes,
              size: 30,
              color: AppTheme.buttonActiveColor,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: Drawer(child: DashboardDrawer()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeToMyHealth,
              spaceBetween,
              spaceBetween,
              appointmentsCard,
              spaceBetween,
              Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Text(
                  "Your summary",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              spaceBetween,
              yourSummary,
              spaceBetween,
              Padding(
                  padding: EdgeInsets.only(left: 3.0, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's worklist",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorHomeScreen(
                                        index: 1,
                                      )),
                                  (Route<dynamic> route) => false);
                        },
                        child: Row(
                          children: [
                            Text("View All",
                                style: GoogleFonts.poppins(
                                    color: HexColor("#354291"),
                                    //color: AppTheme.buttonActiveColor,
                                    fontSize: 12)),
                          ],
                        ),
                      )
                    ],
                  )),
              workVm.todayWorkList.length ==0 ? Center(child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("There is no worklist today.",

                style: GoogleFonts.poppins(),
                ),
              )) : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: workVm.todayWorkList.length < 5 ? workVm.todayWorkList.length : 5,
                  itemBuilder: (context, index) {
                    return TodayWorkList(
                      patientName: workVm.todayWorkList[index].patientName,
                      appointmentTime:workVm.todayWorkList[index].consTime ,
                      appointType: workVm.todayWorkList[index].consultTypeNo.toString(),
                      id: workVm.todayWorkList[index].hospitalId,
                      doctorNo: workVm.todayWorkList[index].doctorNo,
                      age: workVm.todayWorkList[index].age,
                      bloodGroup: workVm.todayWorkList[index].bloodGroup,
                      phoneNumber: workVm.todayWorkList[index].phoneMobile,
                      serial: workVm.todayWorkList[index].slotSl,
                      gender: workVm.todayWorkList[index].gender,
                      regNo: workVm.todayWorkList[index].registrationNo,
                      consultationId: workVm.todayWorkList[index].consultationId,
                    );
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
        builder: (context) => Material(color: Colors.transparent, child: ManageDoctorProfilePrompt()));
  }
}
