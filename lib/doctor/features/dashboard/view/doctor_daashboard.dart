import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class DoctorDashboard extends StatefulWidget {
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: HexColor("#1DBF63"),),
        ),
      ],
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.notes, color: HexColor("#1DBF63"),),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
      drawer: Drawer(),
    body: Padding(
      padding: const EdgeInsets.only(top:10.0, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 120,
            width: 130,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/images/doc.png", fit: BoxFit.fill,)),),

            SizedBox(width: 15,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi",style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
              Text("Dr. Ziaul Haque",style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
            ],
            ),

        ],),
          SizedBox(height: 10,),
          Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: HexColor("#FFFFFF"),
                boxShadow: [
                  BoxShadow(
                    color: HexColor("#0D1231").withOpacity(0.08),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]),
          ),
      ],),
    ),
    );
  }
}
