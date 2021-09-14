import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/admin/admin_home_screen.dart';
import 'package:myhealthbd_app/admin/dashboard/dashboard_admin.dart';
import 'package:myhealthbd_app/doctor/doctor_home_screen.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/sign_out_prompt.dart';
import 'package:myhealthbd_app/features/setting/view/setting_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class AdminDashboardDrawer extends StatefulWidget {
  const AdminDashboardDrawer({Key key}) : super(key: key);

  @override
  _AdminDashboardDrawerState createState() => _AdminDashboardDrawerState();
}

class _AdminDashboardDrawerState extends State<AdminDashboardDrawer> {
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    List<DrawerItems> drawerItems = [
      DrawerItems(imageString: dashboardImageIcon, title: 'Dashboard'),
      DrawerItems(imageString: moreImageIcon, title: 'More'),
      DrawerItems(imageString: signOutImageIcon, title: 'Sign out'),
    ];
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var photo = companyInfoVm.details?.photo ?? '';
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: HexColor('#FFFFFF'),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(gradient: AppTheme.doctorDrawerColor),
            child: Center(
                child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => DoctorHomeScreen(
                              index: 2,
                            )),
                    (Route<dynamic> route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: AppTheme.buttonActiveColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                          height: width <= 330 ? 45 : 50,
                          width: width <= 330 ? 45 : 50,
                          child: photo != ''
                              ? companyInfoVm.loadDoctorProfileImage(
                                  photo, 30, 30, 50)
                              : Center(
                                  child: Image.asset(
                                    'assets/images/dPro.png',
                                    height: width <= 330 ? 25 : 30,
                                    width: width <= 330 ? 25 : 30,
                                  ),
                                )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            companyInfoVm.details.name ?? "",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'View Profile',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                ],
              ),
            )),
          ),
          Container(
            height: 700,
            child: ListView.builder(
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: selectedCard == index
                        ? HexColor('#EFF5FF')
                        : Colors.transparent,
                    child: ListTile(
                      leading: SvgPicture.asset(
                        drawerItems[index].imageString,
                        width: 10,
                        height: 22,
                        fit: BoxFit.cover,
                        allowDrawingOutsideViewBox: true,
                        matchTextDirection: true,
                        color: selectedCard == index
                            ? AppTheme.navBarActiveColor
                            : HexColor('#333333'),
                      ),
                      title: Text(
                        drawerItems[index].title,
                        style: GoogleFonts.poppins(
                            color: selectedCard == index
                                ? AppTheme.navBarActiveColor
                                : Colors.black,
                            fontSize: 14),
                      ),
                      onTap: () {
                        setState(() {
                          selectedCard = index;
                        });
                        if (index == 0) {
                          Navigator.pop(context);
                        } else if (index == 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AdminHomeScreen(
                                        index: index,
                                      )),
                              (Route<dynamic> route) => false);
                        } else if (index == 1) {
                          print('more');
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         AppointmentReport()));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SettingScreen()));
                        } else {
                          // setState(() {
                          //   selectedCard = 0;
                          // });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SignOutPrompt();
                              });
                        }
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class DrawerItems {
  String imageString;
  String title;

  DrawerItems({this.title, this.imageString});
}
