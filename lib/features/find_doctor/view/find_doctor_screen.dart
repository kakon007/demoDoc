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
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';

class MainCollapsingToolbar extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth=MediaQuery.of(context).size.width;
    var contrainerWidth=deviceWidth>=400?double.infinity:400.00;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                   // centerTitle: true,
                    title: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Text("Collapsing Toolbar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                        ),
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
                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage("assets/images/dashboard_back.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: new Container(
                              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: SizedBox(
                              height: 80,
                              width: MediaQuery.of(context).size.width / 5,
                              child:Image.asset("assets/images/dummyimg.png")
                          ),
                        ),
                     ]
                    )
                ),
                // SliverPersistentHeader(
                //   delegate: MySliverAppBar(expandedHeight: 200),
                //   pinned: true,
                // ),
              ),
            // SliverPersistentHeader(
            //   delegate: MySliverAppBar(expandedHeight: 200),
            //   pinned: true,
            // ),
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
                  children: [
                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                    SizedBox(width:15),
                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                    SizedBox(width:15),
                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
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
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: true,
      title: Container(
        width: contrainerWidth,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          border: Border.all(color: HexColor('#E1E1E1')),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
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
                  color: Colors.grey[400],
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