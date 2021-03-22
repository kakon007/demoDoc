import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/constant.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:100.0,left: 150),
        child: Container(
          child: RaisedButton(
            color:  HexColor("#354291"),
            child: Text('Prompt',style: TextStyle(color: Colors.white),),
            onPressed: (){
              showGeneralDialog(
                barrierLabel: "Label",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 700),
                context: context,
                pageBuilder: (context, anim1, anim2) {
                  return Stack(
                    children:[
                       Align(
                        alignment: Alignment.bottomCenter,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Container(
                            height: 200,
                           // child: SizedBox.expand(child: FlutterLogo()),
                            //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                            decoration: BoxDecoration(
                              //color: HexColor('#f9f2f3'),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  HexColor('#fdf0f2'),
                                  HexColor('#FFFFFF')
                                ],
                                tileMode: TileMode.repeated,
                              ),
                              borderRadius: radius,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:70.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text("To access your Patient portal,",style:TextStyle(fontSize: 18,color: Colors.black)),
                                    SizedBox(height: 5,),
                                    Text("Sign In required.",style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500)),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:40.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              Navigator.pop(context);
                                            },
                                            child: Material(
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color:HexColor('#354291') )),
                                              color: Colors.white,
                                              child: SizedBox(
                                                height: 50,
                                                width: 150,
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(color: HexColor('#354291'),fontWeight: FontWeight.w500,fontSize: 15),
                                                      ),

                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          Material(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            color: HexColor('#354291'),
                                            child: SizedBox(
                                              height: 50,
                                              width: 150,
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                   "Continue",
                                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: MediaQuery.of(context).size.height/1.5,
                        left:100,
                        right:100,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: Constants.avatarRadius,
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                              child: Image.asset("assets/icons/sign_in_prompt.png")
                          ),
                        ),
                      ),
                  ],
                  );
                },
                transitionBuilder: (context, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 2), end: Offset(0, 0)).animate(anim1),
                    child: child,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
