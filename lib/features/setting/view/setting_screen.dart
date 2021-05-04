import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appbarPrimary,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Change Password",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
                  Text('Choose a unique password',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
                ],
              ),
            ),
            Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Us",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
                  Text('We are always happy to provide you any information \nregarding MyHealthBD',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
                ],
              ),
            ),
            Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Privacy Policy",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
                  Text('Read our Privacy Policy',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
                ],
              ),
            ),
            Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About MyHealthBD",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
                  Text('Want to know more?',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
                ],
              ),
            ),
            Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign out",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
                      Text('Choose a unique password',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.logout),
                ],
              ),
            ),
            Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Version 1.0.12",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
                 // Text('Choose a unique password',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
                ],
              ),
            ),
            Divider(thickness: 1,),



          ],
        ),
      ),
    );
  }
}
