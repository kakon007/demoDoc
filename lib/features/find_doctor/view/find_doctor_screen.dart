
import 'dart:convert';
import 'dart:ui';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_container_for_find_doc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FindYourDoctorScreen extends StatefulWidget {
  String title;
  String phoneText;
  String emailText;
  String addressText;
  String companyNo;
  String orgNo;

  FindYourDoctorScreen(this.title, this.phoneText, this.emailText,
      this.addressText, this.orgNo, this.companyNo);

  @override
  _FindYourDoctorScreenState createState() => _FindYourDoctorScreenState();
}

class _FindYourDoctorScreenState extends State<FindYourDoctorScreen> {
  AsyncMemoizer<DoctorsGridModel> _memoizer;

  // final List<Datum> doctorsList = List<Datum>();

  final Widget filtericon = SvgPicture.asset(
    "assets/icons/fliter.svg",
    width: 10,
    height: 18,
    fit: BoxFit.fitWidth,
    allowDrawingOutsideViewBox: true,
    matchTextDirection: true,
    //semanticsLabel: 'Acme Logo'
  );

  // Future<DoctorsGridModel> getDoctorList() async {
  //   return this._memoizer.runOnce(() async {
  //     var url =
  //         "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/gridList?draw=1&columns%5B0%5D%5Bdata%5D=photo&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=doctorName&columns%5B1%5D%5Bname%5D=doctorName&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=specializationName&columns%5B2%5D%5Bname%5D=&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=docDegree&columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=consultationFee&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=false&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=0&length=9&search%5Bvalue%5D=&search%5Bregex%5D=false&ogNo=${widget.orgNo}&companyNo=${widget.companyNo}&_=1617590097400";
  //     var client = http.Client();
  //     var response = await client.get(url);
  //     print(response.body);
  //
  //     if (response.statusCode == 200) {
  //       DoctorsGridModel data = doctorsGridModelFromJson(response.body);
  //       setState(() {
  //         data.obj.data.forEach((element) {
  //           doctorsList.add(element);
  //         });
  //         print(doctorsList.length);
  //         // data.data.forEach((element) {
  //         //   patientTypeList.add(element);
  //         // });
  //       });
  //       return data;
  //     } else {
  //       return null;
  //     }
  //   });
  // }
  ScrollController _scrollController;

  @override
  void initState() {
    var vm = Provider.of<DoctorListViewModel>(context, listen: false);
    vm.getDoctor(widget.orgNo, widget.companyNo);
    // TODO: implement initState
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorListViewModel>(context);
    List<Datum> doctorList = vm.doctorList;
    print(doctorList[1].specializationName);
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

    var deviceWidth = MediaQuery.of(context).size.width;
    var contrainerWidth = deviceWidth >= 400 ? double.infinity : 400.00;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 19.0, left: 5),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: HexColor('#354291'),
                    )),
              ),
              backgroundColor: HexColor('#354291'),
              expandedHeight: 150.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  // centerTitle: true,
                  //titlePadding: EdgeInsetsGeometry.lerp(, a, 10),
                  titlePadding: EdgeInsetsDirectional.only(
                      start: 15.0, bottom: 4.0, top: 31),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_outlined,
                                  color: Colors.white)),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            width: 175,
                            child: Text(widget.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NotificationScreen()));
                            },
                          )
                        ],
                      ),

                      // Text("Collapsing Toolbar",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 16.0,
                      //     )),
                    ],
                  ),
                  background: Stack(children: [
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
                          padding: const EdgeInsets.only(top: 70.0, left: 25),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: HexColor('#D6DCFF'), width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SizedBox(
                                height: 85,
                                width: MediaQuery.of(context).size.width / 4.5,
                                child:
                                    Image.asset("assets/images/dummyimg.png")),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 75.0),
                              child: Container(
                                  width: 260,
                                  child: Text(
                                    widget.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: HexColor('#141D53')),
                                  )),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                phoneimg,
                                SizedBox(
                                  width: 5,
                                ),
                                Text(widget.phoneText,
                                    style: GoogleFonts.poppins(
                                        color: HexColor('#141D53'),
                                        fontSize: 11)),
                                SizedBox(
                                  width: 5,
                                ),
                                mailimg,
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 105,
                                    child: Text(widget.emailText,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          color: HexColor('#141D53'),
                                          fontSize: 11,
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: mapimg,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: 200,
                                    child: Text(widget.addressText,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          color: HexColor('#141D53'),
                                          fontSize: 11,
                                        ))),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ])),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 8, bottom: 3, left: 25),
                  child: Text('Doctors',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600))),
              Column(children: [
                ...List.generate(
                  doctorList.length,
                  (i) => CustomContainer(
                      doctorList[i].doctorName,
                      doctorList[i].specializationName,
                      'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital',
                      "assets/images/doc.png",
                      doctorList[i].consultationFee.toString(),
                      doctorList[i].buName,
                      doctorList[i].doctorNo.toString(),
                      doctorList[i].companyNo.toString(),
                      doctorList[i].ogNo.toString()),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar2() {
    var deviceWidth = MediaQuery.of(context).size.width;
    var contrainerWidth = deviceWidth >= 400 ? double.infinity : 400.00;
    return SliverAppBar(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      floating: false,
      forceElevated: true,
      shadowColor: Colors.blue.withOpacity(0.3),
      elevation: 5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.only(
            start: 18.0, bottom: 10.0, top: 15, end: 45),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7.0, right: 10),
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
                    "  Find your doctor",
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
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0, bottom: 25),
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
