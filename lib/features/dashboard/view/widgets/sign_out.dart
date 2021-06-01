import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              Container(
                height: 300,
                width: 355,
                //color: Colors.red,
                child: Center(
                  child: Padding(
                    padding:EdgeInsets.only(bottom: 0, left: 20, right: 20),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        //color: HexColor('#f9f2f3'),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [HexColor('#fdf0f2'), HexColor('#FFFFFF')],
                            tileMode: TileMode.repeated,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Do you really want to sign out?",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              ],),
                            SizedBox(
                              height: 30,
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
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: HexColor('#354291'))),
                                    color: Colors.white,
                                    child: SizedBox(
                                      height: 50,
                                      width: 120,
                                      child: Center(
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                              color: HexColor('#354291'),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                              Provider.of<AccessTokenProvider>(context,
                                                      listen: false)
                                                  .signOut();
                                  },
                                  child: Material(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    color: HexColor('#354291'),
                                    child: SizedBox(
                                      height: 50,
                                      width: 120,
                                      child: Center(
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
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
                bottom: 175,
                //top: MediaQuery.of(context).size.height / 1.8,
                left: 100,
                right: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: Constants.avatarRadius,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(Constants.avatarRadius)),
                      child: Image.asset("assets/images/warning.png", height: 90,width: 90,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
