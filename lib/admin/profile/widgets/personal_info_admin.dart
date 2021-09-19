import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/admin/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:provider/provider.dart';
class PersonalInfoAdmin extends StatefulWidget {
  const PersonalInfoAdmin({Key key}) : super(key: key);

  @override
  _PersonalInfoAdminState createState() => _PersonalInfoAdminState();
}

class _PersonalInfoAdminState extends State<PersonalInfoAdmin> {
  bool isReadOnly = true;
  final _formKey = new GlobalKey<FormState>();
  TextEditingController _userEmail = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  @override
  void initState() {
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: false);
    var personalInfoVm = AdminPersonalInfoViewModel.read(context);
     personalInfoVm.editingPersonalInfo(isPersonalInfoEditing: false);
    // TODO: implement initState
    _userEmail.text = companyInfoVm.details?.userEmail??"";
    _mobile.text = companyInfoVm.details.userMobile??"";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var personalInfoVm = AdminPersonalInfoViewModel.watch(context);
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var usernameHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Name',
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
    var designationHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Designation',
            style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
          ),
        ],
      ),
    );
    var designation = Padding(
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
            child: Text('',
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
      ),
    );
    var editButton = !personalInfoVm.isPersonalInfoEditing
        ? FlatButton(
        minWidth: MediaQuery.of(context).size.width,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: AppTheme.appbarPrimary,
        onPressed: () {
          setState(() {
            personalInfoVm.editingPersonalInfo(isPersonalInfoEditing: true);
            isReadOnly = false;
          });
        },
        child: Text(
          'Edit Your Profile',
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
            color: AppTheme.appbarPrimary,
            onPressed: () {
              setState(() {
                personalInfoVm.editingPersonalInfo(
                    isPersonalInfoEditing: false);
                // errorText = null;
                // isReadOnly = true;
              });
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            )),
        FlatButton(
            minWidth: MediaQuery.of(context).size.width * .4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            color: AppTheme.appbarPrimary,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                isReadOnly = true;
                await companyInfoVm.updateAdminProfile(
                  id: companyInfoVm.details.userId.toString(),
                  mobile: _mobile.text,
                  email: _userEmail.text,
                  hospitalNo: companyInfoVm.details.name
                );
                personalInfoVm.editingPersonalInfo(isPersonalInfoEditing: false);
              }
            },
            child: Text(
              'Save',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            ))
      ],
    );
    var emailHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Email',
            style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
          ),
          Text(
            !personalInfoVm.isPersonalInfoEditing ? "" :'*',
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );

    var email =
    // personalInfoVm.isPersonalInfoEditing
    //     ?
    Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
        enabledBorderColor: isReadOnly ? "#AFBBFF" : "#EAEBED",
        readOnly: isReadOnly,
        validator: Validator().validateEmail,
        controller: _userEmail,
        minimizeBottomPadding: true,
        hintText: !personalInfoVm.isPersonalInfoEditing ? "" : 'Enter Your Email',
      ),
    );
    var mobileHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Mobile',
            style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
          ),
          Text(
            !personalInfoVm.isPersonalInfoEditing ? "" :'*',
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );

    var mobile =
    // personalInfoVm.isPersonalInfoEditing
    //     ?
    Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
        enabledBorderColor: isReadOnly ? "#AFBBFF" : "#EAEBED",
        readOnly: isReadOnly,
        validator: Validator().validatePhoneNumber,
        controller: _mobile,
        minimizeBottomPadding: true,
        hintText: !personalInfoVm.isPersonalInfoEditing ? "" : 'Enter Your Email',
      ),
    );
    return Form(
      key: _formKey,
      child: Padding(
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
                  username,
                  spaceBetween,
                  spaceBetween,
                  designationHeading,
                  designation,
                  spaceBetween,
                  spaceBetween,
                  mobileHeading,
                  mobile,
                  spaceBetween,
                  spaceBetween,
                  emailHeading,
                  email,
                  spaceBetween,
                  spaceBetween,
                  editButton

                ],
              ),
            ),
            spaceBetween,
            // editButton
          ],
        ),
      ),
    );
  }
}
