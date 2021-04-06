import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_zefyr_rich_text_from_field.dart';

import '../../../constant.dart';
import 'switch_account_alert_dialog.dart';

class SwitchAccount extends StatefulWidget {
  @override
  _SwitchAccountState createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SwitchAccount> {
  List<AccountList> accounts = [
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: true,
        whoseAccount: "Mine"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Brother"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Cousin"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Father"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Mother"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Cousin Brother"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Sister"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Uncle"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Rakib's"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Cousin"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Grandmother"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Grandfather"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Cousin"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Brother"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Sister"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Sister"),
    AccountList(
        name: "John Doe",
        imageUrl: "assets/images/doctor.png",
        isLoggedIn: false,
        whoseAccount: "Brother"),
  ];

  @override
  Widget build(BuildContext context) {
    var spaceBetween = SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Switch Account",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Switch Account",
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: HexColor("#354291"),
                  fontWeight: FontWeight.w500),
            ),
            spaceBetween,
            DashedContainer(
              dashColor: AppTheme.appbarPrimary,
              borderRadius: 5.0,
              dashedLength: 15.0,
              blankLength: 5.0,
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_add_sharp,
                      color: AppTheme.appbarPrimary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        _showAlert(context);
                      },
                      child: Text("Add New Account",
                          style: GoogleFonts.poppins(color: HexColor("#354291"))),
                    ),
                  ],
                ),
              ),
            ),
            spaceBetween,
            spaceBetween,
            Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: accounts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? HexColor("#F0F2FF")
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(bottom: 2),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: HexColor("##8592E5"),
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(accounts[index].imageUrl),
                                      radius: 28.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        accounts[index].name,
                                        style: GoogleFonts.poppins(
                                            color: HexColor("#0D1231"),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      accounts[index].isLoggedIn == false
                                          ? Text(
                                              accounts[index].whoseAccount,
                                              style: GoogleFonts.poppins(
                                                  color: HexColor("#B8C2F8")),
                                            )
                                          : Row(
                                              children: [
                                                Text(
                                                  "Signed In",
                                                  style: GoogleFonts.poppins(
                                                      color:
                                                          HexColor("#B8C2F8")),
                                                ),
                                                Icon(Icons.check,
                                                    color: HexColor("#D6DCFF"))
                                              ],
                                            )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  accounts[index].isLoggedIn == false
                                      ? Container(
                                          height: 16,
                                          child: Image.asset(
                                              "assets/images/swap.png"))
                                      : SizedBox(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  accounts[index].isLoggedIn == false
                                      ? GestureDetector(
                                          child: Icon(Icons.delete_sweep,
                                              color: HexColor("#D6DCFF")),
                                          onTap: () {
                                            showGeneralDialog(
                                              barrierLabel: "Label",
                                              barrierDismissible: true,
                                              barrierColor:
                                                  Colors.black.withOpacity(0.5),
                                              transitionDuration:
                                                  Duration(milliseconds: 700),
                                              context: context,
                                              pageBuilder:
                                                  (context, anim1, anim2) {
                                                return Stack(
                                                  children: [
                                                    Align(
                                                      // alignment: Alignment.bottomCenter,
                                                      child: Material(
                                                        type: MaterialType
                                                            .transparency,
                                                        child: Container(
                                                          height: 200,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                HexColor(
                                                                    '#fdf0f2'),
                                                                HexColor(
                                                                    '#FFFFFF')
                                                              ],
                                                              tileMode: TileMode
                                                                  .repeated,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 60.0),
                                                            child: Center(
                                                              child: Column(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          Text("Remove ", style: GoogleFonts.poppins()),
                                                                          Text(accounts[index].name,style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                                                          Text(" from", style: GoogleFonts.poppins())
                                                                        ],
                                                                      ),
                                                                      Text("your account list.", style: GoogleFonts.poppins())
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            25.0),
                                                                    child: Row(
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            elevation:
                                                                                0,
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: HexColor('#354291'))),
                                                                            color:
                                                                                Colors.white,
                                                                            child:
                                                                                SizedBox(
                                                                              height: 50,
                                                                              width: 150,
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Text(
                                                                                    "Cancel",
                                                                                    style: TextStyle(color: HexColor('#354291'), fontWeight: FontWeight.w500, fontSize: 15),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              15,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            elevation:
                                                                                0,
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                            color:
                                                                                HexColor('#354291'),
                                                                            child:
                                                                                SizedBox(
                                                                              height: 50,
                                                                              width: 150,
                                                                              child: Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Text(
                                                                                    "Remove",
                                                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              3.35,
                                                      left: 100,
                                                      right: 100,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        radius: Constants
                                                            .avatarRadius,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        Constants
                                                                            .avatarRadius)),
                                                            child: Image.asset(
                                                                "assets/images/warning.png")),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              transitionBuilder: (context,
                                                  anim1, anim2, child) {
                                                return SlideTransition(
                                                  position: Tween(
                                                          begin: Offset(0, 2),
                                                          end: Offset(0, 0))
                                                      .animate(anim1),
                                                  child: child,
                                                );
                                              },
                                            );
                                          },
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            ],
                          ));
                    }),
              ),
            ),
            spaceBetween,
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SwitchAccountAlert();
        });
  }
}

class AccountList {
  String name;
  String imageUrl;
  bool isLoggedIn;
  String whoseAccount;

  AccountList({this.isLoggedIn, this.imageUrl, this.name, this.whoseAccount});
}
