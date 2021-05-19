import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/user_profile/view/family_member_list_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/widgets/change_password_prompt.dart';
import 'package:myhealthbd_app/features/user_profile/widgets/edit_profile_prompt.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  String fName;
  String phoneNumber;
  String address;
  String dob;
  String id;
  String accessToken;
  String email;
  String gender;
  String bloodGroup;
  UserProfile({this.fName,this.phoneNumber,this.address,this.dob,this.id,this.accessToken,this.email,this.gender,this.bloodGroup});
  @override
  _UserProfileState createState() => _UserProfileState(fName: fName,phoneNumber: phoneNumber,address: address,dob: dob,email: email,gender: gender,bloodGroup: bloodGroup);
}

class _UserProfileState extends State<UserProfile> {
  String fName;
  String phoneNumber;
  String address;
  String dob;
  String email;
  String gender;
  String bloodGroup;
  _UserProfileState({this.fName,this.phoneNumber,this.address,this.dob,this.email,this.gender,this.bloodGroup});

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );
  //Uint8List _bytesImage;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,() async{
      await Provider.of<UserImageViewModel>(context, listen: false).userImage();
      // _bytesImage =  Base64Decoder().convert( Provider.of<UserImageViewModel>(context, listen: false).details.photo);
      // print(_bytesImage);
    });
    Provider.of<UserDetailsViewModel>(context, listen: false).getData();

    //print(Provider.of<UserImageViewModel>(context, listen: false).image);
    print("abc");
    super.initState();
  }
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print("ish ${await _image.length()}");
        setState(() {

        });
      } else {
        print('No image selected.');
      }

  }
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<UserDetailsViewModel>(context, listen: true);
    var vm2 = Provider.of<UserImageViewModel>(context, listen: true);
    var photo= vm2.details?.photo??"";
    print(photo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        //leading: Icon(Icons.notes),
        title: Row(
          children: [
            Text('User Profile',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500),),

          ],
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.only(right:15.0),
            child: Row(
              children: [
                GestureDetector(
                    child: Text("Save"),
                onTap: (){
                      vm2.updateImage(_image, vm.userDetailsList.hospitalNumber, vm.userDetailsList.ssModifier.toString());
                },
                ),
                SizedBox(width: 10,),
                Icon(Icons.notifications,size: 20,),
              ],
            ),
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
                           InkWell(onTap: (){
                             Navigator.push(
                               context,
                               PageTransition(
                                 type: PageTransitionType.rightToLeft,
                                 child: FamilyMemberListScreen(),
                               ),
                             );
                           },child: Text("View All",style:GoogleFonts.roboto(color:HexColor('#8592E5'),fontSize: 10),)),
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
                               child: Center(child: Text("Edit Info",style:  GoogleFonts.roboto(color: HexColor('#354291'),fontSize: 8),)),
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
                         child: Text("Full name            : ${vm.userDetailsList?.fname??""}",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: HexColor('#F7F8FF'),
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Email address    : ${vm.userDetailsList?.email??""}",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: Colors.white,
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Mobile number   : ${vm.userDetailsList?.phoneMobile??""}",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: HexColor('#F7F8FF'),
                       height: 65.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Address               : ${vm.userDetailsList?.address??""}",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: Colors.white,
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Date of birth        : ${DateUtil().formattedDate(DateTime.parse(vm.userDetailsList?.dob??"").toLocal())}",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: HexColor('#F7F8FF'),
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Gender                  : ${vm.userDetailsList?.gender=="M" ? "Male" : vm.userDetailsList?.gender=="F" ? "Female" : "" }",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
                       ),
                     ),
                     Container(
                       color: Colors.white,
                       height: 40.0,
                       width: double.infinity,
                       child:  Padding(
                         padding: const EdgeInsets.only(left:22.0,top:10),
                         child: Text("Blood Group         : ${vm.userDetailsList?.bloodGroup??""}",style:  GoogleFonts.roboto(color: HexColor('#141D53'),fontSize: 15),),
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
                  height: 145,
                  width: 145,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.appbarPrimary),
                          color: Colors.white,
                        ),
                        //color: Colors.white,
                        height: 120,
                        width: 135,
                        child:photo!=""
                            ? vm2.loadProfileImage(photo, 160,110)
                            :Image.asset('assets/images/dPro.png'),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 55,
                        child: GestureDetector(
                          onTap: (){
                            getImage();
                          },
                          child: Container(
                            height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: AppTheme.appbarPrimary)
                              ),
                              child: Icon(Icons.edit,)),
                        ),
                      )
                    ],
                  ),
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
          return ChangePasswordAlert(widget.accessToken,widget.id);
        });
  }

  void _showAlertDialogForEditProfile(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return EditProfileAlert();
        }).then((value) {
      setState(() {
      });
    });
  }

}


class DateUtil {
  static const DATE_FORMAT = 'dd-MM-yyyy';
  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}