import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/doctor_daashboard.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/doctor_profile.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/doctor_worklist.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/prescription_module.dart';
import 'package:myhealthbd_app/features/my_health/view/patient_portal_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class DoctorHomeScreen extends StatefulWidget {
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> with SingleTickerProviderStateMixin{


  int currentIndex=0;
  _moveTo(int index){
    currentIndex=index;
    setState(() {

    });
  }

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );
  //Navigation screen

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_animationController.forward();
    //screenShots=screens.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth=MediaQuery.of(context).size.width;
    final String dashboardIconImage = "assets/images/dashboard.svg";
    final Widget dashboardIcon = SvgPicture.asset(
      dashboardIconImage,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final String workListIconImage = "assets/images/work.svg";
    final Widget workListIcon = SvgPicture.asset(
      workListIconImage,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final String prescriptionImage = "assets/images/prescription.svg";
    final Widget prescriptionIcon = SvgPicture.asset(
      prescriptionImage,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final String profileImage = "assets/images/profile.svg";
    final Widget profileIcon = SvgPicture.asset(
      profileImage,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    List pages = <Widget>[
      DoctorDashboard(),
      Worklist(),
      Module(),
      DoctorProfile()];
    var bottomNavBar=BottomNavigationBar(
        onTap: (int index){
          if(currentIndex !=index)
          {
            _moveTo(index);
          }
        },
        currentIndex: currentIndex,
        selectedItemColor: HexColor('#107B3E'),
        unselectedItemColor: Colors.grey[800],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Material(
            color: Colors.transparent,
            child: dashboardIcon,

            // ignore: deprecated_member_use
          ),title: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(StringResources.dashboardNavBarText),
          )),
          BottomNavigationBarItem(icon: Material(
            color: Colors.transparent,
            child: workListIcon,

            // ignore: deprecated_member_use
          ),title: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("Worklists"),
          )),
          //hospitals
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon:  Material(
            color: Colors.transparent,
            child:prescriptionIcon,

            // ignore: deprecated_member_use
          ),title: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("Prescriptions Module"),
          )),
          //my_health
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon: Material(
            color: Colors.transparent,
            child: profileIcon,

            // ignore: deprecated_member_use
          ),title: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("Profile"),
          ))
        ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor('#1DBF63'),
        unselectedWidgetColor: HexColor('#8592E5'),
      ),
      home: WillPopScope(child: Scaffold(
        bottomNavigationBar: bottomNavBar,
        body: pages[currentIndex],
      ), onWillPop: null),
    );
  }
}
