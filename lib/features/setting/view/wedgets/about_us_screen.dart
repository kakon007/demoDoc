import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/app_version.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appbarPrimary,
        title: Text(
          'About us',
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right:20.0),
                child: Container(
                    width: 250,
                    child: Image.asset(
                        "assets/images/my_health_logo.png")),
              ),
              AppVersionWidgetSmall(),
              SizedBox(height: 30,),
              Container(
                width: 300,
                child: Column(
                  children: [
                    Text(
                      'MyHealthBD is a platform for an Enhanced Healthcare Ecosystem.',style: TextStyle(
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                        'MyHealthBD works for healthcare professionals to find patients as well as to find the right doctor and the right hospital services for patients. It is a platform for all – patients, doctors, hospital owners, healthcare professionals, and other healthcare services providers to meet the need for better health for all. A patient can obtain all kinds of hospital services, such as online doctor\'s appointment booking, telemedicine, teleradiology, electronic medical record, patient portal, ambulance service, home sample collection for diagnosis etc., just by clicking away. Our effort is to establish a one-stop healthcare platform in Bangladesh for everyone.',
                      style: TextStyle(
                        color: HexColor('#707070'),)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
