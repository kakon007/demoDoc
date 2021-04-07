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
import 'dart:convert';
import 'dart:ui';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_container_for_find_doc.dart';
import 'package:http/http.dart' as http;

class FindYourDoctorScreen extends StatefulWidget {
  String title;
  String phoneText;
  String emailText;
  String addressText;
String companyNo;
String orgNo;
  FindYourDoctorScreen(this.title,this.phoneText,this.emailText,this.addressText, this.orgNo, this.companyNo);

  @override
  _FindYourDoctorScreenState createState() => _FindYourDoctorScreenState();
}

class _FindYourDoctorScreenState extends State<FindYourDoctorScreen> {
  AsyncMemoizer<DoctorsGridModel> _memoizer;
  final List<Datum> doctorsList = List<Datum>();
  List<Item> dataList = List<Item>();
  final Widget filtericon = SvgPicture.asset(
    "assets/icons/fliter.svg",
    width: 10,
    height: 18,
    fit: BoxFit.fitWidth,
    allowDrawingOutsideViewBox: true,
    matchTextDirection: true,
    //semanticsLabel: 'Acme Logo'
  );
  Future<HospitalListModel> fetchHospitalList() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyList";
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      // print(response.body);
      HospitalListModel data = hospitalListModelFromJson(response.body) ;
      setState(() {
        data.items.forEach((element) {
          dataList.add(element);
        });
      });
      return data;
    }else {
      return null;
    }
  }
  Future<DoctorsGridModel> getDoctorList() async {
    return this._memoizer.runOnce(() async{
      var url =
          "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/gridList?draw=1&columns%5B0%5D%5Bdata%5D=photo&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=doctorName&columns%5B1%5D%5Bname%5D=doctorName&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=specializationName&columns%5B2%5D%5Bname%5D=&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=docDegree&columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=consultationFee&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=false&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=0&length=9&search%5Bvalue%5D=&search%5Bregex%5D=false&ogNo=${widget.orgNo}&companyNo=${widget.companyNo}&_=1617590097400";
      var client = http.Client();
      var response = await client.get(url);
      print(response.body);

      if (response.statusCode == 200) {
        DoctorsGridModel data = doctorsGridModelFromJson(response.body);
        setState(() {
          data.obj.data.forEach((element) {
            doctorsList.add(element);
          });
          print(doctorsList.length);
          // data.data.forEach((element) {
          //   patientTypeList.add(element);
          // });
        });
        //print('Data:: ' + data.patientItem[0].patientTypeName);
        return data;
      } else {
        return null;
      }
    });

  }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _memoizer = AsyncMemoizer();
    getDoctorList();
    fetchHospitalList();
  }
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
                leading: Padding(
                  padding: const EdgeInsets.only(top:19.0,left: 5),
                  child: GestureDetector(onTap: (){
            Navigator.pop(context);
            },child: Icon(Icons.arrow_back_outlined,color:  HexColor('#354291'),)),
                ),
                backgroundColor: HexColor('#354291'),
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                   // centerTitle: true,
                  //titlePadding: EdgeInsetsGeometry.lerp(, a, 10),
                    titlePadding: EdgeInsetsDirectional.only(
                      start: 15.0,
                      bottom: 4.0,
                      top:31
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(onTap: (){
                              Navigator.pop(context);
                            },child: Icon(Icons.arrow_back_outlined,color:  Colors.white)),
                            SizedBox(width: 3,),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
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
                              padding: const EdgeInsets.only(top:70.0,left: 25),
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
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:75.0),
                                  child: Container(width: 260, child: Text(widget.title,maxLines:1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color:HexColor('#141D53')),)),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    phoneimg,
                                    SizedBox(width: 5,),
                                    Text(widget.phoneText,style: GoogleFonts.poppins(color:HexColor('#141D53'),fontSize: 11)),
                                    SizedBox(width: 5,),
                                    mailimg,
                                    SizedBox(width: 5,),
                                    Container(width:105,child: Text(widget.emailText,maxLines:1,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(color:HexColor('#141D53'),fontSize: 11,))),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:10.0,top: 10),
                                      child: mapimg,
                                    ),
                                    SizedBox(width: 5,),
                                    Container(width: 200,child: Text(widget.addressText,maxLines:2,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(color:HexColor('#141D53'),fontSize: 11,))),
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
                    FutureBuilder<DoctorsGridModel>(
                        future:getDoctorList(),
                        builder: (BuildContext context, snapshot){
                          if(snapshot.hasData){
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  ...List.generate(
                                    snapshot.data.obj.data.length,
                                        (i) => CustomContainer(snapshot.data.obj.data[i].doctorName,snapshot.data.obj.data[i].specializationName, 'MBBS,Ex.Associate Prof & Head Department of BIRDEM,Aalok Hospital', "assets/images/doc.png", snapshot.data.obj.data[i].consultationFee.toString(), snapshot.data.obj.data[i].buName, snapshot.data.obj.data[i].doctorNo.toString(),snapshot.data.obj.data[i].companyNo.toString(), snapshot.data.obj.data[i].ogNo.toString() ),
                                  ),
                                ],
                              ),
                            );
                          }else{
                            return Center(child: CircularProgressIndicator());
                          }
                        })
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
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))),
      floating: false,
      forceElevated: true,
      shadowColor: Colors.blue.withOpacity(0.3),
      elevation: 5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.only(
            start: 18.0,
            bottom: 10.0,
            top:15,
            end: 45
        ),
        title:Padding(
          padding: const EdgeInsets.only(bottom:7.0,right: 10),
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
        ) ,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:18.0,bottom: 25),
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