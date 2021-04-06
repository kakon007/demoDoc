import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';

class CustomContainer extends StatelessWidget {
  String titleText;
  String subTitleText;
  String undersubtitle;
  String images;
  String consultationFee;
  CustomContainer(@required this.titleText,@required this.subTitleText,@required this.undersubtitle,@required this.images, this.consultationFee);
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var height = MediaQuery.of(context).size.height;
    var cardWidth = MediaQuery.of(context).size.width * 0.3435;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 15.0 : 10.0,
    );
    return Container(

      height: cardHeight*1.24,
      margin: EdgeInsets.only(top: 8,bottom: 6,right: 14,left: 14),
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
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                      child: Image.asset(
                          images,
                          fit: BoxFit.cover,
                        width: cardWidth*0.9,
                        height: 146,
                        ),

                  ),
                ],
              ),
              SizedBox(
                width: cardHeight *0.1,
              ),
              Container(
                width: cardWidth * 1.6,
                height: cardHeight*1.13,
                decoration: BoxDecoration(
                  color: HexColor("#FFFFFF"),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 10, top: 12),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(titleText, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700),),
                      Text(subTitleText, style: GoogleFonts.poppins(color:  HexColor("#354291"), fontSize: 10,fontWeight: FontWeight.bold ),),
                      Text(undersubtitle, style: GoogleFonts.poppins(fontSize: 10, color: HexColor('#757577')),),

                      SizedBox(
                        height: cardHeight/15,
                      ),

                      Row(
                        children: [
                          Text(consultationFee ,style: GoogleFonts.poppins(color:  HexColor("#354291"), fontSize: 10,fontWeight: FontWeight.w600 ),),
                          SizedBox(width: 40,),
                          Container(
                            width: cardWidth*0.7,
                            height: 28,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color:  HexColor("#354291"),
                              elevation: 0,
                              //color: AppTheme.appbarPrimary,
                              onPressed: () {
                              },
                              textColor: Colors.white,
                              child: Text(
                                "Book Now",
                                style: GoogleFonts.poppins(fontSize: 10,color: Colors.white, fontWeight: FontWeight.w600),
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