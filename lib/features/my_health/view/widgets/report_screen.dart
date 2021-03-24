// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/custom_contrainer_for_report.dart';
//
// class ReportScreen extends StatefulWidget {
//   @override
//   _ReportScreenState createState() => _ReportScreenState();
// }
//
// class _ReportScreenState extends State<ReportScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final String assetName1 = "assets/images/dx.svg";
//     //final String assetName2=widget.image;
//
//     final Widget rx = SvgPicture.asset(
//       assetName1,
//       width: 50,
//       height: 60,
//       fit: BoxFit.fitWidth,
//       allowDrawingOutsideViewBox: true,
//       matchTextDirection: true,
//       //semanticsLabel: 'Acme Logo'
//     );
//     final Widget righticon = SvgPicture.asset(
//       assetName2,
//       width: 40,
//       height: 20,
//       fit: BoxFit.fitWidth,
//       allowDrawingOutsideViewBox: true,
//       matchTextDirection: true,
//       //semanticsLabel: 'Acme Logo'
//     );
//     var cardHeight = MediaQuery.of(context).size.height * 0.1537;
//     var height = MediaQuery.of(context).size.height;
//     var cardWidth = MediaQuery.of(context).size.width * 0.3435;
//     var spaceBetween = SizedBox(
//       height: height >= 600 ? 15.0 : 10.0,
//     );
//     var searchField=
//     Container(
//       //height: 40,
//         width: 200,
//         height: 60,
//         child:Padding(
//           padding: const EdgeInsets.only(bottom:20.0,right: 12),
//           child: Stack(
//               children:[
//                 Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
//                 TextFormField(
//                   cursorColor: HexColor('#C5CAE8'),
//                   decoration: InputDecoration(
//                     hintText: 'Search reports',
//                     hintStyle: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w400),
//                     //labelText: "Resevior Name",
//                     fillColor: Colors.white,
//                     focusedBorder:UnderlineInputBorder(
//                       borderSide:  BorderSide(color: HexColor('#354291').withOpacity(0.5), width: 1.5),
//                       //borderRadius: BorderRadius.circular(25.0),
//                     ),
//                   ),
//                   onChanged: (text) {
//                     //value = text;
//                   },
//                 ),
//               ]
//           ),
//         )
//     );
//     return Scaffold(
//         body:
//
//         Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left:12.0,bottom: 20),
//                   child: Text("13 Report(s) found",style: GoogleFonts.poppins(fontSize: 10),),
//                 ),
//                 Spacer(),
//                 searchField,
//               ],
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                   physics: ScrollPhysics(),
//                   child: Column(
//                     children: [
//                       // ReportContrainer("assets/icons/right.svg"),
//                       // ReportContrainer("assets/icons/right.svg"),
//                       // ReportContrainer("assets/icons/greyright.svg"),
//                       // ReportContrainer("assets/icons/greyright.svg"),
//                       // ReportContrainer("assets/icons/greyright.svg"),
//                       // ReportContrainer("assets/icons/greyright.svg"),
//                       // ReportContrainer("assets/icons/greyright.svg"),
//                       // ReportContrainer("assets/icons/greyright.svg"),
//                       // ReportContrainer("assets/icons/greyright.svg"),
//
//
//                       Stack(
//                           children:[
//                             Container(
//
//                               height: cardHeight*0.8,
//                               margin: EdgeInsets.only(top: 8,bottom: 5,right: 10,left: 10),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
//                                   1.0,
//                                   1.0
//                                 ], colors: [
//                                   HexColor('#C5CAE8'),
//                                   HexColor('#E9ECFE'),
//
//                                 ]),
//                                 //color: Colors.white,
//                                 // border: Border.all(
//                                 //   color: HexColor("#E9ECFE"),
//                                 //   width: 1,
//                                 // ),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               child: Row(
//                                 children: [
//                                   SizedBox(width: 10,),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top:8.0,right: 8,bottom: 8,left: 6),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(height: 5,),
//                                         Text('X-ray report',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),),
//                                         Text('Monday 25-01-2021 05:41 PM    23 Day ago',style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
//                                         SizedBox(height: 8,),
//                                         Row(
//                                           children: [
//                                             CircleAvatar(
//                                               radius: 18,
//                                               backgroundColor: HexColor('#354291').withOpacity(0.2),
//                                               child: CircleAvatar(
//                                                 backgroundColor: Colors.white,
//                                                 backgroundImage: AssetImage('assets/images/ap.png'),
//                                                 radius: 17,
//                                               ),
//                                             ),
//                                             SizedBox(width: 15,),
//                                             Text('Apollo Hospital Bangladesh',style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 12,fontWeight: FontWeight.w500)),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Padding(
//                                     padding: const EdgeInsets.only(right:18.0),
//                                     child: Stack(children: [
//                                       Container(width:45,child: rx),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left:30.0),
//                                         child: righticon,
//                                       ),
//                                     ]),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ]
//                       )
//
//                     ],
//                   )),
//             ),
//           ],
//         )
//
//     );
//   }
// }
