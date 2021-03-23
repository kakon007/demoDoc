import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class  HospitalListCard extends StatelessWidget {
  final String image;
  final String hospitalTitle;
  final String hospitalLocation;
  final String onlineDoctors;
  final String buttonName;
  HospitalListCard({ this.image, this.buttonName, this.onlineDoctors, this.hospitalLocation, this.hospitalTitle});
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var height = MediaQuery.of(context).size.height;
    var cardWidth = MediaQuery.of(context).size.width * 0.3435;
    return Container(
            height: cardHeight * 1.2,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: HexColor("#D6DCFF"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: height <= 600
                          ? cardHeight * 0.09
                          : cardHeight * 0.1,
                    ),
                    Column(
                      children: [
                        Container(
                            width: cardWidth * 0.9,
                            height: cardHeight,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: height <= 600
                          ? cardHeight * 0.06
                          : cardHeight * 0.08,
                    ),
                    Container(
                      width: cardWidth * 1.58,
                      height: cardHeight * 1.13,
                      decoration: BoxDecoration(
                        color: HexColor("#FFFFFF"),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.0,
                            right: 10,
                            top: height <= 600 ? 6 : 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hospitalTitle,
                              style: GoogleFonts.poppins(
                                  fontSize: height <= 600 ? 12 : 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              hospitalLocation,
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: height <= 600 ? 9 : 12,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: HexColor("#1EE573"),
                                  size: height <= 600 ? 10 : 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  onlineDoctors,
                                  style: GoogleFonts.poppins(
                                    fontSize: height <= 600 ? 9 : 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height <= 600
                                  ? cardHeight / 15
                                  : cardHeight / 9,
                            ),
                            Container(
                              width: height <= 600
                                  ? cardWidth * 1.2
                                  : cardWidth * 1.3,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: AppTheme.appbarPrimary,
                                onPressed: () {},
                                textColor: Colors.white,
                                child: Text(
                                  buttonName,
                                  style: GoogleFonts.poppins(
                                      fontSize: height <= 600 ? 8 : 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
