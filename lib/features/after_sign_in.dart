import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
//import 'package:myhealthbd_app/features/auth/sign_in_screen.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/custom_dialog_box.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view/find_doctor_screen.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart'as hos;
import 'package:myhealthbd_app/features/news/model/news_model.dart';
import 'package:myhealthbd_app/features/news/repositories/news_repository.dart';
import 'package:myhealthbd_app/features/news/view_model/news_view_model.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/hospitals/view/hospital_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_pat.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view_for_news.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:myhealthbd_app/main_app/views/widgets/search_bar_viw_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

class AfterSignIn extends StatefulWidget {
  @override
  _AfterSignInState createState() => _AfterSignInState();
}

class _AfterSignInState extends State<AfterSignIn> {
  ScrollController _controller;
  // List<hos.Item> dataList = new List<hos.Item>();
  // List<Item> dataList2=new List<Item>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = new GlobalKey<ScaffoldState>();
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );

  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  //
  // double xOffset2 = 0.0;
  // double yOffset2 = 0.0;
  // double scaleFactor2 = 1;
  // Future<hos.HospitalListModel> fetchHospitalList() async {
  //   var url =
  //       "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyList";
  //   var client = http.Client();
  //   var response = await client.get(url);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonMap = json.decode(response.body);
  //     //data = jsonMap["items"];
  //     hos.HospitalListModel data = hos.hospitalListModelFromJson(response.body) ;
  //     setState(() {
  //       data.items.forEach((elemant) {
  //         dataList.add(elemant);
  //       });
  //     });
  //     //print('Data:: ' + data.items[5].companyName);
  //     return data;
  //     //print(data[0]['companySlogan']);
  //   }else {
  //     return null;
  //   }
  // }

  // Future<HospitalListModel> fetchHospitalLogo() async {
  //   var url =
  //       "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyLogoList";
  //   var client = http.Client();
  //   var response = await client.get(url);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonMap = json.decode(response.body);
  //     //data = jsonMap["items"];
  //     HospitalListModel data = hospitalListModelFromJson(response.body) ;
  //     setState(() {
  //       data.items.forEach((elemant) {
  //         dataList.add(elemant);
  //       });
  //     });
  //     //print('Data:: ' + data.items[5].companyName);
  //     return data;
  //     //print(data[0]['companySlogan']);
  //   }else {
  //     return null;
  //   }
  // }


  // Future<NewsUpdatedModel> fetchNewspdate() async{
  //   var url='https://qa.myhealthbd.com:9096/online-appointment-api/fapi/news-blogs/list-by-type?blogType=1';
  //   var res=await http.get(url);
  //   if(res.statusCode==200){
  //     NewsUpdatedModel data2=newsUpdatedModelFromJson(res.body);
  //     setState(() {
  //       data2.items.forEach((element) {
  //         dataList2.add(element);
  //       });
  //     });
  //     print("bodddytew::::"+data2.items.first.title.toString());
  //     return data2;
  //   }else{
  //     return null;
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    // fetchHospitalList();
    // fetchNewspdate();
    NewsRepository().fetchNewspdate();
    var vm = Provider.of<HospitalListViewModel>(context, listen: false);
    vm.getData(isFromOnPageLoad: true);
    var vm2 = Provider.of<NewsViewModel>(context, listen: false);
    vm2.getData();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    //fetchHospitalList();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<HospitalListViewModel>(context);
    List<hos.Item> list = vm.hospitalList;
    var lengthofHospitalList = list.length;
    var vm2 = Provider.of<NewsViewModel>(context);
    List<Item> list2 = vm2.newsList;
    var lengthofNewsList = list2.length;
    var deviceHeight=MediaQuery.of(context).size.height;
    var deviceWidth=MediaQuery.of(context).size.width;

    final String assetName1 = "assets/icons/sign_in.svg";
    final Widget svg = SvgPicture.asset(
      assetName1,
      width: 8,
      height: 15,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:230.0,top: 60),
          child: AnimatedContainer(
            transform: Matrix4.translationValues(-0.5, yOffset, 0)
              ..scale(0.7),
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            height: double.infinity,
            width: double.infinity,
            child: Container(),
          ),
        ),

        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(isDrawerOpen?60:0))),
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              // this._backgroundImage(),
              // Padding(
              //   padding: const EdgeInsets.only(top:110.0,left: 70),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("20 Health tips",style:  GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
              //       SizedBox(height: 1,),
              //       Text("to help you start off towards \nhealthy living in 2021",style:  GoogleFonts.poppins(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500),),
              //       SizedBox(height: 8,),
              //       new Container(
              //        width: 90,
              //         height: 20,
              //         decoration: BoxDecoration(
              //             border: Border.all(color: Colors.white),
              //            borderRadius: BorderRadius.circular(30),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.only(right:10.0,left: 10),
              //           child: Row(
              //             children: [
              //               Text("Read More",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 8),),
              //               Spacer(),
              //               Icon(Icons.arrow_forward,size: 10,color: Colors.white,)
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Stack(
                  children: [
                    this._backgroundImage(),
                    Padding(
                      padding: const EdgeInsets.only(top:110.0,left: 70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("20 Health tips",style:  GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(height: 1,),
                          Text("to help you start off towards \nhealthy living in 2021",style:  GoogleFonts.poppins(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500),),
                          SizedBox(height: 8,),
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right:10.0,left: 10),
                              child: Row(
                                children: [
                                  Text("Read More",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 8),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward,size: 10,color: Colors.white,)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Scaffold(
                      key: _scaffoldKey,
                      backgroundColor: Colors.transparent,
                      appBar: new AppBar(
                        // leading: Container(
                        //     height: 10,
                        //     child: svg),
                        title: new Text(
                          StringResources.dasboardAppBarText,
                          style:  GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right:10),
                            child: GestureDetector(
                              onTap: (){

                                // Navigator.push(context, PageRouteBuilder(
                                //   transitionDuration: Duration(seconds: 1),
                                //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                //     var begin = Offset(0, 1.0);
                                //     var end = Offset.zero;
                                //     var curve = Curves.easeInOut;
                                //
                                //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                //
                                //     return SlideTransition(
                                //       position: animation.drive(tween),
                                //       child: child,
                                //     );
                                //   },
                                //   pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
                                // ));


                                // showGeneralDialog(
                                //   barrierLabel: "Label",
                                //   barrierDismissible: true,
                                //   barrierColor: Colors.black.withOpacity(0.5),
                                //   transitionDuration: Duration(milliseconds: 700),
                                //   context: context,
                                //   pageBuilder: (context, anim1, anim2) {
                                //     return Stack(
                                //       children:[
                                //          Align(
                                //           alignment: Alignment.bottomCenter,
                                //           child: Material(
                                //             type: MaterialType.transparency,
                                //             child: Container(
                                //               height: 200,
                                //              // child: SizedBox.expand(child: FlutterLogo()),
                                //               //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                                //               decoration: BoxDecoration(
                                //                 //color: HexColor('#f9f2f3'),
                                //                 gradient: LinearGradient(
                                //                   begin: Alignment.topCenter,
                                //                   end: Alignment.bottomCenter,
                                //                   colors: [
                                //                     HexColor('#fdf0f2'),
                                //                     HexColor('#FFFFFF')
                                //                   ],
                                //                   tileMode: TileMode.repeated,
                                //                 ),
                                //                 borderRadius: radius,
                                //               ),
                                //               child: Padding(
                                //                 padding: const EdgeInsets.only(top:70.0),
                                //                 child: Center(
                                //                   child: Column(
                                //                     children: [
                                //                       Text("To access your Patient portal,",style:TextStyle(fontSize: 18,color: Colors.black)),
                                //                       SizedBox(height: 5,),
                                //                       Text("Sign In required.",style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500)),
                                //                       SizedBox(height: 10,),
                                //                       Padding(
                                //                         padding: const EdgeInsets.only(left:40.0),
                                //                         child: Row(
                                //                           children: [
                                //                             GestureDetector(
                                //                               onTap:(){
                                //                                 Navigator.pop(context);
                                //                               },
                                //                               child: Material(
                                //                                 elevation: 0,
                                //                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color:HexColor('#354291') )),
                                //                                 color: Colors.white,
                                //                                 child: SizedBox(
                                //                                   height: 50,
                                //                                   width: 150,
                                //                                   child: Center(
                                //                                     child: Padding(
                                //                                       padding: const EdgeInsets.all(8.0),
                                //                                         child: Text(
                                //                                           "Cancel",
                                //                                           style: TextStyle(color: HexColor('#354291'),fontWeight: FontWeight.w500,fontSize: 15),
                                //                                         ),
                                //
                                //                                     ),
                                //                                   ),
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                             SizedBox(width: 15,),
                                //                             GestureDetector(
                                //                               onTap: (){
                                //                                 Navigator.push(context, PageRouteBuilder(
                                //                                   transitionDuration: Duration(seconds: 1),
                                //                                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                //                                     var begin = Offset(0, 1.0);
                                //                                     var end = Offset.zero;
                                //                                     var curve = Curves.easeInOut;
                                //
                                //                                     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                //
                                //                                     return SlideTransition(
                                //                                       position: animation.drive(tween),
                                //                                       child: child,
                                //                                     );
                                //                                   },
                                //                                   pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
                                //                                 ));
                                //                               },
                                //                               child: Material(
                                //                                 elevation: 0,
                                //                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                //                                 color: HexColor('#354291'),
                                //                                 child: SizedBox(
                                //                                   height: 50,
                                //                                   width: 150,
                                //                                   child: Center(
                                //                                     child: Padding(
                                //                                       padding: const EdgeInsets.all(8.0),
                                //                                       child: Text(
                                //                                        "Continue",
                                //                                         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                //                                       ),
                                //                                     ),
                                //                                   ),
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                           ],
                                //                         ),
                                //                       )
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //
                                //         Positioned(
                                //           top: MediaQuery.of(context).size.height/1.5,
                                //           left:100,
                                //           right:100,
                                //           child: CircleAvatar(
                                //             backgroundColor: Colors.transparent,
                                //             radius: Constants.avatarRadius,
                                //             child: ClipRRect(
                                //                 borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                                //                 child: Image.asset("assets/icons/sign_in_prompt.png")
                                //             ),
                                //           ),
                                //         ),
                                //     ],
                                //     );
                                //   },
                                //   transitionBuilder: (context, anim1, anim2, child) {
                                //     return SlideTransition(
                                //       position: Tween(begin: Offset(0, 2), end: Offset(0, 0)).animate(anim1),
                                //       child: child,
                                //     );
                                //   },
                                // );
                              },
                              child: Row(
                                children: [
                                  // Text(StringResources.dasboardAppBarSignInText,style:  GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 10),),
                                  // SizedBox(width: 3,),
                                  // svg,
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/proimg.png'),
                                      radius: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        leading: Container(
                          child: isDrawerOpen
                              ? IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                });
                              })
                              : IconButton(
                              icon: Icon(Icons.notes),
                              onPressed: () {
                                setState(() {
                                  xOffset = 250;
                                  yOffset = 100;
                                  scaleFactor = 0.8;
                                  isDrawerOpen = true;
                                });
                                print("Jahid");
                              }),
                        ),
                      ),
                      // drawer: Drawer(
                      //   // child: GestureDetector(
                      //   //   onTap: (){
                      //   //     //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainCollapsingToolbar()));
                      //   //   },
                      //   //   child: Padding(
                      //   //     padding: const EdgeInsets.only(top:50.0,left:10),
                      //   //     child: Column(
                      //   //       children: [
                      //   //         Row(
                      //   //           children: [
                      //   //             Text("Find Your Doctor",style: TextStyle(fontSize: 18),),
                      //   //             Spacer(),
                      //   //             Icon(Icons.arrow_forward),
                      //   //           ],
                      //   //         ),
                      //   //       ],
                      //   //     ),
                      //   //   ),
                      //   // ),
                      //   child: isDrawerOpen
                      //       ? IconButton(
                      //       icon: Icon(Icons.arrow_back_sharp),
                      //       onPressed: () {
                      //         setState(() {
                      //           xOffset = 0;
                      //           yOffset = 0;
                      //           scaleFactor = 1;
                      //           isDrawerOpen = false;
                      //         });
                      //       })
                      //       : IconButton(
                      //       icon: Icon(Icons.menu),
                      //       onPressed: () {
                      //         setState(() {
                      //           xOffset = 250;
                      //           yOffset = 150;
                      //           scaleFactor = 0.6;
                      //           isDrawerOpen = true;
                      //         });
                      //         print("Jahid");
                      //       }),
                      // ),
                      body: SlidingUpPanel(
                        minHeight: deviceHeight>=600?480:250,
                        maxHeight: 710,
                        isDraggable: true,
                        //backdropEnabled: true,
                        borderRadius: isDrawerOpen?BorderRadius.all(Radius.circular(30)):radius,
                        panel:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:18,left:20.0,right: 20),
                              child: Row(
                                children: [
                                  Text(StringResources.esayDoctorAppointmentText,style:  GoogleFonts.poppins(fontSize: 17
                                      ,fontWeight: FontWeight.w600),),
                                  Spacer(),
                                  Container(
                                      width: 100,

                                      child: Image.asset("assets/images/my_health_logo.png")),

                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left:15.0,right: 15),
                              child: SearchBarViewWidget(),
                            ),
                            //SizedBox(height: 10,),
                            // CustomCardPat("You have an upcoming appointment","22-02-2021 Monday 08:30pm \nSerial-12","Dr. Jahid Hasan","Alok hospital"),
                            // SizedBox(height: 10,),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.only(left:18.0,right: 18),
                              child: Row(
                                children: [
                                  Text(StringResources.hospitalDiagnosticsText,style:  GoogleFonts.poppins(fontSize: 16
                                      ,fontWeight: FontWeight.w600),),
                                  Spacer(),
                                  GestureDetector(onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalScreen()));
                                  },child: Text(StringResources.viewAllText,style:  GoogleFonts.poppins(color:HexColor("#8592E5") ,fontSize: 11,fontWeight: FontWeight.w600),)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            // FutureBuilder<hos.HospitalListModel>(
                            //   //  scrollDirection: Axis.horizontal,
                            //   //  physics: ClampingScrollPhysics(),
                            //   //  shrinkWrap: true,
                            //   // itemCount: dataList.length,
                            //     future:fetchHospitalList(),
                            //     builder: (BuildContext context, snapshot){
                            //       if(snapshot.hasData){
                            //         return SingleChildScrollView(
                            //           scrollDirection: Axis.horizontal,
                            //           child: Padding(
                            //             padding: const EdgeInsets.only(left:18.0,),
                            //             child:
                            //             Row(
                            //               children: [
                            //                 ...List.generate(
                            //                   snapshot.data.items.length,
                            //                       (i) => CustomCard(snapshot.data.items[i].companyName,snapshot.data.items[i].companyAddress==null?"Mirpur,Dahaka,Bangladesh":snapshot.data.items[i].companyAddress,"60 Doctors",snapshot.data.items[i].companyPhone==null?"+880 1962823007":snapshot.data.items[i].companyPhone,snapshot.data.items[i].companyEmail==null?"info@mysoftitd.com":snapshot.data.items[i].companyEmail,snapshot.data.items[i].companyLogo),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         );
                            //       }else{
                            //         return CircularProgressIndicator();
                            //       }
                            //     }
                            //     ),

                            vm.shouldShowPageLoader
                                ? Center(
                              child: Loader(),
                            ) :
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.only(left:18.0,),
                                child:
                                Row(
                                  children: [
                                    ...List.generate(
                                      lengthofHospitalList,
                                          (i) => CustomCard(list[i].companyName,list[i].companyAddress==null?"Mirpur,Dahaka,Bangladesh":list[i].companyAddress,"60 Doctors",list[i].companyPhone==null?"+880 1962823007":list[i].companyPhone,list[i].companyEmail==null?"info@mysoftitd.com":list[i].companyEmail,list[i].companyLogo,list[i].companyId,list[i].ogNo.toString()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left:18.0,right: 18),
                              child: Row(
                                children: [
                                  Text("News & Update",style:  GoogleFonts.poppins(fontSize: 16
                                      ,fontWeight: FontWeight.w600),),
                                  Spacer(),
                                  GestureDetector(onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalScreen()));
                                  },child: Text(StringResources.viewAllText,style:  GoogleFonts.poppins(color:HexColor("#8592E5"),fontSize: 11,fontWeight: FontWeight.w600 ),)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            // FutureBuilder<NewsUpdatedModel>(
                            //   //  scrollDirection: Axis.horizontal,
                            //   //  physics: ClampingScrollPhysics(),
                            //   //  shrinkWrap: true,
                            //   // itemCount: dataList.length,
                            //     future:fetchNewspdate(),
                            //     builder: (BuildContext context, snapshot){
                            //       if(snapshot.hasData){
                            //         return SingleChildScrollView(
                            //           scrollDirection: Axis.horizontal,
                            //           child: Padding(
                            //             padding: const EdgeInsets.only(left:18.0,),
                            //             child:
                            //             Row(
                            //               children: [
                            //                 ...List.generate(
                            //                   snapshot.data.items.length,
                            //                       (i) => CustomCardNews(DateUtil().formattedDate(DateTime.parse(dataList2[i].publishDate).toLocal()),dataList2[i].title,dataList2[i].newsLink),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         );
                            //       }else{
                            //         return CircularProgressIndicator();
                            //       }
                            //     }),


                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.only(left:18.0,),
                                child:
                                Row(
                                  children: [
                                    ...List.generate(
                                      lengthofNewsList,
                                          (i) => CustomCardNews(DateUtil().formattedDate(DateTime.parse(list2[i].publishDate).toLocal()),list2[i].title,list2[i].newsLink),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left:18.0,right: 18),
                              child: Row(
                                children: [
                                  Text("My Health Video",style: GoogleFonts.poppins(fontSize: 16
                                      ,fontWeight: FontWeight.w600),),
                                  Spacer(),
                                  Text(StringResources.viewAllText,style: GoogleFonts.poppins(color:HexColor("#8592E5") ,fontSize: 11 ,fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:18.0),
                                  child: Row(
                                    children: [
                                      CustomCardNews("১৫ জানুয়ারি, ২০২১","স্বাস্থ্যসেবা অটোমেশনে মাইসফট ও মাইহেলথ বিডির অনন্য দৃষ্টান্ত","60 Doctors"),
                                      SizedBox(width:15),
                                      CustomCardNews("১৫ জানুয়ারি, ২০২১","স্বাস্থ্যসেবা অটোমেশনে মাইসফট ও মাইহেলথ বিডির অনন্য দৃষ্টান্ত","60 Doctors"),
                                      SizedBox(width:15),
                                      CustomCardNews("১৫ জানুয়ারি, ২০২১","স্বাস্থ্যসেবা অটোমেশনে মাইসফট ও মাইহেলথ বিডির অনন্য দৃষ্টান্ত","60 Doctors"),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ],
    );

  }
  Widget _backgroundImage() {
    return Container(
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.all(Radius.circular(30))),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        image: DecorationImage(
            image: AssetImage(
                "assets/images/dashboard_back.png"),
            fit: BoxFit.cover),
      ),
      height: 418.0,
      width: double.infinity,
      // child: FadeInImage(
      //   fit: BoxFit.cover,
      //   image:AssetImage("assets/images/dashboard_back.png"),
      //   placeholder: AssetImage(''),
      // ),
    );
  }

}



class DateUtil {
  static const DATE_FORMAT = 'yyyy-MM-dd';
  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}










// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:intl/intl.dart';
// import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
// import 'package:myhealthbd_app/features/constant.dart';
// import 'package:myhealthbd_app/features/dashboard/model/news_update_model.dart';import 'package:myhealthbd_app/features/dashboard/model/user_details_model.dart';
// import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart'as hos;
// import 'package:myhealthbd_app/features/hospitals/view/hospital_screen.dart';
// import 'package:myhealthbd_app/features/my_health/models/prescription_list_model.dart';
// import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
// import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/custom_card_pat.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view_for_news.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/custom_drawer.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/search_bar_viw_widget.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:http/http.dart' as http;
//
// class AfterSignIn extends StatefulWidget {
//   @override
//   _AfterSignInState createState() => _AfterSignInState();
// }
//
// class _AfterSignInState extends State<AfterSignIn> {
//   List<hos.Item> dataList = new List<hos.Item>();
//   List<Datum> dataList3 ;
//   String dataList2 ;
//   List<Item> dataList4=new List<Item>();
//   BorderRadiusGeometry radius = BorderRadius.only(
//     topLeft: Radius.circular(25.0),
//     topRight: Radius.circular(25.0),
//   );
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   final GlobalKey<ScaffoldState> _scaffoldKey2 = new GlobalKey<ScaffoldState>();
//   double xOffset = 0.0;
//   double yOffset = 0.0;
//   double scaleFactor = 1;
//   bool isDrawerOpen = false;
//
//   Future<hos.HospitalListModel> fetchHospitalList() async {
//     var url =
//         "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyList";
//     var client = http.Client();
//     var response = await client.get(url);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonMap = json.decode(response.body);
//       //data = jsonMap["items"];
//       hos.HospitalListModel data = hos.hospitalListModelFromJson(response.body) ;
//       setState(() {
//         data.items.forEach((elemant) {
//           dataList.add(elemant);
//         });
//       });
//       //print('Data:: ' + data.items[5].companyName);
//       return data;
//       //print(data[0]['companySlogan']);
//     }else {
//       return null;
//     }
//   }
//
//   Future<FindHospitalNumberModel> fetchUserDetails() async {
//     var url =
//         "https://qa.myhealthbd.com:9096/diagnostic-api/api/pat-investigation-report/find-hospitalNumber";
//     final body={};
//     var client = http.Client();
//     var response = await client.post(url,headers: {'Authorization': 'Bearer ${signInData.accessToken}',});
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonMap = json.decode(response.body);
//       print("Body"+jsonMap.toString());
//       //data = jsonMap["items"];
//       FindHospitalNumberModel data2 = findHospitalNumberModelFromJson(response.body) ;
//       //Obj odj=Obj.fromJson();
//       setState(() {
//         dataList2=data2.obj.fname;
//       });
//       print('Data:: ' + data2.obj.fname);
//       print('DataList:: ' + dataList2.toString());
//       return data2;
//       //print(data[0]['companySlogan']);
//     }else {
//       return null;
//     }
//   }
//
//
//   Future<PrescriptionListModel> fetchpres() async {
//     var url =
//         "https://qa.myhealthbd.com:9096/diagnostic-api/api/pat-investigation-report/patient-prescription-list?draw=1&columns%5B0%5D%5Bdata%5D=consultationId&columns%5B0%5D%5Bname%5D=consultationId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=prescriptionDateTime&columns%5B1%5D%5Bname%5D=prescriptionDateTime&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=doctorName&columns%5B2%5D%5Bname%5D=doctorName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=companyName&columns%5B3%5D%5Bname%5D=companyName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=0&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1617439318994";
//     var client = http.Client();
//     var response = await client.get(url);
//     if (response.statusCode == 200) {
//       print('Response: '+ response.body.toString());
//       Map<String, dynamic> jsonMap = json.decode(response.body);
//       PrescriptionListModel data = prescriptionListModelFromJson(response.body) ;
//       if(this.mounted){
//         // setState(() {
//         data.obj.data.forEach((elemant) {
//           dataList3.add(elemant);
//           // });
//         });
//       }
//       print('Called');
//       // print('Data:: ' + data.items[5].companyName);
//       print('DataList2:: ' + dataList3.first.consultationId);
//       return data;
//     }else {
//       return null;
//     }
//   }
//
//   Future<NewsUpdatedModel> fetchNewspdate() async{
//     var url='https://qa.myhealthbd.com:9096/online-appointment-api/fapi/news-blogs/list-by-type?blogType=1';
//     var res=await http.get(url);
//     if(res.statusCode==200){
//       NewsUpdatedModel data2=newsUpdatedModelFromJson(res.body);
//       setState(() {
//         data2.items.forEach((element) {
//           dataList4.add(element);
//         });
//       });
//       //print("bodddytew::::"+data2.items.first.title.toString());
//       return data2;
//     }else{
//       return null;
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     fetchUserDetails();
//     fetchpres();
//     fetchNewspdate();
//     //fetchHospitalList();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var deviceHeight=MediaQuery.of(context).size.height;
//     var deviceWidth=MediaQuery.of(context).size.width;
//    // DrawerScreen(username: dataList2.first.o,);
//
//     final String assetName1 = "assets/icons/sign_in.svg";
//     final Widget svg = SvgPicture.asset(
//       assetName1,
//       width: 8,
//       height: 15,
//       fit: BoxFit.fitWidth,
//       allowDrawingOutsideViewBox: true,
//       matchTextDirection: true,
//       //semanticsLabel: 'Acme Logo'
//     );
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left:230.0,top: 60),
//           child: AnimatedContainer(
//             transform: Matrix4.translationValues(-0.5, yOffset, 0)
//               ..scale(0.7),
//             duration: Duration(milliseconds: 200),
//             decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(0.3),
//                 borderRadius: BorderRadius.all(Radius.circular(30))),
//             height: double.infinity,
//             width: double.infinity,
//             child: Container(),
//           ),
//         ),
//
//         AnimatedContainer(
//           transform: Matrix4.translationValues(xOffset, yOffset, 0)
//             ..scale(scaleFactor),
//           duration: Duration(milliseconds: 200),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(isDrawerOpen?60:0))),
//           height: double.infinity,
//           width: double.infinity,
//           child: Stack(
//             children: <Widget>[
//               // this._backgroundImage(),
//               // Padding(
//               //   padding: const EdgeInsets.only(top:110.0,left: 70),
//               //   child: Column(
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     children: [
//               //       Text("20 Health tips",style:  GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
//               //       SizedBox(height: 1,),
//               //       Text("to help you start off towards \nhealthy living in 2021",style:  GoogleFonts.poppins(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500),),
//               //       SizedBox(height: 8,),
//               //       new Container(
//               //        width: 90,
//               //         height: 20,
//               //         decoration: BoxDecoration(
//               //             border: Border.all(color: Colors.white),
//               //            borderRadius: BorderRadius.circular(30),
//               //         ),
//               //         child: Padding(
//               //           padding: const EdgeInsets.only(right:10.0,left: 10),
//               //           child: Row(
//               //             children: [
//               //               Text("Read More",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 8),),
//               //               Spacer(),
//               //               Icon(Icons.arrow_forward,size: 10,color: Colors.white,)
//               //             ],
//               //           ),
//               //         ),
//               //       )
//               //     ],
//               //   ),
//               // ),
//               Stack(
//                   children: [
//                     this._backgroundImage(),
//                     Padding(
//                       padding: const EdgeInsets.only(top:110.0,left: 70),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("20 Health tips",style:  GoogleFonts.poppins(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
//                           SizedBox(height: 1,),
//                           Text("to help you start off towards \nhealthy living in 2021",style:  GoogleFonts.poppins(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w500),),
//                           SizedBox(height: 8,),
//                           Container(
//                             width: 90,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.white),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(right:10.0,left: 10),
//                               child: Row(
//                                 children: [
//                                   Text("Read More",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 8),),
//                                   Spacer(),
//                                   Icon(Icons.arrow_forward,size: 10,color: Colors.white,)
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Scaffold(
//                       key: _scaffoldKey,
//                       backgroundColor: Colors.transparent,
//                       appBar: new AppBar(
//                         // leading: Container(
//                         //     height: 10,
//                         //     child: svg),
//                         title: new Text(
//                           StringResources.dasboardAppBarText,
//                           style:  GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600),
//                         ),
//                         actions: [
//                           Padding(
//                             padding: const EdgeInsets.only(right:10),
//                             child: GestureDetector(
//                               onTap: (){
//
//                                 Navigator.push(context, PageRouteBuilder(
//                                   transitionDuration: Duration(seconds: 1),
//                                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                                     var begin = Offset(0, 1.0);
//                                     var end = Offset.zero;
//                                     var curve = Curves.easeInOut;
//
//                                     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//                                     return SlideTransition(
//                                       position: animation.drive(tween),
//                                       child: child,
//                                     );
//                                   },
//                                   pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
//                                 ));
//
//
//                                 // showGeneralDialog(
//                                 //   barrierLabel: "Label",
//                                 //   barrierDismissible: true,
//                                 //   barrierColor: Colors.black.withOpacity(0.5),
//                                 //   transitionDuration: Duration(milliseconds: 700),
//                                 //   context: context,
//                                 //   pageBuilder: (context, anim1, anim2) {
//                                 //     return Stack(
//                                 //       children:[
//                                 //          Align(
//                                 //           alignment: Alignment.bottomCenter,
//                                 //           child: Material(
//                                 //             type: MaterialType.transparency,
//                                 //             child: Container(
//                                 //               height: 200,
//                                 //              // child: SizedBox.expand(child: FlutterLogo()),
//                                 //               //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
//                                 //               decoration: BoxDecoration(
//                                 //                 //color: HexColor('#f9f2f3'),
//                                 //                 gradient: LinearGradient(
//                                 //                   begin: Alignment.topCenter,
//                                 //                   end: Alignment.bottomCenter,
//                                 //                   colors: [
//                                 //                     HexColor('#fdf0f2'),
//                                 //                     HexColor('#FFFFFF')
//                                 //                   ],
//                                 //                   tileMode: TileMode.repeated,
//                                 //                 ),
//                                 //                 borderRadius: radius,
//                                 //               ),
//                                 //               child: Padding(
//                                 //                 padding: const EdgeInsets.only(top:70.0),
//                                 //                 child: Center(
//                                 //                   child: Column(
//                                 //                     children: [
//                                 //                       Text("To access your Patient portal,",style:TextStyle(fontSize: 18,color: Colors.black)),
//                                 //                       SizedBox(height: 5,),
//                                 //                       Text("Sign In required.",style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500)),
//                                 //                       SizedBox(height: 10,),
//                                 //                       Padding(
//                                 //                         padding: const EdgeInsets.only(left:40.0),
//                                 //                         child: Row(
//                                 //                           children: [
//                                 //                             GestureDetector(
//                                 //                               onTap:(){
//                                 //                                 Navigator.pop(context);
//                                 //                               },
//                                 //                               child: Material(
//                                 //                                 elevation: 0,
//                                 //                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color:HexColor('#354291') )),
//                                 //                                 color: Colors.white,
//                                 //                                 child: SizedBox(
//                                 //                                   height: 50,
//                                 //                                   width: 150,
//                                 //                                   child: Center(
//                                 //                                     child: Padding(
//                                 //                                       padding: const EdgeInsets.all(8.0),
//                                 //                                         child: Text(
//                                 //                                           "Cancel",
//                                 //                                           style: TextStyle(color: HexColor('#354291'),fontWeight: FontWeight.w500,fontSize: 15),
//                                 //                                         ),
//                                 //
//                                 //                                     ),
//                                 //                                   ),
//                                 //                                 ),
//                                 //                               ),
//                                 //                             ),
//                                 //                             SizedBox(width: 15,),
//                                 //                             GestureDetector(
//                                 //                               onTap: (){
//                                 //                                 Navigator.push(context, PageRouteBuilder(
//                                 //                                   transitionDuration: Duration(seconds: 1),
//                                 //                                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                                 //                                     var begin = Offset(0, 1.0);
//                                 //                                     var end = Offset.zero;
//                                 //                                     var curve = Curves.easeInOut;
//                                 //
//                                 //                                     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//                                 //
//                                 //                                     return SlideTransition(
//                                 //                                       position: animation.drive(tween),
//                                 //                                       child: child,
//                                 //                                     );
//                                 //                                   },
//                                 //                                   pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
//                                 //                                 ));
//                                 //                               },
//                                 //                               child: Material(
//                                 //                                 elevation: 0,
//                                 //                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                                 //                                 color: HexColor('#354291'),
//                                 //                                 child: SizedBox(
//                                 //                                   height: 50,
//                                 //                                   width: 150,
//                                 //                                   child: Center(
//                                 //                                     child: Padding(
//                                 //                                       padding: const EdgeInsets.all(8.0),
//                                 //                                       child: Text(
//                                 //                                        "Continue",
//                                 //                                         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
//                                 //                                       ),
//                                 //                                     ),
//                                 //                                   ),
//                                 //                                 ),
//                                 //                               ),
//                                 //                             ),
//                                 //                           ],
//                                 //                         ),
//                                 //                       )
//                                 //                     ],
//                                 //                   ),
//                                 //                 ),
//                                 //               ),
//                                 //             ),
//                                 //           ),
//                                 //         ),
//                                 //
//                                 //         Positioned(
//                                 //           top: MediaQuery.of(context).size.height/1.5,
//                                 //           left:100,
//                                 //           right:100,
//                                 //           child: CircleAvatar(
//                                 //             backgroundColor: Colors.transparent,
//                                 //             radius: Constants.avatarRadius,
//                                 //             child: ClipRRect(
//                                 //                 borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
//                                 //                 child: Image.asset("assets/icons/sign_in_prompt.png")
//                                 //             ),
//                                 //           ),
//                                 //         ),
//                                 //     ],
//                                 //     );
//                                 //   },
//                                 //   transitionBuilder: (context, anim1, anim2, child) {
//                                 //     return SlideTransition(
//                                 //       position: Tween(begin: Offset(0, 2), end: Offset(0, 0)).animate(anim1),
//                                 //       child: child,
//                                 //     );
//                                 //   },
//                                 // );
//                               },
//                               child: Row(
//                                 children: [
//                                   // Text(StringResources.dasboardAppBarSignInText,style:  GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 10),),
//                                   // SizedBox(width: 3,),
//                                   //svg,
//                                   CircleAvatar(
//                                     radius: 18,
//                                     backgroundColor: Colors.white,
//                                     child: CircleAvatar(
//                                       backgroundImage: AssetImage('assets/images/proimg.png'),
//                                       radius: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                         backgroundColor: Colors.transparent,
//                         elevation: 0.0,
//                         leading: Container(
//                           child: isDrawerOpen
//                               ? IconButton(
//                               icon: Icon(Icons.notes),
//                               onPressed: () {
//                                 setState(() {
//                                   xOffset = 0;
//                                   yOffset = 0;
//                                   scaleFactor = 1;
//                                   isDrawerOpen = false;
//                                 });
//                               })
//                               : IconButton(
//                               icon: Icon(Icons.arrow_back),
//                               onPressed: () {
//                                 setState(() {
//                                   xOffset = 250;
//                                   yOffset = 100;
//                                   scaleFactor = 0.8;
//                                   isDrawerOpen = true;
//                                 });
//                                 print("Jahid");
//                               }),
//                         ),
//                       ),
//                       // drawer: Drawer(
//                       //   // child: GestureDetector(
//                       //   //   onTap: (){
//                       //   //     //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainCollapsingToolbar()));
//                       //   //   },
//                       //   //   child: Padding(
//                       //   //     padding: const EdgeInsets.only(top:50.0,left:10),
//                       //   //     child: Column(
//                       //   //       children: [
//                       //   //         Row(
//                       //   //           children: [
//                       //   //             Text("Find Your Doctor",style: TextStyle(fontSize: 18),),
//                       //   //             Spacer(),
//                       //   //             Icon(Icons.arrow_forward),
//                       //   //           ],
//                       //   //         ),
//                       //   //       ],
//                       //   //     ),
//                       //   //   ),
//                       //   // ),
//                       //   child: isDrawerOpen
//                       //       ? IconButton(
//                       //       icon: Icon(Icons.arrow_back_sharp),
//                       //       onPressed: () {
//                       //         setState(() {
//                       //           xOffset = 0;
//                       //           yOffset = 0;
//                       //           scaleFactor = 1;
//                       //           isDrawerOpen = false;
//                       //         });
//                       //       })
//                       //       : IconButton(
//                       //       icon: Icon(Icons.menu),
//                       //       onPressed: () {
//                       //         setState(() {
//                       //           xOffset = 250;
//                       //           yOffset = 150;
//                       //           scaleFactor = 0.6;
//                       //           isDrawerOpen = true;
//                       //         });
//                       //         print("Jahid");
//                       //       }),
//                       // ),
//                       body: SlidingUpPanel(
//                         minHeight: deviceHeight>=600?480:250,
//                         maxHeight: 710,
//                         isDraggable: true,
//                         //backdropEnabled: true,
//                         borderRadius: isDrawerOpen?BorderRadius.all(Radius.circular(30)):radius,
//                         panel:Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top:18,left:20.0,right: 20),
//                               child: Row(
//                                 children: [
//                                   Text(StringResources.esayDoctorAppointmentText,style:  GoogleFonts.poppins(fontSize: 17
//                                       ,fontWeight: FontWeight.w600),),
//                                   Spacer(),
//                                   Container(
//                                       width: 100,
//
//                                       child: Image.asset("assets/images/my_health_logo.png")),
//
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left:15.0,right: 15),
//                               child: SearchBarViewWidget(),
//                             ),
//                             SizedBox(height: 3,),
//                             CustomCardPat("You have an upcoming appointment","22-02-2021 Monday 08:30pm \nSerial-12","Dr. Jahid Hasan","Alok hospital"),
//                             SizedBox(height: 3,),
//                             //SizedBox(height: 30,),
//                             Padding(
//                               padding: const EdgeInsets.only(left:18.0,right: 18),
//                               child: Row(
//                                 children: [
//                                   Text(StringResources.hospitalDiagnosticsText,style:  GoogleFonts.poppins(fontSize: 16
//                                       ,fontWeight: FontWeight.w600),),
//                                   Spacer(),
//                                   GestureDetector(onTap: (){
//                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalScreen()));
//                                   },child: Text(StringResources.viewAllText,style:  GoogleFonts.poppins(color:HexColor("#8592E5") ,fontSize: 11,fontWeight: FontWeight.w600),)),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             FutureBuilder<hos.HospitalListModel>(
//                               //  scrollDirection: Axis.horizontal,
//                               //  physics: ClampingScrollPhysics(),
//                               //  shrinkWrap: true,
//                               // itemCount: dataList.length,
//                                 future:fetchHospitalList(),
//                                 builder: (BuildContext context, snapshot){
//                                   if(snapshot.hasData){
//                                     return SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left:18.0,),
//                                         child:
//                                         Row(
//                                           children: [
//                                             ...List.generate(
//                                               snapshot.data.items.length,
//                                                   (i) => CustomCard(snapshot.data.items[i].companyName,snapshot.data.items[i].companyAddress==null?"Mirpur,Dahaka,Bangladesh":snapshot.data.items[i].companyAddress,"60 Doctors",snapshot.data.items[i].companyPhone==null?"+880 1962823007":snapshot.data.items[i].companyPhone,snapshot.data.items[i].companyEmail==null?"info@mysoftitd.com":snapshot.data.items[i].companyEmail,snapshot.data.items[i].companyLogo),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   }else{
//                                     return CircularProgressIndicator();
//                                   }
//                                 }),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left:18.0,right: 18),
//                               child: Row(
//                                 children: [
//                                   Text("News & Update",style:  GoogleFonts.poppins(fontSize: 16
//                                       ,fontWeight: FontWeight.w600),),
//                                   Spacer(),
//                                   Text(StringResources.viewAllText,style:  GoogleFonts.poppins(color:HexColor("#8592E5"),fontSize: 11,fontWeight: FontWeight.w600 ),),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             FutureBuilder<NewsUpdatedModel>(
//                               //  scrollDirection: Axis.horizontal,
//                               //  physics: ClampingScrollPhysics(),
//                               //  shrinkWrap: true,
//                               // itemCount: dataList.length,
//                                 future:fetchNewspdate(),
//                                 builder: (BuildContext context, snapshot){
//                                   if(snapshot.hasData){
//                                     return SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left:18.0,),
//                                         child:
//                                         Row(
//                                           children: [
//                                             ...List.generate(
//                                               snapshot.data.items.length,
//                                                   (i) => CustomCardNews(DateUtil().formattedDate(DateTime.parse(dataList2[i].publishDate.toString()).toLocal()),dataList2[i].title,dataList2[i].newsLink),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   }else{
//                                     return CircularProgressIndicator();
//                                   }
//                                 }),
//                             SizedBox(height: 3,),
//                             Padding(
//                               padding: const EdgeInsets.only(left:18.0,right: 18),
//                               child: Row(
//                                 children: [
//                                   Text("My Health Video",style: GoogleFonts.poppins(fontSize: 16
//                                       ,fontWeight: FontWeight.w600),),
//                                   Spacer(),
//                                   Text(StringResources.viewAllText,style: GoogleFonts.poppins(color:HexColor("#8592E5") ,fontSize: 11 ,fontWeight: FontWeight.w600),),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 3,),
//                             SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left:18.0),
//                                   child: Row(
//                                     children: [
//                                       CustomCardNews("১৫ জানুয়ারি, ২০২১","স্বাস্থ্যসেবা অটোমেশনে মাইসফট ও মাইহেলথ বিডির অনন্য দৃষ্টান্ত","60 Doctors"),
//                                       SizedBox(width:15),
//                                       CustomCardNews("১৫ জানুয়ারি, ২০২১","স্বাস্থ্যসেবা অটোমেশনে মাইসফট ও মাইহেলথ বিডির অনন্য দৃষ্টান্ত","60 Doctors"),
//                                       SizedBox(width:15),
//                                       CustomCardNews("১৫ জানুয়ারি, ২০২১","স্বাস্থ্যসেবা অটোমেশনে মাইসফট ও মাইহেলথ বিডির অনন্য দৃষ্টান্ত","60 Doctors"),
//                                     ],
//                                   ),
//                                 )
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//
//   }
//   Widget _backgroundImage() {
//     return Container(
//       // decoration: BoxDecoration(
//       //     color: Colors.white,
//       //     borderRadius: BorderRadius.all(Radius.circular(30))),
//
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(30)),
//         image: DecorationImage(
//             image: AssetImage(
//                 "assets/images/dashboard_back.png"),
//             fit: BoxFit.cover),
//       ),
//       height: 418.0,
//       width: double.infinity,
//       // child: FadeInImage(
//       //   fit: BoxFit.cover,
//       //   image:AssetImage("assets/images/dashboard_back.png"),
//       //   placeholder: AssetImage(''),
//       // ),
//     );
//   }
// }
//
// class DateUtil {
//   static const DATE_FORMAT = 'yyyy-MM-dd';
//   String formattedDate(DateTime dateTime) {
//     print('dateTime ($dateTime)');
//     return DateFormat(DATE_FORMAT).format(dateTime);
//   }
// }
