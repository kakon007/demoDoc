import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'loader.dart';

class CustomCardPat extends StatelessWidget {
  String titleText;
  String subTitleText;
  String serial;
  String countText;
  String name;
  int lastTime;
  final Function onTapFeaturedAppointment;

  //CountdownTimerController controller;
  CustomCardPat(
      {this.titleText,
      this.subTitleText,
      this.countText,
      this.name,
      this.lastTime,
      this.serial,
      this.onTapFeaturedAppointment});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    print("width $width");
    return Padding(
      padding:  EdgeInsets.only(left: 10.0, right: isTablet? 0 : 10),
      child: Container(
        //height: 40,
        width: width,
        height: width<=1250 && width>=1000 ? 200 : width<=999 && width>=650? 150 : 130,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              Container(
                width: 8,
                height: double.infinity,
                color: HexColor("#8592E5"),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child:
              //   Stack(
              //     children:[ Container(
              //         child: Image.asset("assets/images/clocknew.png"),
              //     ),
              //       lastTime!=null? Padding(
              //         padding: const EdgeInsets.only(top:35.0,left: 14,bottom:20),
              //         child: Column(
              //           children: [
              //             // Text("20:10:33",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              //             // Text("Hours Left",style: TextStyle(fontSize: 10),)
              //
              //             CountdownTimer(
              //               endWidget: Padding(
              //                 padding: const EdgeInsets.only(left:10.0),
              //                 child: Center(child: Text('Loading'),),
              //               ),
              //               //controller: controller,
              //               endTime: lastTime,
              //             ),
              //           ],
              //         ),
              //       ):Loader(),
              //     ]
              //   ),
              //
              //
              // ),
              Flexible(
                child: Padding(
                  padding:  EdgeInsets.only(top: 8.0, bottom: 8, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 8.0),
                                child: Text(titleText,
                                    style: GoogleFonts.poppins(
                                        fontSize:width<=1250 && width>=1000 ? 18 : width<=999 && width>=650?16 : 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.start),
                              ),
                              SizedBox(height: isTablet? 20 : 5,),
                              Text(
                                subTitleText,
                                style:
                                TextStyle(fontSize: width<=1250 && width>=1000 ? 18 : width<=999 && width>=650? 16 : 12, color: HexColor('#354291')),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: width<=1250 && width>=1000 ? 20 : 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 3,
                                    height: width<=1250 && width>=1000 ? 40 : 20,
                                    color: HexColor("#354291"),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: isTablet ? 300 : width <= 360 ? 155 : 180,
                                          child: Text(
                                            countText,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: width<=1250 && width>=1000 ? 18 : width<=999 && width>=650? 16 : 10,
                                                fontWeight: FontWeight.bold,
                                                color: HexColor('#354291')),
                                          )),
                                      Container(
                                          width:isTablet ? 300 : width <= 360 ? 155 : 180,
                                          child: Text(
                                            name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: width<=1250 && width>=1000 ? 16 : width<=999 && width>=650? 14 : 8),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(top: 8.0, right: 15),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Your Serial No.",
                                          style: GoogleFonts.poppins(
                                              fontSize: width<=1250 && width>=1000 ? 18 : width<=999 && width>=650? 16 : width < 330 ? 10 : 11,
                                              color: HexColor('#354291')),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: width<=1250 && width>=1000 ? 20 :  5,
                                        ),
                                        Text(
                                          "$serial",
                                          style: GoogleFonts.poppins(
                                              fontSize: width<=1250 && width>=1000 ? 30 : width<=999 && width>=650?24 :20,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('#354291')),
                                          textAlign: TextAlign.center,
                                        ),
                                        GestureDetector(
                                          onTap: onTapFeaturedAppointment,
                                          child: Material(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)),
                                            color: HexColor("#354291"),
                                            child: SizedBox(
                                              width: width<=1250 && width>=1000 ? 250 : width<=999 && width>=650?190 : width <= 330 ? 95 : 130,
                                              height: isTablet? 35 : 30,
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(0.0),
                                                  child: Text(
                                                    "View All Appointments",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width<=1250 && width>=1000 ? 18 : width<=999 && width>=650? 15 : width < 330 ? 8 : 11),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(height: 8,),

                      // Material(
                      //   elevation: 2  ,
                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      //   color: HexColor("#354291"),
                      //   child: SizedBox(
                      //     width: 130,
                      //     height: 30,
                      //     child: Center(
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Text("Get An Appointment",style: TextStyle(color: Colors.white,fontSize: 11),),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: HexColor("#8592E5").withOpacity(0.3),
              width: 1,
            ),
          ),
          shadowColor: HexColor("#354291").withOpacity(0.5),
        ),
      ),
    );
  }
}
