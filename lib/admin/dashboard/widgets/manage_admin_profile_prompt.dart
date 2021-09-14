import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/admin/admin_home_screen.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/sign_out_prompt.dart';
import 'package:myhealthbd_app/features/user_profile/view/widgets/switch_account.dart';
import 'package:myhealthbd_app/features/user_profile/view/user_profile_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';


class ManageAdminProfilePrompt extends StatefulWidget {
  @override
  _ManageAdminProfilePromptState createState() =>
      _ManageAdminProfilePromptState();
}

class _ManageAdminProfilePromptState extends State<ManageAdminProfilePrompt> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<UserImageViewModel>(context, listen: false).userImage();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var userInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var photo = userInfoVm.details?.photo ?? "";
    return Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20,
              )),
          width: isTablet
              ? 420
              : width < 330
              ? 300
              : 320.0,
          // constraints: BoxConstraints(
          //   minHeight: isTablet ? 165 : 130,
          // ),
          height: isTablet
              ? 400
              : width < 330
              ? 280
              : 180.0,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // constraints: BoxConstraints(
                    //   minHeight: isTablet
                    //       ? 100
                    //       : width < 330
                    //           ? 140
                    //           : 150.0,
                    // ),
                    //  height: isTablet? 200  : width < 330 ? 140 : 150.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Account",
                                style: GoogleFonts.poppins(
                                    fontSize: isTablet
                                        ? 20
                                        : width < 330
                                        ? 16
                                        : 18,
                                    color: AppTheme.appbarPrimary,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.clear)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              photo != ""
                                  ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.appbarPrimary),
                                    //color: AppTheme.appbarPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  height: isTablet
                                      ? 70
                                      : width < 330
                                      ? 50
                                      : 60,
                                  width: isTablet
                                      ? 70
                                      : width < 330
                                      ? 50
                                      : 60,
                                  child: Center(
                                      child: userInfoVm.loadDoctorProfileImage(
                                          photo,
                                          isTablet
                                              ? 70
                                              : width < 330
                                              ? 50
                                              : 60,
                                          isTablet
                                              ? 70
                                              : width < 330
                                              ? 50
                                              : 60,
                                          50)))
                                  : Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.appbarPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  height: isTablet
                                      ? 70
                                      : width < 330
                                      ? 50
                                      : 60,
                                  width: isTablet
                                      ? 70
                                      : width < 330
                                      ? 50
                                      : 60,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/dPro.png',
                                      height: isTablet
                                          ? 45
                                          : width < 330
                                          ? 30
                                          : 35,
                                      width: isTablet
                                          ? 45
                                          : width < 330
                                          ? 30
                                          : 35,
                                    ),
                                  )),
                              SizedBox(
                                width: isTablet ? 20 : 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text( userInfoVm?.details?.name ??"",  style: GoogleFonts.poppins(
                                       color: AppTheme.appbarPrimary,
                                        fontSize: isTablet ? 18 : 13),),
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  AdminHomeScreen(
                                                    index: 1,
                                                  )),
                                              (Route<dynamic> route) => false);
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minWidth: isTablet
                                            ? 200
                                            : width < 330
                                            ? 150
                                            : 160,
                                      ),
                                      //width: isTablet? 200 :width<330 ? 150 : 160,
                                      height: isTablet ? 35 : 26,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppTheme.appbarPrimary,width: 1),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                          child: Text(
                                            "Manage Your Profile",
                                            style: GoogleFonts.poppins(
                                                color: AppTheme.appbarPrimary,
                                                fontSize: isTablet ? 18 : 12),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SignOutPrompt();
                        });
                  },
                  child: Container(
                    width: isTablet
                        ? 420
                        : width < 330
                        ? 300
                        : 320.0,
                    decoration: BoxDecoration(
                      color: AppTheme.appbarPrimary,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    height: width < 330 ? 35 : 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Out",
                          style: GoogleFonts.poppins(
                              fontSize: isTablet ? 18 : 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout,
                          size: isTablet ? 25 : 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
