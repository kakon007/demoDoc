import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/book_test/view/book_test_screen.dart';
import 'package:myhealthbd_app/features/book_test/view/booking_summery_screen.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class GetDiscountButton extends StatefulWidget {
  @override
  _GetDiscountButtonState createState() => _GetDiscountButtonState();
}

class _GetDiscountButtonState extends State<GetDiscountButton> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: isTablet ? 0 : 10),
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex:1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(
                      bottomLeft:
                      Radius.circular(14),
                    topLeft: Radius.circular(14),
                    ),
                    //color: Colors.teal,
                    color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 90,
                child:  Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get",
                        style:
                        GoogleFonts.poppins(
                            fontWeight:
                            FontWeight
                                .bold,
                            color: Color(0xff354291),
                            fontSize: 18),
                      ),
                      Text(
                        "Discount",
                        style:
                        GoogleFonts.poppins(
                            fontWeight:
                            FontWeight
                                .bold,
                            color: Color(0xff354291),
                            fontSize: 18),
                      ),
                      Text(
                        "on Test Booking",
                        style:
                        GoogleFonts.poppins(
                            fontWeight:
                            FontWeight
                                .w500,
                            color: Color(0xffFFB14A),
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>BookTestScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(
                      bottomRight:
                      Radius.circular(14),
                      topRight:
                      Radius.circular(14),
                    ),
                    //color: Colors.teal,
                    color: Color(0xff354291)
                ),
                height:90,
                width:150,
                child: Padding(
                  padding: const EdgeInsets.only(left:30.0,top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Book Your",
                        style:
                        GoogleFonts.poppins(
                            fontWeight:
                            FontWeight
                                .w500,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                      Row(
                        children: [
                          Text(
                            "Test Now",
                            style:
                            GoogleFonts.poppins(
                                fontWeight:
                                FontWeight
                                    .w500,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward,color: Colors.white,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
