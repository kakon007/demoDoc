import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/userdetails_repository.dart';
import 'package:myhealthbd_app/features/user_profile/view/user_profile_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';



// ignore: must_be_immutable
class DrawerScreen extends StatefulWidget {
  String accessToken;
  final Function(int) menuCallBack;
  DrawerScreen({@required this.accessToken,@required this.menuCallBack});
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
    "Notifications",
    "Settings",
    "Family Members",
    "Switch Account",
    "Sign Out",
  ];

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
                   widget.accessToken==null?menuItem2[index]:menuItem[index],
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#354291')),
                  ),
                ),
            ),),
              ):
        Text(
          widget.accessToken==null?menuItem2[index]:menuItem[index],
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
    //fetchUserDetails();
    var vm2 = Provider.of<AccessTokenProvider>(context, listen: false);
    UserDetailsRepository().fetchUserDetails(vm2.accessToken);
    super.initState();

    var vm = Provider.of<UserDetailsViewModel>(context, listen: false);
    vm.getData(vm2.accessToken);
  }


  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<UserDetailsViewModel>(context);
    var vm9 = Provider.of<AccessTokenProvider>(context, listen: false);
    Obj userDetails = vm.userDetailsList;
    var devicewidth=MediaQuery.of(context).size.width;
    return Stack(
      children:[

        Container(
        padding: EdgeInsets.only(top: 60,bottom: 20),
        color: HexColor('#141D53'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           vm9.accessToken==null?SizedBox():InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile(fName: userDetails.patientName,phoneNumber: userDetails.phoneMobile,address: userDetails.address,dob: userDetails.dob,id:userDetails.hospitalNumber ,accessToken: widget.accessToken,email: userDetails.email,gender: userDetails.gender,bloodGroup: userDetails.bloodGroup,)));
                print("Presssss");
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dPro.png'),
                        radius: 27,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          vm.shouldShowPageLoader
                              ? Center(
                            child: CircularProgressIndicator(  valueColor:
                            AlwaysStoppedAnimation<Color>(
                                AppTheme.appbarPrimary),),
                          ):
                           Container(
                                  width: devicewidth*0.5,
                                  child: Text(
                                    userDetails?.fname??'Jahid',
                                      maxLines:1,overflow:TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),

                          SizedBox(width: 80,),
                          //Icon(Icons.close,color: Colors.white,size: 18,)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(userDetails?.address??"Dhaka", style: GoogleFonts.roboto(color: HexColor('#B8C2F8'),fontSize: 12)),
                      SizedBox(height: 8,),
                      Container(
                        width: 120,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(color: HexColor('#8592E5')),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(child: Text("Update My Profile",style:  GoogleFonts.roboto(color: HexColor('#B8C2F8'),fontSize: 8),)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: Column(
                    children:widget.accessToken==null? menuItem2.asMap().entries.map((mapEntry) => buildMenuRow(mapEntry.key)).toList():menuItem.asMap().entries.map((mapEntry) => buildMenuRow(mapEntry.key)).toList(),
                  ),
                ),
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
        ),],
    );
  }
}
