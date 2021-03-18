import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/sign_up_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  List<HospitalList> hospitals = [
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur",
        doctorOnline: "60 doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Aalok HealthCare Ltd",
        location: "Mirpur",
        doctorOnline: "70 doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur",
        doctorOnline: "80 doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Aalok HealthCare Ltd",
        location: "Mirpur",
        doctorOnline: "90 doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur",
        doctorOnline: "60 doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur",
        doctorOnline: "60 doctors online",
        hospitalLogo: "assets/images/alok.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colorPrimary,
        title: Text(
          "Hospitals & Diagnostics",
          style: GoogleFonts.poppins(),
        ),
      ),
      body:
          // Column(
          //   children: [
          //     Text("Hospitals & Diagnostics", style: GoogleFonts.poppins(),),
          //     SignUpField(
          //       borderRadius: 30,
          //       hintText: "Type Hospitals/ Diagnosis/ Doctor Chamber",
          //       suffixIcon: Icon(Icons.search_rounded, color: Colors.grey,),
          //     )
          //   ],
          // ),
          SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hospitals & Diagnostics",
              style: GoogleFonts.poppins(),
            ),
            SignUpField(
              borderRadius: 30,
              hintText: "Type Hospitals/ Diagnosis/ Doctor Chamber",
              suffixIcon: Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
            ),
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: hospitals.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        border: Border.all(
                          color: HexColor("#D6DCFF"),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 140,
                                  height: 120,
                                  child: Image.asset(
                                    hospitals[index].hospitalLogo,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(hospitals[index].hospitalName),
                                    Text(hospitals[index].location),
                                    Text(hospitals[index].doctorOnline),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RaisedButton(
                                      color: AppTheme.colorPrimary,
                                      onPressed: () {},
                                      textColor: Colors.white,
                                      child: Text(
                                        "GET APPOINTMENT",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalList {
  String hospitalName;
  String location;
  String doctorOnline;
  String hospitalLogo;

  HospitalList(
      {this.hospitalLogo, this.hospitalName, this.location, this.doctorOnline});
}
