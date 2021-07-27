import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({Key key}) : super(key: key);

  @override
  _DashboardDrawerState createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: AppTheme.dashboardBackgroundColor,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(gradient: AppTheme.doctorDrawerColor),
            child: Center(
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
                        child: Center(
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
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'View Profile',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
              ],
            )),
          ),
          ListTile(
            leading: SvgPicture.asset(
              dashboardImageIcon,
              width: 10,
              height: 20,
              fit: BoxFit.cover,
              allowDrawingOutsideViewBox: true,
              matchTextDirection: true,
              color: AppTheme.navBarActiveColor,
            ),
            title: Text(
              'Dashboard',
              style: GoogleFonts.poppins(
                color: AppTheme.navBarActiveColor,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              workImageIcon,
              width: 10,
              height: 20,
              fit: BoxFit.cover,
              allowDrawingOutsideViewBox: true,
              matchTextDirection: true,
              color: AppTheme.navBarActiveColor,
            ),
            title: Text(
              'Workllist',
              style: GoogleFonts.poppins(
                color: AppTheme.navBarActiveColor,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              prescriptionImageIcon,
              width: 10,
              height: 20,
              fit: BoxFit.cover,
              allowDrawingOutsideViewBox: true,
              matchTextDirection: true,
              color: AppTheme.navBarActiveColor,
            ),
            title: Text(
              'Prescription',
              style: GoogleFonts.poppins(
                color: AppTheme.navBarActiveColor,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              prescriptionImageIcon,
              width: 10,
              height: 20,
              fit: BoxFit.cover,
              allowDrawingOutsideViewBox: true,
              matchTextDirection: true,
              color: AppTheme.navBarActiveColor,
            ),
            title: Text(
              'Rx Setup',
              style: GoogleFonts.poppins(
                color: AppTheme.navBarActiveColor,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              prescriptionImageIcon,
              width: 10,
              height: 20,
              fit: BoxFit.cover,
              allowDrawingOutsideViewBox: true,
              matchTextDirection: true,
              color: AppTheme.navBarActiveColor,
            ),
            title: Text(
              'More',
              style: GoogleFonts.poppins(
                color: AppTheme.navBarActiveColor,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
