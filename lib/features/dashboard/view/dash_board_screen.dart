import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/sign_in_screen.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/custom_dialog_box.dart';
import 'package:myhealthbd_app/features/find_doctor/view/find_doctor_screen.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_pat.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view_for_news.dart';
import 'package:myhealthbd_app/main_app/views/widgets/search_bar_viw_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                new Container(
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

                      showGeneralDialog(
                        barrierLabel: "Label",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 700),
                        context: context,
                        pageBuilder: (context, anim1, anim2) {
                          return Stack(
                            children:[
                               Align(
                                alignment: Alignment.bottomCenter,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Container(
                                    height: 200,
                                   // child: SizedBox.expand(child: FlutterLogo()),
                                    //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      //color: HexColor('#f9f2f3'),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          HexColor('#fdf0f2'),
                                          HexColor('#FFFFFF')
                                        ],
                                        tileMode: TileMode.repeated,
                                      ),
                                      borderRadius: radius,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:70.0),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text("To access your Patient portal,",style:TextStyle(fontSize: 18,color: Colors.black)),
                                            SizedBox(height: 5,),
                                            Text("Sign In required.",style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500)),
                                            SizedBox(height: 10,),
                                            Padding(
                                              padding: const EdgeInsets.only(left:40.0),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap:(){
                                                      Navigator.pop(context);
                                                    },
                                                    child: Material(
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color:HexColor('#354291') )),
                                                      color: Colors.white,
                                                      child: SizedBox(
                                                        height: 50,
                                                        width: 150,
                                                        child: Center(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(color: HexColor('#354291'),fontWeight: FontWeight.w500,fontSize: 15),
                                                              ),

                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15,),
                                                  Material(
                                                    elevation: 0,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                    color: HexColor('#354291'),
                                                    child: SizedBox(
                                                      height: 50,
                                                      width: 150,
                                                      child: Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                           "Continue",
                                                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: MediaQuery.of(context).size.height/1.5,
                                left:100,
                                right:100,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: Constants.avatarRadius,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                                      child: Image.asset("assets/icons/sign_in_prompt.png")
                                  ),
                                ),
                              ),
                          ],
                          );
                        },
                        transitionBuilder: (context, anim1, anim2, child) {
                          return SlideTransition(
                            position: Tween(begin: Offset(0, 2), end: Offset(0, 0)).animate(anim1),
                            child: child,
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Text(StringResources.dasboardAppBarSignInText,style:  GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 10),),
                        SizedBox(width: 3,),
                        svg
                        // CircleAvatar(
                        //   radius: 18,
                        //   backgroundColor: Colors.white,
                        //   child: CircleAvatar(
                        //     backgroundImage: AssetImage('assets/images/proimg.png'),
                        //     radius: 16,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.only(top:50.0,left:10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Notification",style: TextStyle(fontSize: 18),),
                          Spacer(),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SlidingUpPanel(
              minHeight: deviceHeight>=600?480:250,
        maxHeight: 710,
        isDraggable: true,
        //backdropEnabled: true,
              borderRadius: radius,
              panel:Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
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
                                    Text(StringResources.viewAllText,style:  GoogleFonts.poppins(color:HexColor("#8592E5") ,fontSize: 11,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:18.0,),
                                    child: Row(
                                children: [
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                    SizedBox(width:15),
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                    SizedBox(width:15),
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                ],
                              ),
                                  )
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left:18.0,right: 18),
                                child: Row(
                                  children: [
                                    Text("News & Update",style:  GoogleFonts.poppins(fontSize: 16
                                        ,fontWeight: FontWeight.w600),),
                                    Spacer(),
                                    Text(StringResources.viewAllText,style:  GoogleFonts.poppins(color:HexColor("#8592E5"),fontSize: 11,fontWeight: FontWeight.w600 ),),
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
                                        CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                        SizedBox(width:15),
                                        CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                        SizedBox(width:15),
                                        CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),

            ),
          ),
        ],
      ),
    );

  }
  Widget _backgroundImage() {
    return Container(
      height: 418.0,
      width: MediaQuery.of(context).size.width,
      child: FadeInImage(
        fit: BoxFit.cover,
        image:AssetImage("assets/images/dashboard_back.png"),
        placeholder: AssetImage(''),
      ),
    );
  }
}
