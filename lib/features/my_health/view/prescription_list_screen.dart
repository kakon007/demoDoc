import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/prscription_screen.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';

class PrescriptionListScreen extends StatefulWidget {
  @override
  _PrescriptionListScreenState createState() => _PrescriptionListScreenState();
}

class _PrescriptionListScreenState extends State<PrescriptionListScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#354291'),
          title: Text('Patient Portal',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
          actions: <Widget>[
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
        drawer: Drawer(),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: HexColor('#E9ECFE'),
                  child: TabBar(
                    indicatorColor: HexColor('#8592E5'),
                    indicatorWeight:4,
                    tabs: [
                       Container(
                        height: 40,
                        //width: 10.0,
                        child:Center(child: Text('Prescriptions',style: GoogleFonts.roboto(color: HexColor('#354291',),fontWeight: FontWeight.w500),)),
                      ),
                       Container(
                        height: 40,
                        child: Center(child: Text('Reports',style: GoogleFonts.poppins(color: HexColor('#354291'),fontWeight: FontWeight.w500),)),
                      ),
                       Container(
                        height: 40,
                        //width: 30.0,
                        child:Center(child: Text('Documents',style: GoogleFonts.poppins(color: HexColor('#354291'),fontWeight: FontWeight.w500),)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PrescriptionScreen(),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  }
}
