import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
class ShareDocument extends StatefulWidget {
  @override
  _ShareDocumentState createState() => _ShareDocumentState();
}

class _ShareDocumentState extends State<ShareDocument> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.44;
    var height = MediaQuery.of(context).size.height;
    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );
    var shareTitle = Padding(
      padding: EdgeInsets.only(left: width / 6.912, right: width / 6.912),
      child: Column(
        children: [
          horizontalSpace,
          horizontalSpace,
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpace,
                Text(
                  "Share",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.clear)),
                //horizontalSpace,
              ],
            ),
          ),
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * .38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                shareTitle,
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type your hospital name",
                            style: GoogleFonts.poppins(),
                          ),
                          horizontalSpace,
                          Container(
                            width: width * 1.2,
                            height: width * .32,
                            child: TextFormField(
                              controller: _username,
                              decoration: InputDecoration(
                                focusedBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      HexColor("#D6DCFF"),
                                      width: 1.0),
                                  borderRadius:
                                  BorderRadius.circular(
                                      25),
                                ),
                                // contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      HexColor("#EAEBED"),
                                      width: 1.0),
                                  borderRadius:
                                  BorderRadius.circular(
                                      25),
                                ),
                                prefixIcon: Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 18.0),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color:
                                    HexColor("#C7C8CF"),
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      right: 18.0),
                                  child: Icon(
                                    Icons
                                        .keyboard_arrow_down_rounded,
                                    color:
                                    HexColor("#C7C8CF"),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace,
                          Text(
                            "Type your Doctor name",
                            style: GoogleFonts.poppins(),
                          ),
                          horizontalSpace,
                          Container(
                            width: width * 1.2,
                            height: width * .32,
                            child: TextFormField(
                              controller: _password,
                              decoration: InputDecoration(
                                focusedBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      HexColor("#D6DCFF"),
                                      width: 1.0),
                                  borderRadius:
                                  BorderRadius.circular(
                                      25),
                                ),
                                // contentPadding: EdgeInsets.fromLTRB(15.0, 25.0, 40.0, 0.0),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      HexColor("#EAEBED"),
                                      width: 1.0),
                                  borderRadius:
                                  BorderRadius.circular(
                                      25),
                                ),
                                prefixIcon: Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 18.0),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: AppTheme
                                        .appbarPrimary,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      right: 18.0),
                                  child: Icon(
                                    Icons
                                        .keyboard_arrow_down_rounded,
                                    color: AppTheme
                                        .appbarPrimary,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace,
                        ],
                      ),
                      verticalSpace,
                      verticalSpace,
                      _username.text != "" ||
                          _password.text != ""
                          ? Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: HexColor(
                                      "#E9ECFE")),
                              borderRadius:
                              BorderRadius.circular(
                                  15),
                              color: HexColor("#FFFFFF"),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor(
                                      "#0D1231")
                                      .withOpacity(0.08),
                                  spreadRadius: 2,
                                  blurRadius: 20,
                                  offset: Offset(0,
                                      1), // changes position of shadow
                                ),
                              ]),
                          height: 160.0,
                          width: MediaQuery.of(context)
                              .size
                              .width *
                              .32,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/images/doc.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Md. Sohel Rana",
                                style:
                                GoogleFonts.poppins(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    fontSize: 12),
                              ),
                              Text("Assistant Professor",
                                  style:
                                  GoogleFonts.poppins(
                                      fontSize: 12)),
                              Text(
                                "CARDIOLOGIST",
                                style: GoogleFonts.poppins(
                                    height: 1.5,
                                    color: AppTheme
                                        .appbarPrimary,
                                    fontWeight:
                                    FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ],
                          ))
                          : DashedContainer(
                        dashColor: HexColor("#E9ECFE"),
                        borderRadius: 10.0,
                        dashedLength: 10.0,
                        blankLength: 2.0,
                        child: Container(
                          height: 140.0,
                          width: MediaQuery.of(context)
                              .size
                              .width *
                              .32,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20),
                  child: AbsorbPointer(
                    absorbing: _username.text == "" ||
                        _password.text == ""
                        ? true
                        : false,
                    child: SizedBox(
                      width:
                      MediaQuery.of(context).size.width,
                      height: width * .25,
                      child: FlatButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        color: _username.text == "" &&
                            _password.text == ""
                            ? HexColor("#969EC8")
                            : AppTheme.appbarPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Share",
                          style: GoogleFonts.poppins(
                              fontWeight:
                              _username.text == "" &&
                                  _password.text == ""
                                  ? FontWeight.normal
                                  : FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shared with",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 70,
                        width:
                        MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/doc.png"),
                                radius: 15.0,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Container(
                                height: 50,
                                width: 170,
                                child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                            "Dr. Zia Udiin Arman",
                                            style: GoogleFonts
                                                .poppins(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight
                                                    .w500)),
                                        Text(
                                            "Lab Science Diagnostic 02",
                                            style: GoogleFonts
                                                .poppins(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight
                                                    .w500))
                                      ],
                                    ))),
                            Container(
                              decoration: BoxDecoration(
                                color: HexColor("#FFA7A7"),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 40,
                              width: 120,
                              child: Center(
                                child: Text(
                                  "Remove Access",
                                  style:
                                  GoogleFonts.poppins(
                                      fontSize: 11),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        width:
                        MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/doc.png"),
                                radius: 15.0,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Container(
                                height: 50,
                                width: 170,
                                child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                            "Dr. Zia Udiin Arman",
                                            style: GoogleFonts
                                                .poppins(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight
                                                    .w500)),
                                        Text(
                                            "Lab Science Diagnostic 02",
                                            style: GoogleFonts
                                                .poppins(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight
                                                    .w500))
                                      ],
                                    ))),
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor("#FFA7A7"),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 40,
                                width: 120,
                                child: Center(
                                  child: Text(
                                    "Remove Access",
                                    style:
                                    GoogleFonts.poppins(
                                        fontSize: 11),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
