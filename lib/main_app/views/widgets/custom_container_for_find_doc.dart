import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/view/appointments_screen.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/NewFile.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';

class CustomContainer extends StatelessWidget {
  Image logo;
  String titleText;
  String subTitleText;
  String undersubtitle;
  String images;
  String consultationFee;
  String designation;
  String doctorNo;
  String companyNo;
  String orgNo;
  CustomContainer(@required this.logo,@required this.titleText,@required this.subTitleText,@required this.undersubtitle,@required this.images, this.consultationFee,this.designation, this.doctorNo, this.companyNo, this.orgNo);
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var height = MediaQuery.of(context).size.height;
    var cardWidth = MediaQuery.of(context).size.width * 0.3435;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 15.0 : 10.0,
    );
    print( (cardHeight*.5).toString());
    return Container(

      height: 162,
      margin: EdgeInsets.only(top: 6,bottom: 6,right: 14,left: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: HexColor("#E9ECFE"),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: cardHeight *0.1,
              // ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  child: logo,

              ),
              SizedBox(
                width: cardHeight *0.2,
              ),
              Container(
                width: cardWidth * 1.6,
                height: 140,
                decoration: BoxDecoration(
                  color: HexColor("#FFFFFF"),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 10, top: 5),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 39,
                          child: Text(titleText, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700),)),
                      Container(height: 18,child: Text(subTitleText, style: GoogleFonts.poppins(color:  HexColor("#354291"), fontSize: 10,fontWeight: FontWeight.bold ),)),
                      Container(height: 30,child: Text(undersubtitle, style: GoogleFonts.poppins(fontSize: 10, color: HexColor('#757577')),)),

                      SizedBox(
                        height: cardHeight/10,
                      ),

                      Row(
                        children: [
                          Text(consultationFee ,style: GoogleFonts.poppins(color:  HexColor("#354291"), fontSize: 10,fontWeight: FontWeight.w600 ),),
                          SizedBox(width: height*.03,),
                          Container(
                            width: cardWidth*0.7,
                            height: 30,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color:  HexColor("#354291"),
                              elevation: 0,
                              //color: AppTheme.appbarPrimary,
                              onPressed: () {
                              },
                              textColor: Colors.white,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return AppointmentScreen(name: titleText, specialist:subTitleText , fee: consultationFee,designation: designation,  companyNo: companyNo, doctorNo: doctorNo,orgNo: orgNo,);
                                  }));
                                },
                                child: Text(
                                  "Book Now",
                                  style: GoogleFonts.poppins(fontSize: 10,color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
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
  }
}