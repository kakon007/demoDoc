import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/demo_doctor/view/zoom_video_viewModel.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/url_launcher_helper.dart';
import 'package:provider/provider.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {

  @override
  void initState() {
    var vm=Provider.of<ZoomVideoViewModel>(context,listen: false);
    vm.getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<ZoomVideoViewModel>(context,listen: false);
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    var width = MediaQuery.of(context).size.width * 0.44;
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment History", style: TextStyle(color: Colors.white)),
        backgroundColor:Color(0xff7266D8),
      ),
      body: ListView.builder(
          //controller: _scrollController,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              InkWell(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: isTablet ? 185 : 165,
                  ),
                  //height: isTablet? 185 : 165,
                  margin: EdgeInsets.only(
                      top: 8, bottom: 5, right: 10, left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(
                            0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              minHeight: isTablet ? 80 : 70,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff7266D8).withOpacity(0.2),
                              borderRadius:
                              BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 5,
                                  bottom: 8,
                                  left:
                                  deviceHeight > 650 ? 5 : 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Serial No: ",
                                          style: GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.w500,
                                            color:
                                            HexColor('#354291'),
                                            fontSize: isTablet
                                                ? 16
                                                : deviceWidth <= 360
                                                ? 10
                                                : 12,
                                          ),
                                        ),
                                        Text(
                                          '39',
                                          style:
                                          GoogleFonts.poppins(
                                            fontWeight:
                                            FontWeight.bold,
                                            color:
                                            HexColor('#354291'),
                                            fontSize: isTablet
                                                ? 22
                                                : deviceWidth <= 360
                                                ? 16
                                                : 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width >
                                        350
                                        ? 10
                                        : 5,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Date: ",
                                            style:
                                            GoogleFonts.poppins(
                                              fontWeight:
                                              FontWeight.w500,
                                              color: HexColor(
                                                  '#354291'),
                                              fontSize: isTablet
                                                  ? 16
                                                  : deviceWidth <=
                                                  360
                                                  ? 10
                                                  : 12,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                             "29-02-2020",
                                              style: GoogleFonts
                                                  .poppins(
                                                fontWeight:
                                                FontWeight.w500,
                                                color: HexColor(
                                                    '#354291'),
                                                fontSize: isTablet
                                                    ? 16
                                                    : deviceWidth <=
                                                    360
                                                    ? 10
                                                    : 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Text(
                                            "Time: ",
                                            style: GoogleFonts
                                                .poppins(
                                              fontWeight:
                                              FontWeight.w500,
                                              color: HexColor(
                                                  '#354291'),
                                              fontSize: isTablet
                                                  ? 16
                                                  : deviceWidth <=
                                                  360
                                                  ? 10
                                                  : 12,
                                            ),
                                          ),
                                          Text(
                                            "06:30 pm",
                                            style: GoogleFonts
                                                .poppins(
                                              fontWeight:
                                              FontWeight.w500,
                                              color: HexColor(
                                                  '#354291'),
                                              fontSize: isTablet
                                                  ? 16
                                                  : deviceWidth <=
                                                  360
                                                  ? 10
                                                  : 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width >
                                        350
                                        ? 10
                                        : 5,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Type: ",
                                            style:
                                            GoogleFonts.poppins(
                                              fontWeight:
                                              FontWeight.w500,
                                              color: HexColor(
                                                  '#354291'),
                                              fontSize: isTablet
                                                  ? 16
                                                  : deviceWidth <=
                                                  360
                                                  ? 10
                                                  : 12,
                                            ),
                                          ),
                                          Container(
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .width *
                                                    .25),
                                            child: Text(
                                           "New patient",
                                              style: GoogleFonts
                                                  .poppins(
                                                fontWeight:
                                                FontWeight.w500,
                                                color: HexColor(
                                                    '#354291'),
                                                fontSize: isTablet
                                                    ? 16
                                                    : deviceWidth <=
                                                    360
                                                    ? 10
                                                    : 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Status: ",
                                            style: GoogleFonts
                                                .poppins(
                                              fontWeight:
                                              FontWeight.w500,
                                              color: HexColor(
                                                  '#354291'),
                                              fontSize: isTablet
                                                  ? 16
                                                  : deviceWidth <=
                                                  360
                                                  ? 10
                                                  : 12,
                                            ),
                                          ),
                                          Text(
                                            "Pending",
                                            style: GoogleFonts
                                                .poppins(
                                              fontWeight:
                                              FontWeight.w500,
                                              color:HexColor(
                                                  '#FFA7A7'),
                                              fontSize: isTablet
                                                  ? 16
                                                  : deviceWidth <=
                                                  360
                                                  ? 10
                                                  : 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .width >
                                        600
                                        ? 10
                                        : 5,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: isTablet
                            ? 5
                            : MediaQuery.of(context).size.width *
                            .44 >
                            600
                            ? 10
                            : 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 5.0, left: 5),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        //color:HexColor('#F0F2FF'),
                                        borderRadius:
                                        BorderRadius.circular(
                                            15),
                                      ),

                                      // height: 60,
                                      //width: 20,
                                      child: Image.asset(
                                        "assets/icons/dct.png",
                                        fit: BoxFit.fill,
                                        width: deviceWidth >
                                            650
                                            ? 100
                                            : deviceWidth <=
                                            360
                                            ? 50
                                            : 60,
                                        height: deviceWidth >
                                            650
                                            ? 100
                                            : deviceWidth <=
                                            360
                                            ? 50
                                            : 60,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                          MediaQuery.of(context)
                                              .size
                                              .height >
                                              650
                                              ? 20
                                              : 10,
                                          left: 1),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          SizedBox(
                                            height:
                                            deviceWidth > 360
                                                ? 8
                                                : 3,
                                          ),
                                          Container(
                                              width: deviceWidth <=
                                                  360 &&
                                                  deviceWidth >
                                                      330
                                                  ? 160
                                                  : deviceWidth <=
                                                  330
                                                  ? 130
                                                  : MediaQuery.of(
                                                  context)
                                                  .size
                                                  .width *
                                                  .40,
                                              child: Text(
                                                "Dr. Anaf Hossain",
                                                maxLines: 1,
                                                overflow:
                                                TextOverflow
                                                    .ellipsis,
                                                style: GoogleFonts
                                                    .poppins(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: HexColor(
                                                        '#393939'),
                                                    fontSize: isTablet
                                                        ? 16
                                                        : deviceWidth <= 360
                                                        ? 10
                                                        : 12),
                                              )),
                                          Text(
                                                'Therapist',
                                            style:
                                            GoogleFonts.poppins(
                                                color: HexColor(
                                                    '#354291'),
                                                fontSize:
                                                isTablet
                                                    ? 16
                                                    : deviceWidth <=
                                                    360
                                                    ? 10
                                                    : 12,
                                                fontWeight:
                                                FontWeight
                                                    .w500),
                                          ),
                                          Container(
                                              width: deviceWidth <=
                                                  360
                                                  ? 130
                                                  : MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .40,
                                              child: Text(
                                                  "Lab Aid",
                                                  maxLines:
                                                  deviceWidth <=
                                                      360
                                                      ? 2
                                                      : 1,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      color: HexColor('#354291'),
                                                      fontSize: isTablet
                                                          ? 15
                                                          : deviceWidth <= 360
                                                          ? 10
                                                          : 12))),
                                          SizedBox(
                                            width: MediaQuery.of(
                                                context)
                                                .size
                                                .width *
                                                .44 >
                                                600
                                                ? 10
                                                : 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  .44 >
                                  600
                                  ? 10
                                  : 6,
                            ),
                            GestureDetector(
                              onTap: () {
                                var link=vm.videoList[index].joinUrl;
                                UrlLauncherHelper.launchUrl(link);
                              },
                              child: Material(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                color: HexColor("#354291"),
                                child: Container(
                                  constraints: BoxConstraints(
                                    minHeight:
                                    deviceWidth > 360 ? 35 : 28,
                                    maxWidth: isTablet
                                        ? 170
                                        : deviceWidth <= 360 &&
                                        deviceWidth > 330
                                        ? 105
                                        : deviceWidth <= 330
                                        ? 95
                                        : 127,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Join Video Consultation",
                                      key: Key('joinVideoConsultationKey$index'),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isTablet
                                              ? 15
                                              : deviceWidth <=
                                              360 &&
                                              deviceWidth >
                                                  330
                                              ? 9
                                              : deviceWidth <=
                                              330
                                              ? 8
                                              : 11,
                                          fontWeight:
                                          FontWeight.w500),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Divider(thickness: 1,),

                      //SizedBox(height:  MediaQuery.of(context).size.width*.44 >600? 10 : 5,),
                    ],
                  ),
                ),
              ),
            ]);
          }),
    );
  }
}
