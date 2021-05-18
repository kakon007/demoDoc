import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/switch_account.dart';
import 'package:myhealthbd_app/features/user_profile/view/user_profile_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class ManageAccountPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<UserDetailsViewModel>(context, listen: true);
    var vm2 = Provider.of<AccessTokenProvider>(context, listen: true);
    return Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20,
              )),
          width: 320.0,
          height: 300.0,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                        BorderSide(width: 0.5, color: Colors.grey),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 4,
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 15.0, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Accounts",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: AppTheme.appbarPrimary,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.clear)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                color: AppTheme.appbarPrimary,
                                  shape: BoxShape.circle,
                                ),
                                  height: 60,
                                  width: 60,
                                  child: Center(child: Image.asset('assets/images/dPro.png',height:35,width: 35,),)),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vm.userDetailsList?.fname ?? '',
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.appbarPrimary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    vm.userDetailsList?.address ?? '',
                                    style: GoogleFonts.poppins(
                                        color: HexColor("#8592E5"),
                                        fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile(fName: vm.userDetailsList.patientName,phoneNumber: vm.userDetailsList.phoneMobile,address: vm.userDetailsList.address,dob:  vm.userDetailsList.dob,id: vm.userDetailsList.hospitalNumber ,accessToken: vm2.accessToken,)));
                                    },
                                    child: Container(
                                      width: 160,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppTheme.appbarPrimary),
                                        borderRadius:
                                        BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                          child: Text(
                                            "Manage Your Profile",
                                            style: GoogleFonts.poppins(
                                                color: AppTheme.appbarPrimary,
                                                fontSize: 12),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 15.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SwitchAccount();
                            }));
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                      'assets/images/switch.png')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Switch to another account",
                                style: GoogleFonts.poppins(
                                    color: AppTheme.appbarPrimary,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SwitchAccount();
                            }));
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                      'assets/images/add_account.png')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add another account",
                                style: GoogleFonts.poppins(
                                    color: AppTheme.appbarPrimary,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: (){
                    showDialog(context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Sign Out"),
                            content: Text(
                                "Do you really want to sign out?"),
                            actions: <Widget>[
                              FlatButton(onPressed: () {
                                Provider.of<AccessTokenProvider>(context, listen: false).signOut();
                              }, child:
                              Text("Yes", style: TextStyle(color: Colors.red),)
                              ),
                              FlatButton(onPressed: () {
                                Navigator.of(context).pop(context);
                              }, child:
                              Text("No", style: TextStyle(color: Colors.green))
                              )
                            ],


                          );
                        }
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.125,
                    decoration: BoxDecoration(
                      color: AppTheme.appbarPrimary,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Out",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
