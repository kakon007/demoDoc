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
                                      borderSide: BorderSide(color: HexColor("#EAEBED"), width: 1),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    border: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: new BorderSide(color: Colors.teal)),
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
                      child: Center(child: Text('Hey, dude.')),
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
