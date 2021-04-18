import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/dashboard/model/user_details_model.dart';
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

  List<String> menuItem=[
    "Dashboard",
    "Appointments",
    "Prescriptions",
    "Reports",
    "Documents",
    "Messages",
    "Notifications",
    "Settings",
    "Family Members",
    "Switch Account",
    "Sign Out",
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
                          menuItem[index],
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#354291')),
                        ),
                      ),
                    ),),
                  ):
                  Text(
                    menuItem[index],
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


  // Future<FindHospitalNumberModel> fetchUserDetails() async {
  //   var url =
  //       "https://qa.myhealthbd.com:9096/diagnostic-api/api/pat-investigation-report/find-hospitalNumber";
  //   var client = http.Client();
  //   var response = await client.post(url,headers: {'Authorization': 'Bearer ${signInData.accessToken}',});
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonMap = json.decode(response.body);
  //     print("Body"+jsonMap.toString());
  //     //data = jsonMap["items"];
  //     FindHospitalNumberModel data2 = findHospitalNumberModelFromJson(response.body) ;
  //     //Obj odj=Obj.fromJson();
  //     setState(() {
  //       fName=data2.obj.fname;
  //       phoneNumber=data2.obj.phoneMobile;
  //       address=data2.obj.address;
  //       dob=data2.obj.dob;
  //     });
  //     print('Data:: ' + data2.obj.fname);
  //     print('DataList:: ' + fName.toString());
  //     return data2;
  //     //print(data[0]['companySlogan']);
  //   }else {
  //     return null;
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    //fetchUserDetails();
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
                children: menuItem.asMap().entries.map((mapEntry) => buildMenuRow(mapEntry.key)).toList(),
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
