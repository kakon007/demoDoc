import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/doctor_home_screen.dart';
import 'package:myhealthbd_app/features/setting/view/setting_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

import '../appointment_report.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({Key key}) : super(key: key);

  @override
  _DashboardDrawerState createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    List<DrawerItems> drawerItems = [
      DrawerItems(imageString: dashboardImageIcon, title: 'Dashboard'),
      DrawerItems(imageString: workImageIcon, title: 'Worklist'),
      // DrawerItems(imageString: descriptionImageIcon, title: 'Template'),
      // DrawerItems(imageString: prescriptionImageIcon, title: 'Rx Setup'),
      DrawerItems(imageString: moreImageIcon, title: 'More'),
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
                              index: 3,
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
                              ? companyInfoVm.loadProfileImage(
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
                            'Dr. Fazlul Haque',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
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
                        } else if (index == 1) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorHomeScreen(
                                        index: index,
                                      )),
                              (Route<dynamic> route) => false);
                        } else {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AppointmentReport()));
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
