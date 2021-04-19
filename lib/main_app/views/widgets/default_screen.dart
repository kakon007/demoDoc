import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text('Default Screen',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
      ),
      body: Center(
        child: Container(
          child: Center(
            child: Text("Screen is not available yet"),
          ),
        ),
      ),
    );
  }
}
