import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/dashboard_drawer.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/worklists_widget.dart';
import 'package:myhealthbd_app/doctor/main_app/resource/doctor_const.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'widgets/all_workilist_view.dart';

class DoctorDashboard extends StatefulWidget {
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
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
              fontWeight: FontWeight.w400, fontSize: 18),
        ),
        Text(
          'MyHealthBD',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ],
    );
    var appointmentsCard=   Container(
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
        padding: const EdgeInsets.only(left: 15.0, right: 10, top: 11),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularPercentIndicator(
              rotateLinearGradient: true,
              reverse: false,
              backgroundWidth: 0.7,
              radius: 100.0,
              lineWidth: 7.0,
              animation: true,
              startAngle: 1,
              percent: .5,
              center: new Text(
                "10",
                style: GoogleFonts.poppins(
                  //color: HexColor("#107B3E"),
                    color: AppTheme.buttonActiveColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
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
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " for today",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    " 10 of 20 completed",
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: width*.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 90.0),
                          child: FlatButton(
                              height: 35,
                              minWidth: 100,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              //color: HexColor("#107B3E"),
                              color: AppTheme.buttonActiveColor,
                              child: Text(
                                "View All",
                                style:
                                GoogleFonts.roboto(color: Colors.white),
                              )),
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
    var yourSummary =   Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: HexColor("#FFFFFF"),
          boxShadow: [
            BoxShadow(
              color: HexColor("#0D1231").withOpacity(0.08),
              spreadRadius: 3,
              blurRadius: 5,
              offset:
              Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 0.0, right: 0, top: 0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: 0.5, color: Colors.grey),
                ),
              ),
              height: 140,
              width: MediaQuery.of(context).size.width / 3.28,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 40,
                      width: 30,
                      child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(8.0),
                          child: Image.asset(
                            consultIcon,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Text(
                    "Today Consulted",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "100",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: 0.5, color: Colors.grey),
                ),
              ),
              height: 140,
              width: MediaQuery.of(context).size.width / 3.28,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 40,
                      width: 30,
                      child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(8.0),
                          child: Image.asset(
                            reportCheckIcon,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Text(
                    "Report checked",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "100",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width / 3.28,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 40,
                      width: 30,
                      child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(8.0),
                          child: Image.asset(
                            inProgressIcon,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Text(
                    "In Progress",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "100",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    var spaceBetween =  SizedBox(
      height: 10,
    );
    return Scaffold(
      backgroundColor: AppTheme.dashboardBackgroundColor,
      appBar: AppBar(
        actions: [
          Container(
              decoration: BoxDecoration(
                  color: AppTheme.buttonActiveColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
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
                child: Image.asset(
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
              //color: HexColor("#1DBF63"),
              color: AppTheme.buttonActiveColor,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      drawer: Drawer(
        child: DashboardDrawer()
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeToMyHealth,
              spaceBetween,
              appointmentsCard,
              spaceBetween,
              Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Text(
                  "Your summary",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 15),
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
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AllWorkLists();
                          }));
                        },
                        child: Row(
                          children: [
                            Text("View All",
                                style: GoogleFonts.poppins(
                                    //color: HexColor("#107B3E"),
                                    color: AppTheme.buttonActiveColor,
                                    fontSize: 15)),
                          ],
                        ),
                      )
                    ],
                  )),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return TodayWorkList();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
