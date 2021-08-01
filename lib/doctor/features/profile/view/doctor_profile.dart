import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/company_info.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/my_info.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/personal_info.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/doctor_profile_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorProfileViewModel>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var imageSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.buttonActiveColor),
              color: Colors.white,
            ),
            height: 140,
            width: width <= 330 ? 140 : 160,
            child: Center(
              child: Image.asset(
                'assets/images/dPro.png',
                height: 100,
                width: width <= 330 ? 100 : 120,
              ),
            )),
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                    minWidth: MediaQuery.of(context).size.width * .45,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: AppTheme.buttonActiveColor,
                    onPressed: () {},
                    child: Text(
                      'Update Your Avatar',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: width <= 330 ? 12 : 15),
                    )),
                //Text('*Your photo should be friendly and head shot. Clearly identitifiable as you.',maxLines: 2,)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * .45,
                    child: Text(
                      '*Your photo should be friendly and head shot. Clearly identitifiable as you.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ),
          ],
        ),
      ],
    );
    var personalInfoTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 1;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .27,
        decoration: BoxDecoration(
            color: index == 1 ? AppTheme.buttonActiveColor : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
        child: Center(
            child: Text(
          'Personal Info',
          style: GoogleFonts.poppins(
            color: index == 1 ? Colors.white : Colors.black,
          ),
        )),
      ),
    );
    var contactInfoTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 2;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .27,
        decoration: BoxDecoration(
            color: index == 2 ? AppTheme.buttonActiveColor : Colors.white,
            border: Border(
              left: BorderSide(
                color: AppTheme.buttonInActiveColor,
                width: 1,
              ),
              right: BorderSide(
                color: AppTheme.buttonInActiveColor,
                width: 1,
              ),
            )),
        child: Center(
            child: Text(
          'Company Info',
          style: GoogleFonts.poppins(
            color: index == 2 ? Colors.white : Colors.black,
          ),
        )),
      ),
    );
    var myInfoTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 3;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .21,
        decoration: BoxDecoration(
            color: index == 3 ? AppTheme.buttonActiveColor : Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: Center(
            child: Text(
          'Doctor Info',
          style: GoogleFonts.poppins(
            color: index == 3 ? Colors.white : Colors.black,
          ),
        )),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          "My Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                children: [
                  imageSection,
                  spaceBetween,
                  spaceBetween,
                  spaceBetween,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: HexColor("#FFFFFF"),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#0D1231").withOpacity(0.08),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(3, 1), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: index == 1
                            ? PersonalInfo()
                            : index == 2
                                ? CompanyInfo()
                                : MyInfo()),
                  ),
                  spaceBetween,
                  index == 1
                      ? !vm.isPersonalInfoEditing? FlatButton(
                          minWidth: MediaQuery.of(context).size.width,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          color: AppTheme.buttonActiveColor,
                          onPressed: () {
                            setState(() {
                              vm.editingPersonalInfo(isPersonalInfoEditing: true);
                            });
                          },
                          child: Text(
                            'Edit Your Profile',
                            style: GoogleFonts.poppins(color: Colors.white),
                          )) :  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                          minWidth:
                          MediaQuery.of(context).size.width *
                              .4,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(5)),
                          color: AppTheme.buttonActiveColor,
                          onPressed: () {
                            setState(() {
                              vm.editingPersonalInfo(isPersonalInfoEditing: false);
                            });
                          },
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                                color: Colors.white),
                          )),
                      FlatButton(
                          minWidth:
                          MediaQuery.of(context).size.width *
                              .4,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(5)),
                          color: AppTheme.buttonActiveColor,
                          onPressed: () {
                            setState(() {
                              vm.editingPersonalInfo(isPersonalInfoEditing: false);
                            });
                          },
                          child: Text(
                            'Save',
                            style: GoogleFonts.poppins(
                                color: Colors.white),
                          ))
                    ],
                  )
                      : index == 3
                          ? !vm.isDoctorInfoEditing
                              ? FlatButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: AppTheme.buttonActiveColor,
                                  onPressed: () {
                                    setState(() {
                                      vm.editingDoctorInfo(isDoctorInfoEditing: true);
                                    });
                                  },
                                  child: Text(
                                    'Update My Profile',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ))
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlatButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        color: AppTheme.buttonActiveColor,
                                        onPressed: () {
                                          setState(() {
                                            vm.editingDoctorInfo(isDoctorInfoEditing: false);
                                          });
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        )),
                                    FlatButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        color: AppTheme.buttonActiveColor,
                                        onPressed: () {
                                          setState(() {
                                            vm.editingDoctorInfo(isDoctorInfoEditing: false);
                                          });
                                        },
                                        child: Text(
                                          'Save',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ))
                                  ],
                                )
                          : SizedBox(),
                ],
              ),
            ),
            Positioned(
              top: 165,
              right: MediaQuery.of(context).size.width * .125,
              left: MediaQuery.of(context).size.width * .125,
              child: Container(
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#0D1231").withOpacity(0.08),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                height: 40, width: MediaQuery.of(context).size.width * .5,
                child: Row(
                  children: [personalInfoTab, contactInfoTab, myInfoTab],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
