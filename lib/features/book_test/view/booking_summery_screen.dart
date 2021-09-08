import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(12.0),
                    bottomRight: const Radius.circular(12.0),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Items  (8)',
                        style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20 : 15,fontWeight: FontWeight.w600, color: Color(0xff354291)),
                      ),
                      Text(
                        'Price  (8)',
                        style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20 : 15, fontWeight: FontWeight.w600, color: Color(0xff354291)),
                      ),
                    ],
                  ),
                ),
              ),
             SizedBox(
               height: 10,
             ),
              Container(
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder:
                          (BuildContext context,
                          int index) {
                        return Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 10.0,
                              right: 10),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:260,
                                  child: Text(
                                    'O Cell (PRBC) Suspended in AB Plasma',
                                    style: GoogleFonts.poppins(
                                        fontSize: isTablet ? 20 : 14, color: Colors.black),
                                    maxLines: 2,overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Text(
                                  '12,000.00',
                                  style: GoogleFonts.poppins(
                                      fontSize: isTablet ? 20 : 15, color: Colors.black),
                                ),
                                Icon(Icons.delete_sweep,
                                    size: isTablet ? 27 : 20,
                                    color:Color(0xffFFA7A7)),
                              ],
                            )
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) {
                        return Divider(thickness: 2,);
                      }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:  BorderRadius.only(
                      bottomLeft:  Radius.circular(12.0),
                      bottomRight:  Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                      border: Border.all(color: Colors.grey.withOpacity(0.2))
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14, color: Colors.black),
                            ),
                            Text(
                              '31,210.00 Tk',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14, color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14, color: Color(0xff037BB7)),
                            ),
                            Text(
                              '1,526.00 Tk',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14, color: Color(0xff037BB7)),
                            ),
                          ],
                        ),
                        Divider(thickness: 1.5,color: Colors.black,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14, color: Colors.black),
                            ),
                            Text(
                              '29,684.00 Tk',
                              style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 20 : 14, color: Colors.black),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Material(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: HexColor("#354291"),
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width > 600
                      //     ? 335
                      //     : 300,
                      height: MediaQuery.of(context).size.width > 600
                          ? 35
                          : 45,
                      child: Center(
                        child: Text(
                          "Confirm Booking",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
