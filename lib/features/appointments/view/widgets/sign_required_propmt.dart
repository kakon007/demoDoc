import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

import '../../../constant.dart';

class SignInRequired extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [HexColor('#fdf0f2'), HexColor('#FFFFFF')],
                      tileMode: TileMode.repeated,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 24 : 16.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "To Book an Appointment "),
                              TextSpan(
                                  text: "Sign In Required.",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600)),
                              //TextSpan(text: " from your family member list?", style: GoogleFonts.poppins()),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Material(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: HexColor('#354291'))),
                              color: Colors.white,
                              child: SizedBox(
                                height: 50,
                                width: isTablet
                                    ? MediaQuery.of(context).size.width * .3
                                    : 150,
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: HexColor('#354291'),
                                        fontWeight: FontWeight.w500,
                                        fontSize: isTablet ? 20 : 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: isTablet ? 50 : 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = Offset(0, 1.0);
                                      var end = Offset.zero;
                                      var curve = Curves.easeInOut;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        SignIn(isBook: true),
                                  ));
                            },
                            child: Material(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: HexColor('#354291'),
                              child: SizedBox(
                                height: 50,
                                width: isTablet
                                    ? MediaQuery.of(context).size.width * .3
                                    : 150,
                                child: Center(
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isTablet ? 20 : 15),
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
          Positioned(
            bottom: 120,
            //top: MediaQuery.of(context).size.height / 1.8,
            left: 100,
            right: 100,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                  child: Image.asset(
                    "assets/icons/sign_in_prompt.png",
                    height: isTablet ? 120 : 90,
                    width: isTablet ? 120 : 90,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
