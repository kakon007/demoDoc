import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  List<HospitalList> hospitals = [
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "60 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
    HospitalList(
        hospitalName: "Aalok HealthCare Ltd",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "70 Doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "80 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
    HospitalList(
        hospitalName: "Aalok HealthCare Ltd",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "90 Doctors online",
        hospitalLogo: "assets/images/alok.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "60 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
    HospitalList(
        hospitalName: "Proyas Health Care",
        location: "Mirpur, Dhaka, Bangladesh",
        doctorOnline: "60 Doctors online",
        hospitalLogo: "assets/images/proyas.png"),
  ];
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var height = MediaQuery.of(context).size.height;
    var cardWidth = MediaQuery.of(context).size.width * 0.3435;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 15.0 : 10.0,
    );
    var searchField=  SignUpField(
      borderRadius: 30,
      hintText: StringResources.searchBoxHint,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.search_rounded,
          color: Colors.grey,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.appbarPrimary,
        title: Text(
          StringResources.hospitalListAppbar,
          style: GoogleFonts.roboto(fontSize: 15),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
            },
          )
        ],
      ),
      body:
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            //spaceBetween,
            // Padding(
            //   padding: const EdgeInsets.only(left: 10.0),
            //   child: Text(
            //     "Hospitals & Diagnostics",
            //     style: GoogleFonts.poppins(color:AppTheme.colorPrimary, fontSize: 20 ),
            //   ),
            // ),
          searchField,
            Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: hospitals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: cardHeight*1.15,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
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
                                SizedBox(
                                  width: cardHeight *0.1,
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width: cardWidth*0.9,
                                        height: cardHeight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            hospitals[index].hospitalLogo,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: cardHeight *0.08,
                                ),
                                Container(
                                  width: cardWidth * 1.58,
                                  height: cardHeight*1.13,
                                  decoration: BoxDecoration(
                                    color: HexColor("#FFFFFF"),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: cardWidth/8, top: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(hospitals[index].hospitalName, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),),
                                        Text(hospitals[index].location, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12, ),),

                                        Row(children: [
                                          Icon(Icons.circle, color: HexColor("#1EE573"),size: 15,),
                                          SizedBox(width: 5,),
                                          Text(hospitals[index].doctorOnline, style: GoogleFonts.poppins(fontSize: 12, ),),
                                        ],),
                                        SizedBox(
                                          height: cardHeight/9,
                                        ),
                                        Container(
                                          width: cardWidth*1.3,
                                          child: RaisedButton(
                                            color: AppTheme.appbarPrimary,
                                            onPressed: () {
                                            },
                                            textColor: Colors.white,
                                            child: Text(
                                              StringResources.getAppointmentButton,
                                              style: GoogleFonts.poppins(fontSize: 10,color: Colors.white, fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
        ],
      ),
          ),
    );
  }
}
