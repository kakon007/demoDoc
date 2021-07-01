import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
class NoAvailableSlots extends StatefulWidget {
  @override
  _NoAvailableSlotsState createState() => _NoAvailableSlotsState();
}

class _NoAvailableSlotsState extends State<NoAvailableSlots> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    return  Center(child: Text("Please select another date to get an available slot!!",maxLines: 2,textAlign: TextAlign.center ,style: GoogleFonts.poppins(fontSize: isTablet? 18 : 15)));

  }
}
