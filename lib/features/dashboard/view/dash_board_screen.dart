import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/sign_in_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_pat.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/search_bar_viw_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final String assetName1 = "assets/icons/sign_in.svg";
    final Widget svg = SvgPicture.asset(
        assetName1,
      width: 10,
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
                Text("20 Health tips",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("to help you start off towards \nhealthy living in 2021",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
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
                        Text("Read More",style: TextStyle(color: Colors.white,fontSize: 10),),
                        Spacer(),
                        Icon(Icons.arrow_forward,size: 15,color: Colors.white,)
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
                style: TextStyle(fontSize: 17),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                    },
                    child: Row(
                      children: [
                        Text(StringResources.dasboardAppBarSignInText,style: TextStyle(fontWeight: FontWeight.w500),),
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
            drawer: Drawer(),
            body: Padding(
              padding: const EdgeInsets.only(top:150.0),
              child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                  color: Colors.white
                ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(StringResources.esayDoctorAppointmentText,style: TextStyle(fontSize: 17
                                    ,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Container(
                                    width: 100,

                                    child: Image.asset("assets/images/my_health_logo.png")),

                              ],
                            ),
                            SizedBox(height: 10,),
                            SearchBarViewWidget(),
                            //SizedBox(height: 10,),
                            // CustomCardPat("You have an upcoming appointment","22-02-2021 Monday 08:30pm \nSerial-12","Dr. Jahid Hasan","Alok hospital"),
                            // SizedBox(height: 10,),
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Text(StringResources.hospitalDiagnosticsText,style: TextStyle(fontSize: 17
                                    ,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text(StringResources.viewAllText,style: TextStyle(color:HexColor("#8592E5") ),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                              children: [
                                CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                SizedBox(width:20),
                                CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                SizedBox(width:20),
                                CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                              ],
                            )
                            ),
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Text("News & Update",style: TextStyle(fontSize: 17
                                    ,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text(StringResources.viewAllText,style: TextStyle(color:HexColor("#8592E5") ),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                    SizedBox(width:20),
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                    SizedBox(width:20),
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                  ],
                                )
                            ),
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Text("My Health Video",style: TextStyle(fontSize: 17
                                    ,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text(StringResources.viewAllText,style: TextStyle(color:HexColor("#8592E5") ),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                    SizedBox(width:20),
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                    SizedBox(width:20),
                                    CustomCard("Proyas Health Care","Mirpur,Dahaka,Bangladesh","60 Doctors"),
                                  ],
                                )
                            ),
                          ],
                        ),
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
      height: 370.0,
      width: MediaQuery.of(context).size.width,
      child: FadeInImage(
        fit: BoxFit.cover,
        image:AssetImage("assets/images/dashboard_back.png"),
        placeholder: AssetImage(''),
      ),
    );
  }

}
