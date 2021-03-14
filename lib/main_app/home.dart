import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/appointments/view/appointments_screen.dart';
import 'package:myhealthbd_app/features/dashboard/view/dash_board_screen.dart';
import 'package:myhealthbd_app/features/hospitals/view/hospital_screen.dart';
import 'package:myhealthbd_app/features/my_health/view/my_health_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  _moveTo(int index){
    currentIndex=index;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    var pages=<Widget>[
      DashboardScreen(),
      AppointmentScreen(),
      HospitalScreen(),
      MyHealthScreen(),
    ];

    //BottomNavBar
    var bottomNavBar=BottomNavigationBar(
        onTap: (int index){
          if(currentIndex !=index)
            {
              _moveTo(index);
            }
        },
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
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
      //dashboard
      BottomNavigationBarItem(icon: Material(
        color: Colors.transparent,
        child: Image.asset("assets/icons/dashboard_icon.png"),

      // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.dashboardNavBarText),
      )),
      //appointments
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon: Material(
        color: Colors.transparent,
        child: Image.asset("assets/icons/appointment_icon.png"),

        // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.appointmentNavBarText),
      )),
      //hospitals
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon:  Material(
        color: Colors.transparent,
        child: Image.asset("assets/icons/hospital_icon.png"),

        // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.hospitalNavBarText),
      )),
      //my_health
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon: Material(
        color: Colors.transparent,
        child: Image.asset("assets/icons/myhealth_icon.png"),

        // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.myHealthNavBarText),
      ))
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(child: Scaffold(
         bottomNavigationBar: bottomNavBar,
        body: pages[currentIndex],
      ), onWillPop: null),
    );
  }
}
