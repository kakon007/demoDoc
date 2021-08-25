import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/upload_digital_signature.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

import 'change_password_prompt.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<PersonalInfoViewModel>(context, listen: false);
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var usernameHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Username',
            style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
          ),
        ],
      ),
    );
    var username = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF9F9F9),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              companyInfoVm.isLoading
                  ? ''
                  : companyInfoVm.details?.name ?? '',
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
      ),
    );
    var clickHere = Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child: Row(
        children: [
          Text(
            'Change Password:    ',
            style: GoogleFonts.roboto(fontSize: isTablet?14: 12),
          ),
          FlatButton(
              minWidth: MediaQuery.of(context).size.width * .2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: AppTheme.buttonActiveColor,
              onPressed: () {
                _showAlertDialogForPassword(context);
              },
              child: Text(
                StringResources.clickHere,
                style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600, fontSize: isTablet? 18 : 15),
              )),
        ],
      ),
    );
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0, top: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: HexColor("#FFFFFF"),
                boxShadow: [
                  BoxShadow(
                    color: HexColor("#0D1231").withOpacity(0.08),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(3, 1), // changes position of shadow
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceBetween,
                spaceBetween,
                spaceBetween,
                usernameHeading,
                //spaceBetween,
                username,
                spaceBetween,
                spaceBetween,
                clickHere,

              ],
            ),
          ),
          spaceBetween,
          // editButton
        ],
      ),
    );
  }
  void _showAlertDialogForPassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return ChangeDoctorPasswordAlert();
        });
  }
}
