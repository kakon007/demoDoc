import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/find_doctor/view/find_doctor_screen.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';

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

  HospitalListCard(@required this.image,@required this.backgroundImage,@required this.titleText,@required this.addressText,@required this.countText,this.phoneText,this.emailText,this.logo,this.companyNo,  this.orgNo,this.id,);
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
      height: isTablet? 170 : width< 330 ? 118 : 135,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: isTablet ? 130 : width<330 ? 80 : 93,
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
                        height: isTablet? 47 : 37,
                        child: Text(titleText,maxLines:2,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: isTablet? 18 :  width<330 ? 10 : 12,fontWeight: FontWeight.bold,),textAlign:TextAlign.start)),
                    SizedBox(height:isTablet? 3 : width<330 ? 1 :  2,),
                    Container(height: cardHeight*.12,child: Text(addressText,maxLines:1,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize:isTablet? 13 :  height <= 600 ? 9 : 10,),textAlign:TextAlign.start)),
                    SizedBox(height: 10,),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FindYourDoctorScreen(image,backgroundImage,titleText,phoneText,emailText,addressText,orgNo, companyNo , id)));
                      },
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



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:myhealthbd_app/main_app/resource/colors.dart';
// import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
// class  HospitalListCard extends StatelessWidget {
//   final String image;
//   final String hospitalTitle;
//   final String hospitalLocation;
//   final String onlineDoctors;
//   final String buttonName;
//   HospitalListCard({ this.image, this.buttonName, this.onlineDoctors, this.hospitalLocation, this.hospitalTitle});
//   @override
//   Widget build(BuildContext context) {
//     var cardHeight = MediaQuery.of(context).size.height * 0.1537;
//     var height = MediaQuery.of(context).size.height;
//     var cardWidth = MediaQuery.of(context).size.width * 0.3435;
//     return Container(
//             height: cardHeight * 1.2,
//             margin: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: HexColor("#D6DCFF"),
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: height <= 600
//                           ? cardHeight * 0.09
//                           : cardHeight * 0.1,
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                             width: cardWidth * 0.9,
//                             height: cardHeight,
//                             child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Image.asset(
//                                 image,
//                                 fit: BoxFit.cover,
//                               ),
//                             )),
//                       ],
//                     ),
//                     SizedBox(
//                       width: height <= 600
//                           ? cardHeight * 0.06
//                           : cardHeight * 0.08,
//                     ),
//                     Container(
//                       width: cardWidth * 1.58,
//                       height: cardHeight * 1.13,
//                       decoration: BoxDecoration(
//                         color: HexColor("#FFFFFF"),
//                         borderRadius: BorderRadius.only(
//                             bottomRight: Radius.circular(12),
//                             topRight: Radius.circular(12)),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: 15.0,
//                             right: 10,
//                             top: height <= 600 ? 6 : 12),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               hospitalTitle,
//                               style: GoogleFonts.poppins(
//                                   fontSize: height <= 600 ? 12 : 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               hospitalLocation,
//                               style: GoogleFonts.poppins(
//                                 color: Colors.grey,
//                                 fontSize: height <= 600 ? 9 : 12,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.circle,
//                                   color: HexColor("#1EE573"),
//                                   size: height <= 600 ? 10 : 15,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   onlineDoctors,
//                                   style: GoogleFonts.poppins(
//                                     fontSize: height <= 600 ? 9 : 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height <= 600
//                                   ? cardHeight / 15
//                                   : cardHeight / 9,
//                             ),
//                             Container(
//                               width: height <= 600
//                                   ? cardWidth * 1.2
//                                   : cardWidth * 1.3,
//                               child: FlatButton(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8)),
//                                 color: AppTheme.appbarPrimary,
//                                 onPressed: () {},
//                                 textColor: Colors.white,
//                                 child: Text(
//                                   buttonName,
//                                   style: GoogleFonts.poppins(
//                                       fontSize: height <= 600 ? 8 : 10,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           );
//   }
// }