import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/user_profile/view/family_member_list_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
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

  UserProfile(
      {this.fName,
      this.phoneNumber,
      this.address,
      this.dob,
      this.id,
      this.accessToken,
      this.email,
      this.gender,
      this.bloodGroup});

  @override
  _UserProfileState createState() => _UserProfileState(
      fName: fName,
      phoneNumber: phoneNumber,
      address: address,
      dob: dob,
      email: email,
      gender: gender,
      bloodGroup: bloodGroup);
}

class _UserProfileState extends State<UserProfile> {
  String fName;
  String phoneNumber;
  String address;
  String dob;
  String email;
  String gender;
  String bloodGroup;

  _UserProfileState(
      {this.fName,
      this.phoneNumber,
      this.address,
      this.dob,
      this.email,
      this.gender,
      this.bloodGroup});

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );
  String response;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      await Provider.of<UserImageViewModel>(context, listen: false).userImage();
      var userVm = Provider.of<UserDetailsViewModel>(context,listen: false);
      await userVm.getData();
      var familyVm = Provider.of<FamilyMembersListViewModel>(context,listen: false);
      familyVm.familyMembers(userVm.userDetailsList.hospitalNumber);
    });
    Provider.of<UserDetailsViewModel>(context, listen: false).getData();
    super.initState();
  }

  File _image;
  final picker = ImagePicker();
  bool isEdit = false;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      print("ish ${await _image.length()}");
      setState(() {
        isEdit = true;
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<UserDetailsViewModel>(context, listen: true);
    var vm2 = Provider.of<UserImageViewModel>(context, listen: true);
    var familyVm = Provider.of<FamilyMembersListViewModel>(context,listen: false);
    var userId = vm.userDetailsList.id;
    var hospitalNumber = vm.userDetailsList.hospitalNumber;
    var regDate = vm.userDetailsList.regDate;
    var photo = vm2.details?.photo ?? "";
    var pickBirthDate = DateFormat("yyyy-MM-dd")
        .parse(vm.userDetailsList.dob)
        .add(Duration(days: 1));
    String _formatDate = DateFormat("yyyy-MM-dd").format(pickBirthDate);
    var _selectedBlood = vm.userDetailsList.bloodGroup != null
        ? vm.userDetailsList.bloodGroup
        : null;
    var _selectedGender = vm.userDetailsList.gender == "M"
        ? "Male"
        : "Female";
    print(photo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        //leading: Icon(Icons.notes),
        title: Row(
          children: [
            Text(
              'User Profile',
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                isEdit
                    ? GestureDetector(
                        child: Text("Save", style: GoogleFonts.poppins(),),
                        onTap: () async {
                          print("Sha ${vm.userDetailsList.id}");
                          await vm2.updateImage(
                              _image,
                              vm.userDetailsList.hospitalNumber,
                              vm2.details.userId.toString());
                          await vm2.updateProfile2(
                              _image,
                              userId.toString(),
                              vm.userDetailsList.fname,
                             vm.userDetailsList.email,
                              vm.userDetailsList.phoneMobile,
                              vm.userDetailsList.address,
                              _formatDate,
                              _selectedGender,
                              _selectedBlood,
                              hospitalNumber,
                              regDate
                          );
                          response= vm2.resStatusCode;
                          setState(() {
                            if(response=="200"){
                              isEdit = false;
                              _image = null;
                              response=null;
                            }

                          });
                        },
                      )
                    : Text(""),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.notifications,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Stack(children: [
            Container(
              color: Colors.white,
              height: 800,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0, left: 22),
                      child: Row(
                        children: [
                          Text(
                            "Family Members",
                            style: GoogleFonts.roboto(
                                color: HexColor('#354291'),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: FamilyMemberListScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: AppTheme.appbarPrimary),
                                ),
                                height: 20,
                                width: 60,

                                child: Center(
                                  child: Text(
                                    "View All",
                                    style: GoogleFonts.roboto(
                                        color: AppTheme.appbarPrimary, fontSize: 10),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: FamilyMemberListScreen(),
                          ),
                        );
                      },
                      child: Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: HexColor("#354291"),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*.9,
                          height: 40,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add family members",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: Row(
                        children: [
                          // Container(
                          //   color: HexColor('#F7F8FF'),
                          //   height: 55.0,
                          //   width: 102,
                          //   child: Row(
                          //     children: [
                          //       CircleAvatar(
                          //         radius: 22,
                          //         backgroundColor:
                          //             HexColor('#354291').withOpacity(0.2),
                          //         child: CircleAvatar(
                          //           radius: 21,
                          //           backgroundColor: Colors.white,
                          //           child: CircleAvatar(
                          //             backgroundImage:
                          //                 AssetImage('assets/images/f1.png'),
                          //             radius: 20,
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 10.0),
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Nahid Doe",
                          //               style: GoogleFonts.roboto(
                          //                   color: HexColor('#0D1231'),
                          //                   fontSize: 10),
                          //             ),
                          //             SizedBox(
                          //               height: 5,
                          //             ),
                          //             Text(
                          //               "Brother",
                          //               style: GoogleFonts.roboto(
                          //                   color: HexColor('#B8C2F8'),
                          //                   fontSize: 8),
                          //             ),
                          //           ],
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 9,
                          // ),
                          // Container(
                          //   color: HexColor('#F7F8FF'),
                          //   height: 55.0,
                          //   width: 110,
                          //   child: Row(
                          //     children: [
                          //       CircleAvatar(
                          //         radius: 22,
                          //         backgroundColor:
                          //             HexColor('#354291').withOpacity(0.2),
                          //         child: CircleAvatar(
                          //           radius: 21,
                          //           backgroundColor: Colors.white,
                          //           child: CircleAvatar(
                          //             backgroundImage:
                          //                 AssetImage('assets/images/f2.png'),
                          //             radius: 20,
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 10.0),
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Nahid Doe",
                          //               style: GoogleFonts.roboto(
                          //                   color: HexColor('#0D1231'),
                          //                   fontSize: 10),
                          //             ),
                          //             SizedBox(
                          //               height: 5,
                          //             ),
                          //             Text(
                          //               "Brother",
                          //               style: GoogleFonts.roboto(
                          //                   color: HexColor('#B8C2F8'),
                          //                   fontSize: 8),
                          //             ),
                          //           ],
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 9,
                          // ),
                          // Container(
                          //   color: HexColor('#F7F8FF'),
                          //   height: 55.0,
                          //   width: 110,
                          //   child: Row(
                          //     children: [
                          //       CircleAvatar(
                          //         radius: 22,
                          //         backgroundColor:
                          //             HexColor('#354291').withOpacity(0.2),
                          //         child: CircleAvatar(
                          //           radius: 21,
                          //           backgroundColor: Colors.white,
                          //           child: CircleAvatar(
                          //             backgroundImage:
                          //                 AssetImage('assets/images/f3.png'),
                          //             radius: 20,
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 10.0),
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Nahid Doe",
                          //               style: GoogleFonts.roboto(
                          //                   color: HexColor('#0D1231'),
                          //                   fontSize: 10),
                          //             ),
                          //             SizedBox(
                          //               height: 5,
                          //             ),
                          //             Text(
                          //               "Brother",
                          //               style: GoogleFonts.roboto(
                          //                   color: HexColor('#B8C2F8'),
                          //                   fontSize: 8),
                          //             ),
                          //           ],
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 22.0, left: 22),
                      child: Row(
                        children: [
                          Text(
                            "Personal Info",
                            style: GoogleFonts.roboto(
                                color: HexColor('#354291'),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              _showAlertDialogForEditProfile(context);
                            },
                            child: Container(
                              width: 60,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: HexColor('#354291')),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                     Row(children: [
                                       Icon(
                                         Icons.edit, color: AppTheme.appbarPrimary,size: 13,
                                       ),
                                       Text(
                                         "Edit Info",
                                         style: GoogleFonts.roboto(
                                             color: HexColor('#354291'), fontSize: 10),
                                       ),
                                     ],),
                                      SizedBox(),
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: 40.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                        child: Text(
                          "Full Name            : ${vm.userDetailsList?.fname ?? ""}",
                          style: GoogleFonts.roboto(
                              color: HexColor('#141D53'), fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      color: HexColor('#F7F8FF'),
                      height: 40.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                        child: Text(
                          "Email Address    : ${vm.userDetailsList?.email ?? ""}",
                          style: GoogleFonts.roboto(
                              color: HexColor('#141D53'), fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 40.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                        child: Text(
                          "Mobile Number   : ${vm.userDetailsList?.phoneMobile ?? ""}",
                          style: GoogleFonts.roboto(
                              color: HexColor('#141D53'), fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      color: HexColor('#F7F8FF'),
                      height: 65.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                        child: Text(
                          "Address               : ${vm.userDetailsList?.address ?? ""}",
                          style: GoogleFonts.roboto(
                              color: HexColor('#141D53'), fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 40.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                        child: Text(
                          "Date of Birth        : ${DateUtil().formattedDate(DateTime.parse(vm.userDetailsList?.dob ?? "").toLocal())}",
                          style: GoogleFonts.roboto(
                              color: HexColor('#141D53'), fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      color: HexColor('#F7F8FF'),
                      height: 40.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                        child: Text(
                          "Gender                  : ${vm.userDetailsList?.gender == "M" ? "Male" : vm.userDetailsList?.gender == "F" ? "Female" : ""}",
                          style: GoogleFonts.roboto(
                              color: HexColor('#141D53'), fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 40.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, top: 10),
                        child: Text(
                          "Blood Group         : ${vm.userDetailsList?.bloodGroup ?? ""}",
                          style: GoogleFonts.roboto(
                              color: HexColor('#141D53'), fontSize: 15),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 22.0, left: 22),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Change Password",
                    //         style: GoogleFonts.roboto(
                    //             color: HexColor('#354291'),
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        _showAlertDialogForPassword(context);
                      },
                      child: Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: HexColor("#354291"),
                        child: SizedBox(
                          width: 350,
                          height: 40,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Change Password",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
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
          ]),
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
              padding: const EdgeInsets.only(top: 30.0),
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
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(19),
                              child: Image.file(
                                _image,
                                height: 100,
                                width: 60,
                                fit: BoxFit.fill,
                              ))
                          : photo != ""
                              ? vm2.loadProfileImage(photo, 100, 60, 19)
                              : Image.asset('assets/images/dPro.png'),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 55,
                      child: GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border:
                                    Border.all(color: AppTheme.appbarPrimary)),
                            child: Icon(
                              Icons.camera_alt, color: AppTheme.appbarPrimary,size: 18,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _showAlertDialogForPassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return ChangePasswordAlert(widget.accessToken, widget.id);
        });
  }

  void _showAlertDialogForEditProfile(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return EditProfileAlert();
        }).then((value) {
      setState(() {});
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
