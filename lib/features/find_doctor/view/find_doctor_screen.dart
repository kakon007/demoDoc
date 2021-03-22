// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/search_bar_viw_widget.dart';
// class Sample2 extends StatefulWidget {
//   @override
//   _Sample2State createState() => _Sample2State();
// }
//
// class _Sample2State extends State<Sample2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Material(
//         child: CustomScrollView(
//           slivers: [
//             //createSilverAppBar1(),
//             SliverPersistentHeader(
//               delegate: MySliverAppBar(expandedHeight: 200),
//               pinned: true,
//             ),
//             createSilverAppBar2(),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                     (_, index) =>
//                     ListTile(
//                       title: Text("Index: $index"),
//                     ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   SliverAppBar createSilverAppBar2() {
//     var deviceWidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     var contrainerWidth = deviceWidth >= 400 ? double.infinity : 400.00;
//     return SliverAppBar(
//       backgroundColor: Colors.white,
//       pinned: true,
//       title: Container(
//         width: contrainerWidth,
//         height: 50,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Colors.white,
//           border: Border.all(color: HexColor('#E1E1E1')),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 2), // changes position of shadow
//             ),
//           ],
//         ),
//         child: InkWell(
//           onTap: () {},
//           child: Row(
//             children: <Widget>[
//               SizedBox(
//                 width: 8,
//               ),
//               Text(
//                 "  Find your Doctor",
//                 style: GoogleFonts.poppins(
//                   color: Colors.grey[400],
//                   fontSize: deviceWidth >= 400 ? 20 : 13,
//                 ),
//               ),
//               Spacer(),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Icon(
//                   Icons.search,
//                   color: Colors.grey,
//                   size: 28,
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MySliverAppBar extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//
//   MySliverAppBar({@required this.expandedHeight});
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       overflow: Overflow.visible,
//       children: [
//         Container(
//           height: 420.0,
//           width: MediaQuery.of(context).size.width,
//           child: FadeInImage(
//             fit: BoxFit.cover,
//             image:AssetImage("assets/images/dashboard_back.png"),
//             placeholder: AssetImage(''),
//           ),
//         ),
//         Center(
//           child: Opacity(
//             opacity: shrinkOffset / expandedHeight,
//             child: Padding(
//               padding: const EdgeInsets.only(top:15.0),
//               child: Text(
//                 "Aalock Health Care Ltd",
//                 style: GoogleFonts.poppins(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 23,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: expandedHeight / 4 - shrinkOffset,
//           left: MediaQuery.of(context).size.width / 12,
//           child: Opacity(
//             opacity: (1 - shrinkOffset / expandedHeight),
//             child: Card(
//               elevation: 10,
//               child: SizedBox(
//                 height: 80,
//                 width: MediaQuery.of(context).size.width / 5,
//                 child:Image.asset("assets/images/dummyimg.png")
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   double get maxExtent => expandedHeight;
//
//   @override
//   double get minExtent => kToolbarHeight;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }


//
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_container_for_find_doc.dart';

class MainCollapsingToolbar extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {
  //final String assetName4 = "assets/icons/fliter.svg";
  final Widget filtericon = SvgPicture.asset(
    "assets/icons/fliter.svg",
    width: 10,
    height: 18,
    fit: BoxFit.fitWidth,
    allowDrawingOutsideViewBox: true,
    matchTextDirection: true,
    //semanticsLabel: 'Acme Logo'
  );
  @override
  Widget build(BuildContext context) {
    final String assetName1 = "assets/icons/phone.svg";
    final String assetName2 = "assets/icons/mail.svg";
    final String assetName3 = "assets/icons/marker.svg";

    final Widget phoneimg = SvgPicture.asset(
      assetName1,
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final Widget mailimg = SvgPicture.asset(
      assetName2,
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final Widget mapimg = SvgPicture.asset(
      assetName3,
      width: 10,
      height: 18,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    var deviceWidth=MediaQuery.of(context).size.width;
    var contrainerWidth=deviceWidth>=400?double.infinity:400.00;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: HexColor('#354291'),
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                   // centerTitle: true,
                  //titlePadding: EdgeInsetsGeometry.lerp(, a, 10),
                    titlePadding: EdgeInsetsDirectional.only(
                      start: 50.0,
                      bottom: 5.0,
                      top:40
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Aalok Health Care Ltd",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              )),

                        // Text("Collapsing Toolbar",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 16.0,
                        //     )),
                      ],
                    ),
                    background: Stack(
                      children:[
                        // Container(
                        //   height: 420.0,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: FadeInImage(
                        //     fit: BoxFit.cover,
                        //     image:AssetImage("assets/images/dashboard_back.png"),
                        //     placeholder: AssetImage(''),
                        //   ),
                        // ),
                        Stack(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/images/backhosimg.png',
                                ),
                              ),
                            ),
                            height: 450.0,
                          ),
                          Container(
                            height: 350.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                     HexColor('#D6DCFF').withOpacity(0.9),
                                     HexColor('#FFFFFF').withOpacity(0.8),
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ])),
                          )
                        ]),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:70.0,left: 35),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: HexColor('#D6DCFF'), width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: SizedBox(
                                    height: 85,
                                    width: MediaQuery.of(context).size.width / 4.5,
                                    child:Image.asset("assets/images/dummyimg.png")
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:75.0),
                                  child: Text('Aalok Health Care Ltd',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color:HexColor('#141D53')),),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    phoneimg,
                                    SizedBox(width: 5,),
                                    Text('01962823007',style: GoogleFonts.poppins(color:HexColor('#141D53'),fontSize: 11)),
                                    SizedBox(width: 5,),
                                    mailimg,
                                    SizedBox(width: 5,),
                                    Text('info@aalok.com',style: GoogleFonts.poppins(color:HexColor('#141D53'),fontSize: 11,)),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:10.0),
                                      child: mapimg,
                                    ),
                                    SizedBox(width: 5,),
                                    Text('House-1 &3,Road-2,Block-B,\nMirpur-10,Dhaka-12216',style: GoogleFonts.poppins(color:HexColor('#141D53'),fontSize: 11,)),
                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                     ]
                    )
                ),
              ),
                createSilverAppBar2(),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //         (_, index) =>
            //         ListTile(
            //           title: Text("Index: $index"),
            //         ),
            //   ),
            // )
            ];
          },
          body:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 8,bottom: 3,left: 25),
                        child: Text('Doctors',style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600))),
                    CustomContainer('Dr. Jahid Hasan',"Skin Specialist",'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital',"assets/images/doc.png"),
                    CustomContainer('Dr. Shefa Rahman',"Skin Specialist",'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital',"assets/images/doc1.png"),
                    CustomContainer('Professor Dr. A K M Fazlul Haque',"Skin Specialist",'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital',"assets/images/doc.png"),
                    CustomContainer('Dr. Akram Hasan',"Skin Specialist",'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital',"assets/images/doc.png"),
                    CustomContainer('Dr. Akram Hasan',"Skin Specialist",'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital',"assets/images/doc.png"),
                  ],
                ),

          ),
        ),

    );
  }

  SliverAppBar createSilverAppBar2() {
    var deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    var contrainerWidth = deviceWidth >= 400 ? double.infinity : 400.00;
    return SliverAppBar(
      forceElevated: true,
      shadowColor: Colors.blue.withOpacity(0.3),
      elevation: 5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom:5.0),
        child: Container(
          width: contrainerWidth,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            border: Border.all(color: HexColor('#E1E1E1')),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     spreadRadius: 2,
            //     blurRadius: 5,
            //     offset: Offset(0, 2), // changes position of shadow
            //   ),
            // ],
          ),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 8,
                ),
                Text(
                  "  Find your Doctor",
                  style: GoogleFonts.poppins(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: deviceWidth >= 400 ? 20 : 13,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 28,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:15.0),
          child: filtericon,
        ),
      ],
    );
  }
}

// class MySliverAppBar extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//
//   MySliverAppBar({@required this.expandedHeight});
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       overflow: Overflow.visible,
//       children: [
//         Container(
//           height: 420.0,
//           width: MediaQuery.of(context).size.width,
//           child: FadeInImage(
//             fit: BoxFit.cover,
//             image:AssetImage("assets/images/dashboard_back.png"),
//             placeholder: AssetImage(''),
//           ),
//         ),
//         Center(
//           child: Opacity(
//             opacity: shrinkOffset / expandedHeight,
//             child: Padding(
//               padding: const EdgeInsets.only(top:15.0),
//               child: Text(
//                 "Aalock Health Care Ltd",
//                 style: GoogleFonts.poppins(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 23,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: expandedHeight / 4 - shrinkOffset,
//           left: MediaQuery.of(context).size.width / 12,
//           child: Opacity(
//             opacity: (1 - shrinkOffset / expandedHeight),
//             child: Card(
//               elevation: 10,
//               child: SizedBox(
//                 height: 80,
//                 width: MediaQuery.of(context).size.width / 5,
//                 child:Image.asset("assets/images/dummyimg.png")
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   double get maxExtent => expandedHeight;
//
//   @override
//   double get minExtent => kToolbarHeight;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }