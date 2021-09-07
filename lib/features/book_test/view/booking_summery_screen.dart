import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class BookingSummeryScreen extends StatefulWidget {
  @override
  _BookingSummeryScreenState createState() => _BookingSummeryScreenState();
}

class _BookingSummeryScreenState extends State<BookingSummeryScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff354291),
          title: Text(
            'Booking Summery',
            key: Key('emrAppbarKey'),
            style: GoogleFonts.poppins(
                fontSize: isTablet ? 20 : 16, fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 10),
              child: Text(
                'Delete All',
                //key: Key('emrAppbarKey'),
                style: GoogleFonts.poppins(
                    fontSize: isTablet ? 20 : 13, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'Items  (8)',
                      key: Key('emrAppbarKey'),
                      style: GoogleFonts.poppins(
                          fontSize: isTablet ? 20 : 16, color: Color(0xff354291)),
                    ),
                    Text(
                      'Price  (8)',
                      key: Key('emrAppbarKey'),
                      style: GoogleFonts.poppins(
                          fontSize: isTablet ? 20 : 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
