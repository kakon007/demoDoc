import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/user_profile/view/user_profile_screen.dart';



class DrawerScreen2 extends StatefulWidget {
  final Function(int) menuCallBack;
  DrawerScreen2({this.menuCallBack});
  @override
  _DrawerScreen2State createState() => _DrawerScreen2State();
}

class _DrawerScreen2State extends State<DrawerScreen2> {
  int selectedMenuIndex=0;
  String fName ;
  String phoneNumber;
  String address;
  String dob;

  List<String> menuItem2=[
    "Dashboard",
    "Appointments",
    "Prescriptions",
    "Reports",
    "Documents",
    "Notifications",
    "Settings",
  ];


  Widget buildMenuRow(int index){
    return InkWell(
      onTap: (){
        setState(() {
          selectedMenuIndex=index;
          widget.menuCallBack(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,bottom: 5),
        child: Column(
            children: [
              Row(
                children: [
                  selectedMenuIndex==index?
                  Padding(
                    padding: const EdgeInsets.only(right:18.0),
                    child: Container(height:30,decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: HexColor("#FFFFFF"),),child:Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left:3,right:3),
                        child: Text(
                          menuItem2[index],
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#354291')),
                        ),
                      ),
                    ),),
                  ):
                  Text(
                    menuItem2[index],
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color:Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ]
        ),
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Container(
        padding: EdgeInsets.only(top: 60,bottom: 20),
        color: HexColor('#141D53'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: Column(
                children: menuItem2.asMap().entries.map((mapEntry) => buildMenuRow(mapEntry.key)).toList(),
              ),
            ),

          ],
        ),
      ),
        Padding(
          padding: const EdgeInsets.only(top:150.0,left: 210),
          child: Container(
            height:450,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        )
      ]
    );
  }
}
