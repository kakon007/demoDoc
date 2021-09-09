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
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DrawerScreen extends StatefulWidget {
  String accessToken;
  final Function(int) menuCallBack;
  DrawerScreen({
    @required this.accessToken,
    @required this.menuCallBack,
  });
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int selectedMenuIndex = 0;
  String fName;
  String phoneNumber;
  String address;
  String dob;

  List<String> menuItem = [
    "Dashboard",
    "Book Test",
    "Appointments",
    "Prescriptions",
    // "Reports",
    // "Documents",
    "Family Members",
    "Switch Account",
    "Notifications",
    "More",
  ];

  List<String> menuItem2 = [
    "Dashboard",
    "Book Test",
    "Appointments",
    "Prescriptions",
    // "Reports",
    // "Documents",
    "More",
  ];

  Widget buildMenuRow(int index) {
    bool isSelected = selectedMenuIndex == index;
    return InkWell(
      onTap: () {
        // setState(() {
        // selectedMenuIndex = index;
        widget.menuCallBack(index);
        // });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 5),
        child: Column(children: [
          Row(
            children: [
              isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: HexColor("#FFFFFF"),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Text(
                              widget.accessToken == null ? menuItem2[index] : menuItem[index],
                              key: Key('menuItemBeforeSignIn$index'),
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor('#354291')),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(
                      widget.accessToken == null ? menuItem2[index] : menuItem[index],
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]),
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
    Future.delayed(Duration.zero, () async {
      await Provider.of<UserImageViewModel>(context, listen: false).userImage();
    });
    var vm = Provider.of<UserDetailsViewModel>(context, listen: false);
    vm.getData();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    var vm = Provider.of<UserDetailsViewModel>(context);
    var vm9 = Provider.of<AccessTokenProvider>(context, listen: false);
    var vm10 = Provider.of<UserImageViewModel>(context, listen: true);
    var photo = vm10.details?.photo ?? "";
    Obj userDetails = vm.userDetailsList;
    var devicewidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 60, bottom: 20),
          color: HexColor('#141D53'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              vm9.accessToken == null
                  ? SizedBox()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: photo != ""
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, width: 1.5),
                                    //color: AppTheme.appbarPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  height: width <= 330 ? 50 : 55,
                                  width: width <= 330 ? 50 : 55,
                                  child: Center(
                                      child: vm10.loadProfileImage(photo, width <= 330 ? 45 : 50,
                                          width <= 330 ? 45 : 50, 50)))
                              : Container(
                                  decoration: BoxDecoration(
                                      color: AppTheme.signInSignUpColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)),
                                  height: width <= 330 ? 45 : 50,
                                  width: width <= 330 ? 45 : 50,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/dPro.png',
                                      height: width <= 330 ? 25 : 30,
                                      width: width <= 330 ? 25 : 30,
                                    ),
                                  )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                vm.shouldShowPageLoader
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(AppTheme.appbarPrimary),
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.centerLeft,
                                        width: 140,
                                        child: Text(
                                          userDetails?.fname ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                              fontSize: isTablet
                                                  ? 18
                                                  : width <= 360
                                                      ? 12
                                                      : 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),

                                SizedBox(
                                  width: 80,
                                ),
                                //Icon(Icons.close,color: Colors.white,size: 18,)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: 140,
                                child: Text(userDetails?.hospitalNumber ?? "Loading...",
                                    maxLines: 2,
                                    style: GoogleFonts.roboto(
                                      color: HexColor('#B8C2F8'),
                                      fontSize: isTablet
                                          ? 16
                                          : width <= 360
                                              ? 10
                                              : 13,
                                    ))),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        )
                      ],
                    ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: widget.accessToken == null
                          ? menuItem2
                              .asMap()
                              .entries
                              .map((mapEntry) => buildMenuRow(mapEntry.key))
                              .toList()
                          : menuItem
                              .asMap()
                              .entries
                              .map((mapEntry) => buildMenuRow(mapEntry.key))
                              .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: devicewidth / 2.1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)
                  //borderRadius: BorderRadius.all(Radius.circular())
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
