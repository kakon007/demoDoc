import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view.dart';
import 'package:myhealthbd_app/main_app/views/widgets/search_bar_viw_widget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          this._backgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              title: new Text(
                StringResources.dasboardAppBarText,
                style: TextStyle(fontSize: 17),
              ),
              actions: [
                Row(
                  children: [
                    Text(StringResources.dasboardAppBarSignInText),
                    Icon(Icons.login)
                  ],
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
                        padding: const EdgeInsets.all(20.0),
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
                            )),
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
      height: 350.0,
      width: MediaQuery.of(context).size.width,
      child: FadeInImage(
        fit: BoxFit.cover,
        image:AssetImage("assets/images/dashboard_back.png"),
        placeholder: AssetImage('assetName'),
      ),
    );
  }

}
