
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141D53),
        title: Text('Patient Details',
          key: Key('emrAppbarKey'),
          style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 16,fontWeight: FontWeight.w500),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    //height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,  // Change this
                      shadowColor: Color(0xffE3E3E3),  // Change this
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 28.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                //color:HexColor('#F0F2FF'),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    25),
                                              ),

                                              // height: 60,
                                              //width: 20,
                                              child:  Image.asset(
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
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Md. Arman',style: GoogleFonts.poppins(
                                            // color: HexColor(
                                            //   '#354291',
                                            // ),
                                              fontSize: isTablet
                                                  ? 20
                                                  : width <= 330
                                                  ? 16
                                                  : 16,
                                              fontWeight: FontWeight.w600),),
                                          Row(
                                            children: [
                                              Text('Age: ',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w600),),
                                              Text('28Y 10D',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w500,color: Colors.grey),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('Gender: ',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w600),),
                                              Text('Male',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w500,color: Colors.grey),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('Blood Group: ',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w600),),
                                              Text('A+',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w500,color: Colors.grey),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('Phone N0: ',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w600),),

                                              Text('01962823006',style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w500,color: Colors.grey),),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                    ),
                                    Divider(thickness: 2,),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('From',style: GoogleFonts.poppins(
                                              // color: HexColor(
                                              //   '#354291',
                                              // ),
                                                fontSize: isTablet
                                                    ? 20
                                                    : width <= 330
                                                    ? 13
                                                    : 16,
                                                fontWeight: FontWeight.w500),),
                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 45,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: HexColor("#6374DF"),// set border color
                                                  //width: 3.0
                                                ),   // set border width
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)), // set rounded corner radius
                                              ),
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('22/12/18' ,style: GoogleFonts.poppins(
                                                    // color: HexColor(
                                                    //   '#354291',
                                                    // ),
                                                      fontSize: isTablet
                                                          ? 20
                                                          : width <= 330
                                                          ? 13
                                                          : 15,color: Color(0xff333333),
                                                      fontWeight: FontWeight.w400
                                                  ),),
                                                  SizedBox(width: 20,),
                                                  SvgPicture.asset(
                                                    "assets/icons/calendoc.svg",
                                                    //key: Key('filterIconKey'),
                                                    width: 10,
                                                    height: 18,
                                                    fit: BoxFit.fitWidth,
                                                    allowDrawingOutsideViewBox: true,
                                                    matchTextDirection: true,
                                                    //color:  Colors.grey.withOpacity(0.5),
                                                    //semanticsLabel: 'Acme Logo'
                                                  ),


                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 24,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('To',style: GoogleFonts.poppins(
                                              // color: HexColor(
                                              //   '#354291',
                                              // ),
                                                fontSize: isTablet
                                                    ? 20
                                                    : width <= 330
                                                    ? 13
                                                    : 16,
                                                fontWeight: FontWeight.w500),),
                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 45,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: HexColor("#6374DF"),// set border color
                                                  //width: 3.0
                                                ),   // set border width
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)), // set rounded corner radius
                                              ),
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('22/9/19' ,style: GoogleFonts.poppins(
                                                    // color: HexColor(
                                                    //   '#354291',
                                                    // ),
                                                      fontSize: isTablet
                                                          ? 20
                                                          : width <= 330
                                                          ? 13
                                                          : 15,color: Color(0xff333333),
                                                      fontWeight: FontWeight.w400
                                                  ),),
                                                  SizedBox(width: 20,),
                                                  SvgPicture.asset(
                                                    "assets/icons/calendoc.svg",
                                                    //key: Key('filterIconKey'),
                                                    width: 10,
                                                    height: 18,
                                                    fit: BoxFit.fitWidth,
                                                    allowDrawingOutsideViewBox: true,
                                                    matchTextDirection: true,
                                                    //color:  Colors.grey.withOpacity(0.5),
                                                    //semanticsLabel: 'Acme Logo'
                                                  ),


                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),

                                  ],
                                ),
                                Material(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          5)),
                                  color: HexColor("#6374DF"),
                                  child: SizedBox(
                                    width: isTablet
                                        ? 170
                                        : deviceWidth <= 360 &&
                                        deviceWidth > 330
                                        ? 105
                                        : deviceWidth <= 330
                                        ? 95
                                        : 180,
                                    height: deviceWidth <= 360
                                        ? 28
                                        : 35,
                                    child: Center(
                                      child: Text(
                                        "View Patient EMR",
                                        //key: Key('rebookKey$index'),
                                        style:
                                        GoogleFonts.roboto(
                                            color:
                                            Colors.white,
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
                                                : 14,
                                            fontWeight:
                                            FontWeight
                                                .w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    //height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,  // Change this
                      shadowColor: Color(0xffE3E3E3),  // Change this
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/con.svg",
                                  //key: Key('filterIconKey'),
                                  width: 10,
                                  height: 25,
                                  fit: BoxFit.fitWidth,
                                  allowDrawingOutsideViewBox: true,
                                  matchTextDirection: true,
                                  //color:  Color(0xffAFBBFF),
                                  //semanticsLabel: 'Acme Logo'
                                ),
                                SizedBox(width: 10,),
                                Text('Consultation Info',style: GoogleFonts.poppins(
                                  // color: HexColor(
                                  //   '#354291',
                                  // ),
                                    fontSize: isTablet
                                        ? 20
                                        : width <= 330
                                        ? 15
                                        : 16,
                                    fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Today, 22 February 2021', style: GoogleFonts.poppins(
                                      // color: HexColor(
                                      //   '#354291',
                                      // ),
                                        fontSize: isTablet
                                            ? 20
                                            : width <= 330
                                            ? 13
                                            : 16,
                                        fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                    Text('08:00 pm-08:30 pm', style: GoogleFonts.poppins(
                                      // color: HexColor(
                                      //   '#354291',
                                      // ),
                                        fontSize: isTablet
                                            ? 20
                                            : width <= 330
                                            ? 13
                                            : 16,
                                        fontWeight: FontWeight.w500,color: HexColor('#7785E3')),),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Text('Status: ', style: GoogleFonts.poppins(
                                          // color: HexColor(
                                          //   '#354291',
                                          // ),
                                            fontSize: isTablet
                                                ? 20
                                                : width <= 330
                                                ? 13
                                                : 16,
                                            fontWeight: FontWeight.w500),),
                                        Text('Waiting', style: GoogleFonts.poppins(
                                          // color: HexColor(
                                          //   '#354291',
                                          // ),
                                            fontSize: isTablet
                                                ? 20
                                                : width <= 330
                                                ? 13
                                                : 16,
                                            fontWeight: FontWeight.w500,color: HexColor('#FFB14A')),),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.0,
                                      backgroundColor: HexColor('#6374DF'),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Serial No",
                                            //key: Key('rebookKey$index'),
                                            style:
                                            GoogleFonts.roboto(
                                                color:
                                                Colors.white,
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
                                                    : 14,
                                                fontWeight:
                                                FontWeight
                                                    .w700),
                                          ),
                                          Text(
                                            "02",
                                            //key: Key('rebookKey$index'),
                                            style:
                                            GoogleFonts.roboto(
                                                color:
                                                Colors.white,
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
                                                    : 14,
                                                fontWeight:
                                                FontWeight
                                                    .w700),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      5)),
                              color: HexColor("#6374DF"),
                              child: SizedBox(
                                width: double.infinity,
                                height: deviceWidth <= 360
                                    ? 28
                                    : 35,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      Text(
                                        "Start video consultation",
                                        //key: Key('rebookKey$index'),
                                        style:
                                        GoogleFonts.roboto(
                                            color:
                                            Colors.white,
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
                                                : 14,
                                            fontWeight:
                                            FontWeight
                                                .w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: VerticalDivider(color: Colors.white,thickness: 2,),
                                      ),
                                      Text(
                                        "00d 00h 24m 22s",
                                        //key: Key('rebookKey$index'),
                                        style:
                                        GoogleFonts.roboto(
                                            color:
                                            Colors.white,
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
                                                : 14,
                                            fontWeight:
                                            FontWeight
                                                .w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    //height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,  // Change this
                      shadowColor: Color(0xffE3E3E3),  // Change this
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Consultation History',style: GoogleFonts.poppins(
                              // color: HexColor(
                              //   '#354291',
                              // ),
                                fontSize: isTablet
                                    ? 20
                                    : width <= 330
                                    ? 16
                                    : 16,
                                fontWeight: FontWeight.w600),),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(itemCount: 4,shrinkWrap: true,itemBuilder: (BuildContext context,
                                int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 5.0,right: 5),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('1. Assoc. Prof. Dr. Mahmud Rahim', style: GoogleFonts.poppins(
                                          // color: HexColor(
                                          //   '#354291',
                                          // ),
                                            fontSize: isTablet
                                                ? 20
                                                : width <= 330
                                                ? 13
                                                : 16,
                                            fontWeight: FontWeight.w500),),
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left:12.0),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/calendoc.svg",
                                                //key: Key('filterIconKey'),
                                                width: 10,
                                                height: 18,
                                                fit: BoxFit.fitWidth,
                                                allowDrawingOutsideViewBox: true,
                                                matchTextDirection: true,
                                                color:  Color(0xffAFBBFF),
                                                //semanticsLabel: 'Acme Logo'
                                              ),
                                              SizedBox(width: 8,),
                                              Text('22 February 2021' ,style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 12
                                                      : 15,color: Colors.grey
                                              ),),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:12.0,top: 5),
                                          child: Row(
                                            children: [
                                              Text('Disease: ', style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w500,color: HexColor('#FFA7A7')),),
                                              Text('Fever ', style: GoogleFonts.poppins(
                                                // color: HexColor(
                                                //   '#354291',
                                                // ),
                                                  fontSize: isTablet
                                                      ? 20
                                                      : width <= 330
                                                      ? 13
                                                      : 16,
                                                  fontWeight: FontWeight.w500),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Material(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              5)),
                                      color: HexColor("#6374DF"),
                                      child: SizedBox(
                                        width: isTablet
                                            ? 170
                                            : deviceWidth <= 360 &&
                                            deviceWidth > 330
                                            ? 105
                                            : deviceWidth <= 330
                                            ? 95
                                            : 80,
                                        height: deviceWidth <= 360
                                            ? 28
                                            : 25,
                                        child: Center(
                                          child: Text(
                                            "View",
                                            key: Key('rebookKey$index'),
                                            style:
                                            GoogleFonts.roboto(
                                                color:
                                                Colors.white,
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
                                                    : 10,
                                                fontWeight:
                                                FontWeight
                                                    .w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },separatorBuilder: (context, index) {
                              return Divider();
                            }),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 650.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.2),
                    spreadRadius: 6,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],),
              child:Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          5)),
                  color: HexColor("#6374DF"),
                  child: SizedBox(
                    width: isTablet
                        ? 170
                        : deviceWidth <= 360 &&
                        deviceWidth > 330
                        ? 105
                        : deviceWidth <= 330
                        ? 95
                        : 180,
                    height: deviceWidth <= 360
                        ? 28
                        : 35,
                    child: Center(
                      child: Text(
                        "Create Prescription",
                        //key: Key('rebookKey$index'),
                        style:
                        GoogleFonts.roboto(
                            color:
                            Colors.white,
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
                                : 14,
                            fontWeight:
                            FontWeight
                                .w700),
                      ),
                    ),
                  ),
                ),
              ) ,
            ),
          ),
        ],
      ),
    );
  }
}
