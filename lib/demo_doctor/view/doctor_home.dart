import 'package:flutter/material.dart';
import 'package:myhealthbd_app/demo_doctor/view/appointment_history.dart';
import 'package:myhealthbd_app/demo_doctor/view/dashBoard_screen.dart';
import 'package:myhealthbd_app/demo_doctor/view/todays_worlist.dart';
import 'package:myhealthbd_app/demo_doctor/view/worklist_history.dart';
import 'package:myhealthbd_app/features/appointment_history/view/get_appointment_screen.dart';

class DoctorHome extends StatefulWidget {


  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    DoctorTodaysWorklist(),
    DoctorWorklistHistory()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Today\'s WorkList',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'WorkList History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
