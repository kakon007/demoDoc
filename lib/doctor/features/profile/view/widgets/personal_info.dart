import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/change_password_prompt.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/doctor_profile_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  // bool isEditing= false;
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorProfileViewModel>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var nameHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Text(
        'Name:',
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
    var doctorName = vm.isPersonalInfoEditing
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
                  ),
                ),
              ),
            ),
          );
    var designationHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Text(
        'Name:',
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
    var designation = vm.isPersonalInfoEditing
        ? Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4),
            child: DoctorFormField(
              minimizeBottomPadding: true,
              hintText: 'Enter Your Designation',
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
                    'MBBS',
                  ),
                ),
              ),
            ),
          );
    var mobileText = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5),
      child: Text(
        'Mobile:',
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
    var mobileField = Padding(
      padding: const EdgeInsets.only(left: 7.0,right: 5),
      child: Container(
        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            border: Border.all(color: vm.isPersonalInfoEditing? Colors.white : HexColor("#AFBBFF"),width: 1)
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 70,
              child: Center(child: Text('+880')),
              decoration: BoxDecoration(
                  color: HexColor('#E8E8E8'),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
            ),
            Container(
              width: width <= 330
                  ? width * .6
                  : MediaQuery.of(context).size.width * .67,
              child: vm.isPersonalInfoEditing
                  ? TextFormField(
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, color: HexColor("#D2D2D2")),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor("#AFBBFF"), width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(15.0, 25, 40.0, 0.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor("#AFBBFF"), width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor("#EAEBED"), width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        hintText: '1310000000',
                      ),
                    )
                  : Container(
                    child: Padding(
                        padding: EdgeInsets.only(left: 15.0,right: 10),
                        child: Text(
                          '1312202020',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                  ),
            ),
          ],
        ),
      ),
    );
    var emailHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Text(
        'Email:',
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
    var email = vm.isPersonalInfoEditing
        ? Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4),
            child: DoctorFormField(
              minimizeBottomPadding: true,
              hintText: 'Enter Your Email',
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
                    'mahmud@gmail.com',
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
            style: GoogleFonts.roboto(fontSize: 12),
          ),
          FlatButton(
              minWidth: MediaQuery.of(context).size.width * .3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              color: AppTheme.buttonActiveColor,
              onPressed: () {
                _showAlertDialogForPassword(context);
              },
              child: Text(
                'Click Here',
                style: GoogleFonts.poppins(color: Colors.white),
              )),
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceBetween,
        spaceBetween,
        nameHeading,
        doctorName,
        spaceBetween,
        designationHeading,
        designation,
        spaceBetween,
        mobileText,
        mobileField,
        spaceBetween,
        emailHeading,
        email,
        spaceBetween,
        clickHere
      ],
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
