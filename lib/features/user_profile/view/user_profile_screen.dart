import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/user_profile/widgets/change_password_prompt.dart';
import 'package:myhealthbd_app/features/user_profile/widgets/edit_profile_prompt.dart';

class UserProfile extends StatefulWidget {
  String fName;
  String phoneNumber;
  String address;
  String dob;
  UserProfile({this.fName,this.phoneNumber,this.address,this.dob});
  @override
  _UserProfileState createState() => _UserProfileState(fName: fName,phoneNumber: phoneNumber,address: address,dob: dob);
}

class _UserProfileState extends State<UserProfile> {
  String fName;
  String phoneNumber;
  String address;
  String dob;
  _UserProfileState({this.fName,this.phoneNumber,this.address,this.dob});

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        //leading: Icon(Icons.notes),
        title: Row(
          children: [
            Text('User Profile',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500),),
            SizedBox(width: 80,),
            Container(
                width: 100,

                child: Image.asset("assets/images/my_health_logo.png")),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:15.0),
            child: Icon(Icons.notifications,size: 20,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children:[
            Stack(
            children:[
              Container(
              color: Colors.white,
              height: 800,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top:180.0),
                child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right:22.0,left:22),
                       child: Row(
                         children: [
                           Text("Family members",style:GoogleFonts.roboto(color:HexColor('#354291'),fontSize: 16,fontWeight: FontWeight.bold),),
                           Spacer(),
                           Text("View All",style:GoogleFonts.roboto(color:HexColor('#8592E5'),fontSize: 10),),
                         ],
                       ),
                     ),
                     SizedBox(height:10 ,),
                     Material(
                       elevation: 2  ,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                       color: HexColor("#354291"),
                       child: SizedBox(
                         width: 350,
                         height: 40,
                         child: Center(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(Icons.person_add,color: Colors.white,),
                               SizedBox(width: 10,),
                               Text("Add family members",style: GoogleFonts.roboto(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                             ],
                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 10,),
                     Padding(
                       padding: const EdgeInsets.only(right:22.0,left:22),
                       child: Row(
                          children: [
                            Container(
                              color: HexColor('#F7F8FF'),
                              height: 55.0,
                              width: 110,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: HexColor('#354291').withOpacity(0.2),
                                    child: CircleAvatar(
                                      radius: 21,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/f1.png'),
                                        radius: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Nahid Doe",style:  GoogleFonts.roboto(color: HexColor('#0D1231'),fontSize: 10),),
                                        SizedBox(height: 5,),
                                        Text("Brother",style:  GoogleFonts.roboto(color: HexColor('#B8C2F8'),fontSize: 8),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 9,),
                            Container(
                              color: HexColor('#F7F8FF'),
                              height: 55.0,
                              width: 110,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: HexColor('#354291').withOpacity(0.2),
                                    child: CircleAvatar(
                                      radius: 21,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/f2.png'),
                                        radius: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Nahid Doe",style:  GoogleFonts.roboto(color: HexColor('#0D1231'),fontSize: 10),),
                                        SizedBox(height: 5,),
                                        Text("Brother",style:  GoogleFonts.roboto(color: HexColor('#B8C2F8'),fontSize: 8),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 9,),
                            Container(
                              color: HexColor('#F7F8FF'),
                              height: 55.0,
                              width: 110,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: HexColor('#354291').withOpacity(0.2),
                                    child: CircleAvatar(
                                      radius: 21,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/f3.png'),
                                        radius: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Nahid Doe",style:  GoogleFonts.roboto(color: HexColor('#0D1231'),fontSize: 10),),
                                        SizedBox(height: 5,),
                                        Text("Brother",style:  GoogleFonts.roboto(color: HexColor('#B8C2F8'),fontSize: 8),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ],
                       ),
                     ),
                     SizedBox(height: 10,),
                     Padding(
                       padding: const EdgeInsets.only(right:22.0,left:22),
                       child: Row(
                         children: [
                           Text("Personal Info",style:GoogleFonts.roboto(color:HexColor('#354291'),fontSize: 16,fontWeight: FontWeight.bold),),
                           Spacer(),
                           InkWell(
                             onTap:(){
                               _showAlertDialogForEditProfile(context);
                             } ,
                             child: Container(
                               width: 55,
                               height: 20,
                               decoration: BoxDecoration(
                                 border: Border.all(color: HexColor('#354291')),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                               child: Center(child: Text("Edit info",style:  GoogleFonts.roboto(color: HexColor('#354291'),fontSize: 8),)),
                             ),
                           )
                         ],
                       ),
                     ),
                     SizedBox(height:10 ,),
                     Container(
                       color: Colors.white,
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Full name            : $fName",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: HexColor('#F7F8FF'),
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Email address    : doe@gmail.com",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: Colors.white,
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Mobile number   : $phoneNumber",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: HexColor('#F7F8FF'),
                       height: 65.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Address               : $address",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: Colors.white,
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Date of birth        : ${DateUtil().formattedDate(DateTime.parse(dob).toLocal())}",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: HexColor('#F7F8FF'),
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Sex                        : Male",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     SizedBox(height:15,),
                     Padding(
                       padding: const EdgeInsets.only(right:22.0,left:22),
                       child: Row(
                         children: [
                           Text("Change Password",style:GoogleFonts.roboto(color:HexColor('#354291'),fontSize: 16,fontWeight: FontWeight.bold),),
                         ],
                       ),
                     ),
                     SizedBox(height:15 ,),
                     InkWell(
                       onTap: (){
                         _showAlertDialogForPassword(context);
                       },
                       child: Material(
                         elevation: 2  ,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                         color: HexColor("#354291"),
                         child: SizedBox(
                           width: 350,
                           height: 40,
                           child: Center(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("CLICK HERE TO CHANGE",style: GoogleFonts.roboto(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                ),
              ),
            ),
              Container(
                color: HexColor('#E9ECFE'),
                height: 120.0,
                width: double.infinity,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   //color: Colors.grey,
                // ),
              ),

           ]
          ),
            // CircleAvatar(
            //   radius: 10,
            //   backgroundColor: Colors.white,
            //   child: CircleAvatar(
            //     backgroundImage: AssetImage('assets/images/proimg.png'),
            //     radius: 9,
            //   ),
            // ),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  //color: Colors.white,
                  height: 120,
                  width: 120,
                  child:Image.asset('assets/images/pro1.png'),
                ),
              ),
            ),
          ]
        ),
      ),
    );

  }
  void _showAlertDialogForPassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return ChangePasswordAlert();
        });
  }

  void _showAlertDialogForEditProfile(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return EditProfileAlert();
        });
  }

}


class DateUtil {
  static const DATE_FORMAT = 'yyyy-MM-dd';
  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}