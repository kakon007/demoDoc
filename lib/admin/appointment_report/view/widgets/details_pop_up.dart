import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class AdminPopup extends StatefulWidget {

  @override
  _AdminPopupState createState() => _AdminPopupState();
}

class _AdminPopupState extends State<AdminPopup> {
  @override
  Widget build(BuildContext context) {
    // bool isDesktop = Responsive.isDesktop(context);
    // bool isTablet = Responsive.isTablet(context);
    // bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var table_width = width * 0.90;
    var table_height = height * 0.43;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#EBECF3'),
          //color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        width: table_width,
        height: table_height + 8,

        // width: isTablet
        //     ? 600
        //     : width < 330
        //     ? 300
        //     : 320.0,
        // height: isTablet
        //     ? 400
        //     : width < 330
        //     ? 280
        //     : 323.0,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: HexColor("#141D53"),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                  height: table_height * 0.135,
                  child: Padding(
                    padding: EdgeInsets.only(left: table_width * 0.22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mr. Jahid Hasan Shohag",
                          style: GoogleFonts.poppins(
                              fontWeight:
                              FontWeight.w500,
                              color: HexColor("#FFFFFF"),
                              fontSize: table_height * 0.045),
                          //style: TextStyle(color: Colors.white),
                        ),

                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: table_height * 0.080,
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Serial',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              '01',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      //height: 53,
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Consult Type',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              'New Patient',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Appointment ID',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              '22107018771',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Registration ID',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              'MH112105000275',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Gender',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              'Male',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Age',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              '9 D 1 M 30Y',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Start Time',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              '10:31 AM',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'End Time',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              '10:45 AM',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20)
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Shift',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              'Morning',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      height: table_height * 0.865 / 5,
                      width: table_width / 2 -1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Phone No',
                              style: GoogleFonts.poppins(
                                  color: HexColor("#979FC9"),
                                  fontSize: table_height * 0.036),
                            ),
                            Text(
                              '01835184976',
                              style: GoogleFonts.poppins(
                                  fontWeight:
                                  FontWeight.w500,
                                  color: HexColor("#354291"),
                                  fontSize: table_height * 0.043),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
