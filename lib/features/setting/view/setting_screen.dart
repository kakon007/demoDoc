import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/sign_out_view_model.dart';
import 'package:myhealthbd_app/features/setting/view/wedgets/about_us_screen.dart';
import 'package:myhealthbd_app/features/setting/view/wedgets/change_password_screen.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/util/url_launcher_helper.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:myhealthbd_app/main_app/util/app_version.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  String accessToken;
  SettingScreen({this.accessToken});
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Future<void> signOut() async {
  //   var vm = Provider.of<SignOutViewModel>(context, listen: false);
  //   await vm.getSignOutData(widget.accessToken);
  //   if( vm.message=="User Revoke Successfull"){
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     await preferences.remove("accessToken");
  //     await preferences.remove("password");
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (BuildContext context) => HomeScreen()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String url1 = '${Urls.baseUrl}medicare-web-client-v2/#/myhealthbd/contact';
    String url2 = '${Urls.baseUrl}medicare-web-client-v2/#/myhealthbd/policy';
    String url3 = '${Urls.baseUrl}medicare-web-client-v2/#/myhealthbd/about';
    var vm = Provider.of<UserDetailsViewModel>(context);
    Obj userDetails = vm.userDetailsList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appbarPrimary,
        title: Text(
          'More',
          key: Key('moreAppbarKey'),
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GestureDetector(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen(accessToken: widget.accessToken,id: userDetails.hospitalNumber,)));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child:
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("Change Password",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
            //         Text('Choose a unique password',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(thickness: 1,),
            GestureDetector(
              onTap: () {
                if (url1 != null) {
                  if (url1.isNotEmpty) UrlLauncherHelper.launchUrl(url1);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Us",
                        style: GoogleFonts.poppins(
                            color: HexColor("#333132"), fontSize: 15, fontWeight: FontWeight.w600)),
                    Text(
                        'We are always happy to provide you any information \nregarding MyHealthBD',
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 11)),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                if (url2 != null) {
                  if (url2.isNotEmpty) UrlLauncherHelper.launchUrl(url2);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Privacy Policy",
                        style: GoogleFonts.poppins(
                            color: HexColor("#333132"), fontSize: 15, fontWeight: FontWeight.w600)),
                    Text('Read our Privacy Policy',
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 11)),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                if (url3 != null) {
                  if (url3.isNotEmpty) UrlLauncherHelper.launchUrl(url3);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About MyHealthBD",
                        style: GoogleFonts.poppins(
                            color: HexColor("#333132"), fontSize: 15, fontWeight: FontWeight.w600)),
                    Text('Want to know more?',
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 11)),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child:
            //   GestureDetector(
            //     onTap: (){
            //       showDialog(context: context,
            //           builder: (context) {
            //             return AlertDialog(
            //               title: Text("Sign Out"),
            //               content: Text(
            //                   "Do you really want to sign out?"),
            //               actions: <Widget>[
            //                 FlatButton(onPressed: () {
            //                   Provider.of<AccessTokenProvider>(context, listen: false).signOut();
            //                 }, child:
            //                 Text("Yes", style: TextStyle(color: Colors.red),)
            //                 ),
            //                 FlatButton(onPressed: () {
            //                   Navigator.of(context).pop(context);
            //                 }, child:
            //                 Text("No", style: TextStyle(color: Colors.green))
            //                 )
            //               ],
            //
            //
            //             );
            //           }
            //       );
            //     },
            //     child: Row(
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text("Sign out",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
            //             Text('Sign out from app',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
            //           ],
            //         ),
            //         Spacer(),
            //         Icon(Icons.logout),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppVersionWidgetSmallForSettings(),
                  //Text("Version 1.0.12",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600)),
                  // Text('Choose a unique password',style: GoogleFonts.poppins(color: HexColor("#D2D2D2"),fontSize: 11)),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
