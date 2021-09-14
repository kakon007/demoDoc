import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/admin/dashboard/dashboard_admin.dart';
import 'package:myhealthbd_app/admin/profile/admin_profile.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/doctor_dashboard.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/view/emr_screen.dart';
import 'package:myhealthbd_app/doctor/features/patient_details/view/pateint_details_screen.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_templates_pop_up.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/doctor_profile.dart';
import 'package:myhealthbd_app/doctor/features/worklist/view/doctor_worklist.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/prescription_module.dart';
import 'package:myhealthbd_app/features/my_health/view/patient_portal_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class AdminHomeScreen extends StatefulWidget {
  int index;
  AdminHomeScreen({this.index});
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  _moveTo(int index) {
    currentIndex = index;
    setState(() {});
  }

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );

  //Navigation screen

  @override
  void initState() {
    currentIndex = widget.index == null ? 0 : widget.index;
    super.initState();
    //_animationController.forward();
    //screenShots=screens.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    final String dashboardIconImage = dashboardImageIcon;
    final Widget dashboardIcon =
    SvgPicture.asset(
      dashboardIconImage,
      width: 10,
      height: 20,
      fit: BoxFit.cover,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      color: currentIndex == 0
          ? AppTheme.navBarActiveColor
          : AppTheme.navBarInActiveColor,
    );
    final String profileImage = profileImageIcon;
    final Widget profileIcon = SvgPicture.asset(
      profileImage,
      width: 10,
      height: 20,
      fit: BoxFit.cover,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      color: currentIndex == 1
          ? AppTheme.navBarActiveColor
          : AppTheme.navBarInActiveColor,
    );

    List pages = <Widget>[
      AdminDashboard(),
      AdminProfile()
    ];
    var bottomNavBar = BottomNavigationBar(
        onTap: (int index) {
          if (currentIndex != index) {
            _moveTo(index);
          }
        },
        currentIndex: currentIndex,
        selectedItemColor: AppTheme.navBarActiveColor,
        unselectedItemColor: AppTheme.navBarInActiveColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Material(
                color: Colors.transparent,
                child: dashboardIcon,

                // ignore: deprecated_member_use
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  StringResources.dashboardNavBarText,
                  style: GoogleFonts.poppins(),
                ),
              )),
          BottomNavigationBarItem(
              icon: Material(
                color: Colors.transparent,
                child: profileIcon,

                // ignore: deprecated_member_use
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Profile",
                  style: GoogleFonts.poppins(),
                ),
              ))
        ]);

    return MaterialApp(
      title: 'MyHealthBD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyText2: TextStyle(color: AppTheme.doctorPrimaryTextColor)),
        primaryColor: AppTheme.appbarPrimary,
        unselectedWidgetColor: HexColor('#8592E5'),
      ),
      home: WillPopScope(
          child: Scaffold(
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: bottomNavBar),
            body: pages[currentIndex],
          ),
          onWillPop: () async {
            if (currentIndex == 0)
              return true;
            else {
              _moveTo(0);
              return false;
            }
          }),
    );
  }
}
