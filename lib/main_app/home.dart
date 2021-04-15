import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/after_sign_in.dart';
import 'package:myhealthbd_app/features/appointments/view/appointments_screen.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/dashboard/repositories/hospital_list_repository.dart';
import 'package:myhealthbd_app/features/dashboard/view/dash_board_screen.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view/find_doctor_screen.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/hospital_list_repository.dart';
import 'package:myhealthbd_app/features/hospitals/view/hospital_screen.dart';
import 'package:myhealthbd_app/features/my_health/view/my_health_screen.dart';
import 'package:myhealthbd_app/features/my_health/view/patient_portal_screen.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view/user_profile_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_Sign_prompt.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_drawer.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_drawer_2.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_signIn_for_patient_portal.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../get_appointment_screen.dart';

class HomeScreen extends StatefulWidget {
  String accessToken;
  String userName;
  HomeScreen({this.accessToken, this.userName});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> scaleAnimation;
  Duration duration=Duration(milliseconds: 200);
  bool isDrawerOpen = false;
  bool isSelected=false;
  int currentIndex=0;
  List<Animation> scaleAnimations;
  _moveTo(int index){
    currentIndex=index;
    setState(() {

    });
  }

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );

  Widget showModal(){
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
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 1),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.easeInOut;

                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
                                    ));
                                  },
                                  child: Material(
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
  }

  // Map<int,Widget> screens= {
  //   0: DashboardScreen(isDrawerOpen: true,),
  //   1: HospitalScreen(),
  //   2: GetAppointment(),
  //   3: GetAppointment(),
  // };
  //
  // List<Widget> screenShots;
  // List<Widget> finalStack(){
  //   List<Widget> stackToReturn=[];
  //   stackToReturn.add(DrawerScreen2(menuCallBack:(selectedIndex) {
  //     setState(() {
  //       isSelected=true;
  //       screenShots=screens.values.toList();
  //     final selectedWidget=screenShots.removeAt(selectedIndex);
  //     screenShots.insert(0, selectedWidget);
  //     });
  //   },));
  //   //stackToReturn.add(DashboardScreen());
  //   screenShots.asMap().entries.map((e) => buildStackedScreen(e.key)).toList().reversed..forEach((element) {stackToReturn.add(element);});
  //   return stackToReturn;
  // }
  //
  // Widget buildStackedScreen(int position){
  //   var deviceWidth=MediaQuery.of(context).size.width;
  //   return AnimatedPositioned(
  //     duration: duration,
  //     top: 0,
  //     left:isDrawerOpen?deviceWidth*0.50:0,
  //     right:isDrawerOpen?deviceWidth*-0.45:0,
  //     bottom: 0,
  //     // transform: Matrix4.translationValues(xOffset, yOffset, 0)
  //     //   ..scale(scaleFactor),
  //     // duration: Duration(milliseconds: 200),
  //     // decoration: BoxDecoration(
  //     //     color: Colors.white,
  //     //     borderRadius: BorderRadius.all(Radius.circular(isDrawerOpen?60:0))),
  //     // height: double.infinity,
  //     // width: double.infinity,
  //     child: ScaleTransition(
  //       scale: scaleAnimations[position],
  //       child: GestureDetector(
  //         onTap: (){
  //           if(isDrawerOpen){
  //             setState(() {
  //               isDrawerOpen=false;
  //               _animationController.reverse();
  //             });
  //           }
  //         },
  //         child:screenShots[position],
  //       ),
  //     ),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _animationController=AnimationController(vsync: this,duration: duration);
    // scaleAnimation=Tween<double>(begin: 1.0,end:0.7).animate(_animationController);
    // scaleAnimations=[
    // Tween<double>(begin: 1.0,end:0.7).animate(_animationController),
    // Tween<double>(begin: 1.0,end:0.7).animate(_animationController),
    // Tween<double>(begin: 1.0,end:0.5).animate(_animationController),
    // Tween<double>(begin: 1.0,end:0.5).animate(_animationController),
    // ];
    // //_animationController.forward();
    // screenShots=screens.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth=MediaQuery.of(context).size.width;
    //print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(widget.accessToken);
    final String dashboardiconiamg = "assets/icons/dashboard_icon.svg";
    final Widget dashboardicon = SvgPicture.asset(
      dashboardiconiamg,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final String appointmenticonimg = "assets/icons/appointment_icon.svg";
    final Widget appointmenticon = SvgPicture.asset(
      appointmenticonimg,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final String hospitaliconimag = "assets/icons/hospital_icon.svg";
    final Widget hospitalicon = SvgPicture.asset(
      hospitaliconimag,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final String myhealthiconimag = "assets/icons/myhealth_icon.svg";
    final Widget myhealthicon = SvgPicture.asset(
      myhealthiconimag,
      width: 10,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    List pages = <Widget>[
    // isDrawerOpen?Stack(children:finalStack(),):Stack(
    //       children:[
    //         widget.accessToken==null?DrawerScreen2():DrawerScreen(accessToken: widget.accessToken,),
    //     widget.accessToken == null ?
    // AnimatedPositioned(
    // duration: duration,
    // top: 0,
    // left:isDrawerOpen?deviceWidth*0.50:0,
    // right:isDrawerOpen?deviceWidth*-0.45:0,
    // bottom: 0,
    // // transform: Matrix4.translationValues(xOffset, yOffset, 0)
    // //   ..scale(scaleFactor),
    // // duration: Duration(milliseconds: 200),
    // // decoration: BoxDecoration(
    // //     color: Colors.white,
    // //     borderRadius: BorderRadius.all(Radius.circular(isDrawerOpen?60:0))),
    // // height: double.infinity,
    // // width: double.infinity,
    // child: ScaleTransition(
    // scale: scaleAnimation,
    // child: GestureDetector(
    //   onTap: (){
    //     if(isDrawerOpen){
    //       setState(() {
    //         isDrawerOpen=false;
    //         _animationController.reverse();
    //       });
    //     }
    //   },
    //   child: DashboardScreen(menuCallBack: (){
    //     setState(() {
    //       isDrawerOpen=true;
    //       _animationController.forward();
    //       print("Heeoollo");
    //     });
    //   },isDrawerOpen: isDrawerOpen,),
    // ),
    // ),
    // )
    //
    //      : AfterSignIn()
    //
    //
    //       ]),
      Stack(
          children: [
            widget.accessToken==null?DrawerScreen2():DrawerScreen(accessToken: widget.accessToken,),
            DashboardScreen(accessToken: widget.accessToken,) ]),
      widget.accessToken==null?SignInPrompt():GetAppointment(),
      HospitalScreen(),
      widget.accessToken==null?SignInForPP():PrescriptionListScreen(accessToken: widget.accessToken,),
    ];

    //BottomNavBar
    var bottomNavBar=BottomNavigationBar(
        onTap: (int index){
          if(currentIndex !=index)
            {
              _moveTo(index);
            }
        },
        currentIndex: currentIndex,
        selectedItemColor: HexColor('#8592E5'),
        unselectedItemColor: Colors.grey[800],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        items: [
      //dashboard
      BottomNavigationBarItem(icon: Material(
        color: Colors.transparent,
        child: dashboardicon,

      // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.dashboardNavBarText),
      )),
      //appointments
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon: Material(
        color: Colors.transparent,
        child: appointmenticon,

        // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.appointmentNavBarText),
      )),
      //hospitals
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon:  Material(
        color: Colors.transparent,
        child:hospitalicon,

        // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.hospitalNavBarText),
      )),
      //my_health
      // ignore: deprecated_member_use
      BottomNavigationBarItem(icon: Material(
        color: Colors.transparent,
        child: myhealthicon,

        // ignore: deprecated_member_use
      ),title: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Text(StringResources.myHealthNavBarText),
      ))
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor('#354291'),
        unselectedWidgetColor: HexColor('#8592E5'),
      ),
      home: WillPopScope(child: Scaffold(
         bottomNavigationBar: bottomNavBar,
        body: pages[currentIndex],
      ), onWillPop: null),
    );
  }
}
