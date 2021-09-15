import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/sign_out_prompt.dart';
import 'package:myhealthbd_app/features/user_profile/view/user_profile_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view/widgets/switch_account.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class UserDetailsPrompt extends StatefulWidget {
  @override
  _UserDetailsPromptState createState() => _UserDetailsPromptState();
}

class _UserDetailsPromptState extends State<UserDetailsPrompt> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {

    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context)
        .size
        .width;
    var titleSection =   Container(
      decoration: BoxDecoration(
          color: AppTheme.appbarPrimary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)
          )),
      height: 40,
      child: Padding(
        padding:  EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('User Details',style: GoogleFonts.poppins(color: Colors.white,),),
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },child: Icon(Icons.clear, color: Colors.white,size: 25,))
          ],
        ),
      ),

    );
    var detailsSection =      Padding(
      padding:  EdgeInsets.only(left: width<=330 ? 10 : 15, right: width<=330 ? 10 : 15, top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: width<=330 ? 80 : 100,
              width:width<=330 ? 80 : 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

                  border: Border.all(color: AppTheme.appbarPrimary,width: 1)),
              child: Image.asset('assets/images/doc.png')),
          Padding(
            padding:  EdgeInsets.only(left: width<=330 ? 10 : 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: width<=330 ? 11 : 14),),
                Text('MH22012014368',style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: width<=330 ? 11 : 14),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User Id:',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: width<=330 ? 11 : 14),),
                        Text('MH22012014368',style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: width<=330 ? 11 : 14),),
                      ],),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Job Title:',style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: width<=330 ? 11 : 14),),
                        Text('Sample Title',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: width<=330 ? 11 : 14),),
                      ],),
                  ],
                )

              ],),
          )

        ],),
    );
    var spaceBetween= SizedBox(height: 5,);
    var presentAddress = Column(children: [
      Center(child: Text('Present Address',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: width<=330 ? 12 :14),)),
      spaceBetween,
      Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Care of : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          // decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Post office : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Thana/Upzilla : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          // decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('District : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize:width<=330 ? 12 : 14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Division : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
    ],);

var permanentAddress = Column(children: [
      Center(child: Text('Present Address',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:width<=330 ? 12 : 14),)),
      spaceBetween,
      Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Care of : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          // decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Post office : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize:width<=330 ? 12 : 14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Thana/Upzilla : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          // decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('District : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
      Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(color: Color(0xffEFF5FF)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Division : ',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: width<=330 ? 12 :14),),
              ))
      ),
    ],);
    return SingleChildScrollView(
      child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  15,
                )),
            width: isTablet
                ? 420
                : width < 330
                ? 300
                : width*.9,
            constraints: BoxConstraints(
              minHeight: isTablet ? 165 : 130,
            ),
            height: 600.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleSection,
           detailsSection,
                Divider(height:20,thickness: 1.5,),
                 presentAddress,
                spaceBetween,
                spaceBetween,
                permanentAddress,
                spaceBetween
              ],
            ),
          )),
    );
  }
}
