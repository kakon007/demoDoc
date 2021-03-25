import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';

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
    var searchField = SignUpFormField(
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
    var hospital= SingleChildScrollView(
      physics: ScrollPhysics(),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: hospitals.length,
          itemBuilder: (BuildContext context, int index){
        return HospitalListCard(
          image: hospitals[index].hospitalLogo,
          buttonName: StringResources.getAppointmentButton,
          hospitalLocation: hospitals[index].location,
          hospitalTitle: hospitals[index].hospitalName,
          onlineDoctors: hospitals[index].doctorOnline,
        );
      }),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.appbarPrimary,
        title: Text(
          StringResources.hospitalListAppbar,
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            searchField,
            Expanded(child: hospital),
          ],
        ),
      ),
    );
  }
}
