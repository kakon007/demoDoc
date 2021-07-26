import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/find_doctor/view/find_doctor_screen.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:recase/recase.dart';
class HospitalListCard extends StatelessWidget {
  Uint8List image;
  Uint8List backgroundImage;
  String titleText;
  String addressText;
  String countText;
  String phoneText;
  String emailText;
  String logo;
  String companyNo;
  String orgNo;
  String id;
  String index;

  HospitalListCard(@required this.image,@required this.backgroundImage,@required this.titleText,@required this.addressText,@required this.countText,this.phoneText,this.emailText,this.logo,this.companyNo,  this.orgNo,this.id,this.index);
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    return Container(
      margin: EdgeInsets.only(left: width<330 ? 3 :6, right: width<330 ? 3 :6, bottom: 2),
      width: MediaQuery.of(context).size.width,
      //constraints: BoxConstraints(minHeight: isTablet? 170 : width< 330 ? 118 : 135,),
      //height: isTablet? 170 : width< 330 ? 118 : 135,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: isTablet ? 130 : width<330 ? 80 : 85,
                  width: isTablet ? MediaQuery.of(context).size.width*.28 :  111.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.memory(image,gaplessPlayback: true,)),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        //constraints: BoxConstraints(minHeight: isTablet? 47 : 42,),
                        // height: isTablet? 47 : 42,
                        child: Text(titleText.titleCase,maxLines:2,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: isTablet? 18 :  width<330 ? 10 : 12,fontWeight: FontWeight.bold,),textAlign:TextAlign.start)),
                    SizedBox(height:isTablet? 3 : width<330 ? 1 :  2,),
                    Container(
                        constraints: BoxConstraints(minHeight: cardHeight*.12),
                        //height: cardHeight*.12,
                        child: Text(addressText,maxLines:1,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize:isTablet? 13 :  height <= 600 ? 9 : 10,),textAlign:TextAlign.start)),
                    SizedBox(height: 5,),
                    // Container(
                    //   height: 11.5,
                    //   child: Row(
                    //     children: [
                    //       CircleAvatar(
                    //         minRadius: 3,
                    //         backgroundColor: HexColor("#1EE573"),
                    //       ),
                    //       SizedBox(width: width<330 ? 2 : 3,),
                    //       Text(countText,style:  GoogleFonts.poppins(fontSize: height <= 600 ? 9 : 10,),),
                    //
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: isTablet? 15 :  width<330 ? 5 : 10,),
                    GestureDetector(
                      onTap: (){
                        FocusScope.of(context).unfocus();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FindYourDoctorScreen(image,backgroundImage,titleText,phoneText,emailText,addressText,orgNo, companyNo , id)));
                      },
                      key: Key('getAppointmentKey$index'),
                      child: Material(
                        elevation: 0  ,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        color: HexColor("#354291"),
                        child: SizedBox(
                          width: isTablet ?MediaQuery.of(context).size.width*.62 : MediaQuery.of(context).size.width*.5,
                          height:isTablet? 40 :  width<330 ? 25 : 35,
                          child: Center(child: Text("Get An Appointment",style:  GoogleFonts.poppins(color: Colors.white,fontSize: isTablet? 16 :11,fontWeight: FontWeight.w600),)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        elevation:2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        shadowColor: HexColor("#354291").withOpacity(0.2),
      ),
    );
  }
}