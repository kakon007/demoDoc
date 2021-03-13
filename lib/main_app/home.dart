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
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey[800],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        items: [
      //dashboard
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon: Padding(
        padding: EdgeInsets.all(10),
        child: Image.asset("assets/icons/dashboard_icon.png"),

      ),title: Text(StringResources.dashboardNavBarText)),
      //appointments
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon: Icon(Icons.add_box),title: Text(StringResources.appointmentNavBarText)),
      //hospitals
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon:  Icon(Icons.add_box_outlined),title: Text(StringResources.hospitalNavBarText)),
      //my_health
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon:  Icon(Icons.cake),title: Text(StringResources.myHealthNavBarText))
    ]);

    return MaterialApp(
      home: WillPopScope(child: Scaffold(
         bottomNavigationBar: bottomNavBar,
        body: pages[currentIndex],
      ), onWillPop: null),
    );
  }
}
