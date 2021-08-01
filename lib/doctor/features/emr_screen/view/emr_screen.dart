import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class EmrScreen extends StatefulWidget {

  @override
  _EmrScreenState createState() => _EmrScreenState();
}

class _EmrScreenState extends State<EmrScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141D53),
        title: Text('EMR',
          key: Key('emrAppbarKey'),
          style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 16,fontWeight: FontWeight.w500),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top:20.0,left: 20.0,right: 20.0),
          child: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 200.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: HexColor("#FFFFFF"),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#E4E4E4"),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],),
                  child: Padding(
                    padding: const EdgeInsets.only(top:20.0,left: 10,right: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:290,
                              child: TextField(
                                  onChanged: (value) {
                                    // doctorItem = value.replaceAll(" ", "%20");
                                    // vm.getDoctor(widget.orgNo, widget.companyNo, deptSelectedItem, specialSelectedItem,
                                    //     doctorItem);
                                    //doctorSearch(doctorItem);
                                  },
                                  //controller: doctorController,
                                  decoration: new InputDecoration(
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
                                      child: Icon(Icons.search,color: Colors.grey.withOpacity(0.5),),
                                    ),
                                    hintText: "Search Here",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: isTablet
                                          ? 16
                                          : width < 350
                                          ? 12
                                          : 15.0,
                                      color: Colors.grey.withOpacity(0.5)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: HexColor("#D2D2D2"), width: 1),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    border: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: new BorderSide(color: Colors.grey)),
                                    contentPadding: width < 350
                                        ? EdgeInsets.fromLTRB(15.0, 0.0, 40.0, 0.0)
                                        : EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
                                  )),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 15),
                              child: SvgPicture.asset(
                                "assets/icons/fliter.svg",
                                key: Key('filterIconKey'),
                                width: 10,
                                height: 18,
                                fit: BoxFit.fitWidth,
                                allowDrawingOutsideViewBox: true,
                                matchTextDirection: true,
                                color:  Colors.grey.withOpacity(0.5),
                                //semanticsLabel: 'Acme Logo'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Expanded(
                          child: Scaffold(
                            backgroundColor: Colors.white,
                            body: DefaultTabController(
                              length: 3,
                              child: Column(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxHeight: 150.0),
                                    child: Material(
                                      color: Colors.white,
                                      child: TabBar(
                                        indicator: UnderlineTabIndicator(
                                          borderSide: BorderSide(width: 3.0,color:  HexColor('#8592E5'),),
                                          insets: EdgeInsets.symmetric(horizontal:30.0),
                                        ),
                                        unselectedLabelColor: Colors.grey,
                                        labelColor: Colors.black,
                                        tabs: [
                                          Container(
                                            height: 40,
                                            //width: 10.0,
                                            child: Center(
                                                child: Text(
                                                  'Prescriptions',
                                                  style: GoogleFonts.poppins(
                                                    // color: HexColor(
                                                    //   '#354291',
                                                    // ),
                                                      fontSize: isTablet
                                                          ? 20
                                                          : width <= 330
                                                          ? 11
                                                          : 14,
                                                      fontWeight: FontWeight.w500),
                                                )),
                                          ),
                                          Container(
                                            height: 40,
                                            child: Center(
                                                child: Text(
                                                  'Pathology',
                                                  key: Key('reportsTabKey'),
                                                  style: GoogleFonts.poppins(
                                                    //color: HexColor('#354291'),
                                                      fontSize: isTablet
                                                          ? 20
                                                          : width <= 330
                                                          ? 11
                                                          : 14,
                                                      fontWeight: FontWeight.w500),
                                                )),
                                          ),
                                          Container(
                                            height: 40,
                                            //width: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Imaging',
                                                  key: Key('documentationTabKey'),
                                                  style: GoogleFonts.poppins(
                                                    //color: HexColor('#354291'),
                                                      fontSize: isTablet
                                                          ? 20
                                                          : width <= 330
                                                          ? 11
                                                          : 14,
                                                      fontWeight: FontWeight.w500),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                SizedBox(height: 40),
                                Expanded(child:
                                TabBarView(
                                  children: [
                                    Scaffold(
                                      backgroundColor: Colors.white,
                                      body: SingleChildScrollView(
                                        child: ListView.separated(itemCount: 4,shrinkWrap: true,itemBuilder: (BuildContext context,
                                            int index) {
                                          return Container(
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
                                                                .w600),
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
                                    ),

                                    //Pathology
                                    Scaffold(
                                      backgroundColor: Colors.white,
                                      body: SingleChildScrollView(
                                        child: ListView.separated(itemCount: 4,shrinkWrap: true,itemBuilder: (BuildContext context,
                                            int index) {
                                          return Container(
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('1. Blood test lab report.jpg', style: GoogleFonts.poppins(
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
                                                            //color:  Colors.grey.withOpacity(0.5),
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
                                                                .w600),
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
                                    ),

                                    //Imaging

                                    Scaffold(
                                      backgroundColor: Colors.white,
                                      body: SingleChildScrollView(
                                        child: ListView.separated(itemCount: 4,shrinkWrap: true,itemBuilder: (BuildContext context,
                                            int index) {
                                          return Container(
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('1. X-Ray Image.jpg', style: GoogleFonts.poppins(
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
                                                            //color:  Colors.grey.withOpacity(0.5),
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
                                                                .w600),
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
                                    ),
                                  ],
                                ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Date',style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 15,fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: 120,
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
                                             ? 12
                                             : 15,color: Colors.black,
                                       fontWeight: FontWeight.w500
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
                                    color: HexColor("#EFF5FF"),
                                    // border: Border.all(
                                    //   color: HexColor("#6374DF"),// set border color
                                    //   //width: 3.0
                                    // ),   // set border width
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)), // set rounded corner radius
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 25.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Text('22/12/18' ,style: GoogleFonts.poppins(
                                        //   // color: HexColor(
                                        //   //   '#354291',
                                        //   // ),
                                        //     fontSize: isTablet
                                        //         ? 20
                                        //         : width <= 330
                                        //         ? 12
                                        //         : 15,color: Colors.black,
                                        //     fontWeight: FontWeight.w500
                                        // ),),
                                        // SizedBox(width: 20,),
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
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Medical Records',style: GoogleFonts.poppins(fontSize: isTablet ? 20 : 15,fontWeight: FontWeight.w500),),

                ],

              ),
            ],
          ),

        ),
      ),
    );
  }
}
