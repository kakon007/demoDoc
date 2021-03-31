import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
                  Text(
                    "Jahid Hasan Kakon",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0,),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Dashboard",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    // Icon(
                    //   Icons.pending,
                    //   color: Colors.black,
                    // ),

                    Text(
                      "Find Your Doctor",
                      style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Appointments",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Prescriptions",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Reports",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Documents",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Messages",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Notifications",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Settings",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Family Members",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Switch Account",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Sign Out",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
