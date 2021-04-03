import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int selectedMenuIndex=0;

  List<String> menuItem=[
    "Dashboard",
    "Find Your Doctor",
    "Appointments",
    "Prescriptions",
    "Reports",
    "Documents",
    "Messages",
    "Notifications",
    "Settings",
    "Family Members",
    "Switch Account",
    "Sign Out",
  ];


  Widget buildMenuRow(int index){
    return InkWell(
      onTap: (){
        setState(() {
          selectedMenuIndex=index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,),
        child: Column(
          children: [
        Row(
        children: [
          selectedMenuIndex==index?
              Container(width: 115,height:40,decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: HexColor("#FFFFFF"),),child:Padding(
              padding: const EdgeInsets.only(top:8.0,left: 6),
              child: Text(
                menuItem[index],
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                    color: HexColor('#354291')),
              ),
            ),):
        Text(
          menuItem[index],
          style: GoogleFonts.poppins(
              fontSize: 18,
              //fontWeight: FontWeight.bold,
              color:Colors.white),
        ),
        ],
      ),
      SizedBox(
      height: 20,
      ),
      ]
      ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60,bottom: 20),
      color: HexColor('#141D53'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/proimg.png'),
                    radius: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Jahid Hasan Kakon",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(width: 80,),
                      Icon(Icons.close,color: Colors.white,size: 18,)
                    ],
                  ),
                  Text("Mirpur,Dhaka", style: GoogleFonts.poppins(color: HexColor('#B8C2F8'),fontSize: 12)),
                  SizedBox(height: 5,),
                  Container(
                    width: 120,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#8592E5')),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(child: Text("Update My Profile",style:  GoogleFonts.poppins(color: HexColor('#B8C2F8'),fontSize: 8),)),
                  )
                ],
              )
            ],
          ),
          Column(
            children: menuItem.asMap().entries.map((mapEntry) => buildMenuRow(mapEntry.key)).toList(),
          ),

        ],
      ),
    );
  }
}
