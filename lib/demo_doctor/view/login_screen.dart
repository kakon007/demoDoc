import 'package:flutter/material.dart';
import 'package:myhealthbd_app/demo_doctor/view/doctor_home.dart';
import 'package:myhealthbd_app/demo_doctor/view/home.dart';
import 'package:myhealthbd_app/demo_doctor/view/login_screen_process.dart';
import 'package:page_transition/page_transition.dart';

class CommonLoginScreen extends StatefulWidget {
  @override
  _CommonLoginScreenState createState() => _CommonLoginScreenState();
}

class _CommonLoginScreenState extends State<CommonLoginScreen> {
  @override
  Widget build(BuildContext context) {

    var doctorLogin=Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff7266D8).withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:Center(child: Text('Login As Doctor',style: TextStyle(color: Colors.grey,fontSize: 20),)));

    var patientLogin=Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff7266D8),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff7266D8).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:Center(child: Text('Login As Patient',style: TextStyle(color: Colors.white,fontSize: 20),)));

    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.black)),
        backgroundColor:Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:200.0),
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(onTap: (){
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: LogInProcess(id: 0,)
                      ),
                    );
                  },child: doctorLogin),
                  SizedBox(height: 20,),
                  InkWell(onTap: (){
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: LogInProcess(id: 1,)
                      ),
                    );
                  },child: patientLogin)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
