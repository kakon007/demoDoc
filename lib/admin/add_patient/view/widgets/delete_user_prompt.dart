import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class DeleteUserPrompt extends StatefulWidget {
  bool isResetPassword;
  DeleteUserPrompt({this.isResetPassword});

  @override
  _DeleteUserPromptState createState() => _DeleteUserPromptState();
}

class _DeleteUserPromptState extends State<DeleteUserPrompt> {
  @override
  Widget build(BuildContext context)
  {
    var spaceBetween = SizedBox(
      height: 10,
    );
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width;
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              Container(
                height: width<=330? 320 : 300,
                width:
                MediaQuery.of(context)
                    .size
                    .width,
                //color: Colors.red,
                child: Center(
                  child: Padding(
                    padding:
                    EdgeInsets.only(
                        bottom: 0,
                        left: 20,
                        right: 20),
                    child: Container(
                      height: width<=330? 160 : 180,
                      width: isTablet
                          ? 450
                          : 350,
                      decoration:
                      BoxDecoration(
                        //color: HexColor('#f9f2f3'),
                          gradient:
                          LinearGradient(
                            begin: Alignment
                                .topCenter,
                            end: Alignment
                                .bottomCenter,
                            colors: [
                              Color(
                                  0xfffdf0f2),
                              Color(
                                  0xffFFFFFF)
                            ],
                            tileMode:
                            TileMode
                                .repeated,
                          ),
                          borderRadius:
                          BorderRadius
                              .circular(
                              25)),
                      child: Padding(
                        padding:
                        const EdgeInsets
                            .only(
                            top: 50.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets
                                  .only(
                                  left:
                                  10.0,
                                  right:
                                  10),
                              child:
                              RichText(
                                textAlign:
                                TextAlign
                                    .center,
                                text:
                                TextSpan(
                                  style: GoogleFonts
                                      .poppins(
                                    fontSize: isTablet
                                        ? 18
                                        : width<=330? 14 : 16.0,
                                    color: Colors
                                        .black,
                                  ),
                                  children: <
                                      TextSpan>[
                                    TextSpan(
                                        text:
                                        widget.isResetPassword?'Do you really want to reset password?' :'Do you really want to delete the user?'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                              isTablet
                                  ? 25
                                  : 15,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .center,
                              children: [
                                GestureDetector(
                                  onTap:
                                      () {
                                    Navigator.pop(
                                        context);
                                  },
                                  child:
                                  Material(
                                    elevation:
                                    0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        side: BorderSide(color: Color(0xff354291))),
                                    color: Colors
                                        .white,
                                    child:
                                    SizedBox(
                                      height:
                                      width<=330? 40:50,
                                      width: isTablet
                                          ? 170
                                          : 120,
                                      child:
                                      Center(
                                        child:
                                        Text(
                                          "No",
                                          style: GoogleFonts.poppins(color: Color(0xff354291), fontWeight: FontWeight.w500, fontSize: isTablet ? 18 :width<=330? 13 : 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap:
                                      () async {},
                                  child:
                                  Material(
                                    elevation:
                                    0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    color: Color(
                                        0xff354291),
                                    child:
                                    SizedBox(
                                      height:
                                      width<=330? 40:50,
                                      width: isTablet
                                          ? 170
                                          : 120,
                                      child:
                                      Center(
                                        child:
                                        Text(
                                          "Yes",
                                          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isTablet ? 18 :width<=330? 13 : 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 210,
                //top: MediaQuery.of(context).size.height / 1.8,
                left: 100,
                right: 100,
                child: CircleAvatar(
                  backgroundColor:
                  Colors.white,
                  radius: 30,
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.all(
                        Radius.circular(
                            60)),
                    // child: Image.asset(
                    //   "assets/icons/sign_in_prompt.png",
                    //   height: 90,
                    //   width: 90,
                    // ),
                    child: Icon(
                      widget.isResetPassword? Icons.refresh : Icons
                          .delete_sweep,
                      color:
                      Color(0xffFF8585),
                      size: 30,
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
