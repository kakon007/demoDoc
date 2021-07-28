import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class TodayWorkList extends StatefulWidget {
  const TodayWorkList({Key key}) : super(key: key);

  @override
  _TodayWorkListState createState() => _TodayWorkListState();
}

class _TodayWorkListState extends State<TodayWorkList> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween= SizedBox(height: 5,);
    return Container(
      constraints: BoxConstraints( minHeight:130),
      margin: EdgeInsets.only(bottom: 7),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: HexColor("#FFFFFF"),
          boxShadow: [
            BoxShadow(
              color:
              HexColor("#0D1231").withOpacity(0.08),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(
                  0, 1), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 0.0, right: 0, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border:
                Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 80,
              width: 80,
              child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/images/doc.png",
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "Md. Arman",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Text(
                        "Consultation time :   ",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "08:00 PM, 22/05/2021",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          color: HexColor("#FFB14A"),),
                      ),
                    ],
                  ),
                  spaceBetween,
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Text(
                        "Consultation type :   ",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "1st Follow Up",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                           // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  spaceBetween,
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Text(
                        "Shared Documents:     ",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "2 Documents,2 reports",
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width:width*.7,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 0,),
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5)),
                            //color: HexColor("#107B3E"),
                            child: Text(
                              "View Details",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,fontWeight: FontWeight.w500),
                            ),
                            color: AppTheme.buttonActiveColor,
                            height: 35,
                            minWidth: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
