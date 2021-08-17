import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/upload_digital_signature.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/doctor_profile_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
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
    var vm = Provider.of<DoctorProfileViewModel>(context, listen: false);
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
    var doctorName = vm.isDoctorInfoEditing
        ? Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
        minimizeBottomPadding: true,
        hintText: 'Enter Your Name',
      ),
    )
        : Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            border: Border.all(color: HexColor('#AFBBFF'))
          // boxShadow: [
          //   BoxShadow(
          //     color: HexColor("#0D1231").withOpacity(0.08),
          //     spreadRadius: 2,
          //     blurRadius: 2,
          //     offset: Offset(0, 1), // changes position of shadow
          //   ),
          // ]
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Assoc. Dr. Mahmud Rahim',
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
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
          //border: Border.all(color: HexColor('#AFBBFF'))
          // boxShadow: [
          //   BoxShadow(
          //     color: HexColor("#0D1231").withOpacity(0.08),
          //     spreadRadius: 2,
          //     blurRadius: 2,
          //     offset: Offset(0, 1), // changes position of shadow
          //   ),
          // ]
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'AHC_RAHIM',
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
    var bmdcNoHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Row(
          children: [
            Text(
              'BMDC No',
              style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
            ),
            Text(
              vm.isDoctorInfoEditing ? '*' : "",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
            ),
          ],
        ));
    var bmdcNo = vm.isDoctorInfoEditing
        ? Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
        minimizeBottomPadding: true,
        hintText: 'Enter BMDC No',
      ),
    )
        : Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            border: Border.all(color: HexColor('#AFBBFF'))
          // boxShadow: [
          //   BoxShadow(
          //     color: HexColor("#0D1231").withOpacity(0.08),
          //     spreadRadius: 2,
          //     blurRadius: 2,
          //     offset: Offset(0, 1), // changes position of shadow
          //   ),
          // ]
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'A 187',
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
      ),
    );
    var degreeHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Row(
          children: [
            Text(
              'Degree',
              style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
            ),
            Text(
              vm.isDoctorInfoEditing ? '*' : "",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
            ),
          ],
        ));
    var degree = vm.isDoctorInfoEditing
        ? Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
        minimizeBottomPadding: true,
        hintText: 'Enter Degree',
      ),
    )
        : Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            border: Border.all(color: HexColor('#AFBBFF'))
          // boxShadow: [
          //   BoxShadow(
          //     color: HexColor("#0D1231").withOpacity(0.08),
          //     spreadRadius: 2,
          //     blurRadius: 2,
          //     offset: Offset(0, 1), // changes position of shadow
          //   ),
          // ]
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'BCS(Health), MD(Chest)',
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
      ),
    );
    var addMoreButton = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: SizedBox(
        child: FlatButton(
            minWidth: MediaQuery.of(context).size.width * .1,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                //SizedBox(width: 10,),
                Text(
                  'Add More',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: isTablet ? 18 : 15),
                ),
              ],
            )),
      ),
    );
    var doctorSignatureHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Row(
          children: [
            Text(
              "Doctor's signature",
              style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
            ),
            Text(
              vm.isDoctorInfoEditing ? '*' : "",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
            ),
          ],
        ));
    var doctorSignature = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        constraints: BoxConstraints(minHeight: 100),
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            border: Border.all(color: HexColor('#AFBBFF'))
          // boxShadow: [
          //   BoxShadow(
          //     color: HexColor("#0D1231").withOpacity(0.08),
          //     spreadRadius: 2,
          //     blurRadius: 2,
          //     offset: Offset(0, 1), // changes position of shadow
          //   ),
          // ]
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assoc. Dr. Mahmud Rahim',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  'MBBS(Dhaka)',
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  'BCS(Health), MD(Chest)',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    var digitalSignatureHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Text(
          "Digital signature",
          style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
        ));
    var digitalSignature = Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DashedContainer(
            dashColor: HexColor("#E9ECFE"),
            borderRadius: 10.0,
            dashedLength: 10.0,
            blankLength: 2.0,
            child: Container(
              //  constraints: BoxConstraints(maxHeight: 200.0,),
              height: 120.0,
              width: width * .6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  uploadImageIcon,
                  height: 60,
                  width: 60,
                  fit: BoxFit.fitHeight,
                ),
              ),
              // child: Icon(Icons.insert_photo_rounded,size: 80,color: Colors.grey.shade200,),
            ),
          ),
          spaceBetween,
          FlatButton(
            minWidth: width * .6,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {
              _uploadSignature(context);
            },
            child: Text(
              'Upload Your Signature',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            ),
          ),
          spaceBetween,
        ],
      ),
    );
    var editButton = !vm.isDoctorInfoEditing
        ? FlatButton(
        minWidth: MediaQuery.of(context).size.width,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: AppTheme.buttonActiveColor,
        onPressed: () {
          setState(() {
            vm.editingDoctorInfo(isDoctorInfoEditing: true);
          });
        },
        child: Text(
          'Update My Profile',
          style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: isTablet ? 18 : 15),
        ))
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
            minWidth: MediaQuery.of(context).size.width * .4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {
              setState(() {
                vm.editingDoctorInfo(isDoctorInfoEditing: false);
              });
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            )),
        FlatButton(
            minWidth: MediaQuery.of(context).size.width * .4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {
              setState(() {
                vm.editingDoctorInfo(isDoctorInfoEditing: false);
              });
            },
            child: Text(
              'Save',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            ))
      ],
    );
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
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

  void _uploadSignature(BuildContext context) {
    showDialog(
      //barrierColor: Color(0x00ffffff),
        context: context,
        builder: (context) {
          return DoctorSignaturePrompt();
        });
  }
  void _showAlertDialogForPassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return ChangeDoctorPasswordAlert();
        });
  }
}
