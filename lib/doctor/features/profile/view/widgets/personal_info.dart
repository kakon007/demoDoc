import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/change_password_prompt.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/doctor_profile_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController _userMobile = TextEditingController();
  TextEditingController _userEmail = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  String errorText;

  @override
  void initState() {
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: false);
    _userMobile.text =
        companyInfoVm.details?.userMobile.toString().substring(1);
    _userEmail.text = companyInfoVm.details?.userEmail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorProfileViewModel>(context, listen: false);
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var nameHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Text(
        'Name',
        style: GoogleFonts.poppins(fontSize: 12),
      ),
    );
    var doctorName =
        // vm.isPersonalInfoEditing
        //     ? Padding(
        //         padding: const EdgeInsets.only(left: 4.0, right: 4),
        //         child: DoctorFormField(
        //           minimizeBottomPadding: true,
        //           hintText: 'Enter Your Name',
        //         ),
        //       )
        //     :
        Padding(
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
              companyInfoVm.isLoading ? '' : companyInfoVm.details?.name ?? '',
              style: GoogleFonts.poppins(fontSize: 15),
            ),
          ),
        ),
      ),
    );
    var designationHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Text(
        'Designation',
        style: GoogleFonts.poppins(fontSize: 12),
      ),
    );
    var designation =
        // vm.isPersonalInfoEditing
        //     ? Padding(
        //         padding: const EdgeInsets.only(left: 4.0, right: 4),
        //         child: DoctorFormField(
        //           minimizeBottomPadding: true,
        //           hintText: 'Enter Your Designation',
        //         ),
        //       )
        //     :
        Padding(
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
              style: GoogleFonts.poppins(fontSize: 15),
            ),
          ),
        ),
      ),
    );
    var mobileText = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5),
      child: Row(
        children: [
          Text(
            'Mobile',
            style: GoogleFonts.poppins(fontSize: 12),
          ),
          Text(
            vm.isPersonalInfoEditing ? '*' : "",
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );
    var mobileField = vm.isPersonalInfoEditing
        ? Column(
          children: [
            Container(
                child: Stack(
                  children: [
                    DoctorFormField(
                      leftContentPadding: 85,
                      controller: _userMobile,
                      validator: Validator().validateDoctorPhoneNumber,
                      hintText: '1310000000',
                      minimizeBottomPadding: true,
                    ),
                    Positioned(
                      top: 3,
                      left: 6.5,
                      child: Container(
                        height: 46,
                        width: 70,
                        child: Center(child: Text('+880', style: GoogleFonts.poppins(fontSize: 15),)),
                        decoration: BoxDecoration(
                            color: HexColor('#E8E8E8'),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8))),
                      ),
                    )
                  ],
                ),
              ),
          ],
        )
        : Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Container(
                width: width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: vm.isPersonalInfoEditing
                                ? Colors.white
                                : HexColor("#AFBBFF"),
                        width: 1)),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 85.0, right: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        companyInfoVm.isLoading
                            ? ''
                            : companyInfoVm.details?.userMobile
                                    .toString()
                                    .substring(1) ??
                                '',
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left:0,
                    child: Container(
                      height: 50,
                      width: 70,
                      child: Center(child: Text('+880',  style: GoogleFonts.poppins(fontSize: 15),)),
                      decoration: BoxDecoration(
                          color: HexColor('#E8E8E8'),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                    ),
                  )
                ],
              ),
            ),
        );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(left: 7.0, right: 5),
    //       child: Container(
    //         width: width,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             border: Border.all(
    //                 color: errorText != null
    //                     ? Colors.red.shade700
    //                     : vm.isPersonalInfoEditing
    //                         ? Colors.white
    //                         : HexColor("#AFBBFF"),
    //                 width: 1)),
    //         child: Row(
    //           children: [
    //             Container(
    //               height: 50,
    //               width: 70,
    //               child: Center(child: Text('+880')),
    //               decoration: BoxDecoration(
    //                   color: HexColor('#E8E8E8'),
    //                   borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(10),
    //                       bottomLeft: Radius.circular(10))),
    //             ),
    //             Container(
    //               width: width <= 330
    //                   ? width * .55
    //                   : MediaQuery.of(context).size.width * .67,
    //               child: vm.isPersonalInfoEditing
    //                   ? TextFormField(
    //                       controller: _userMobile,
    //                       //validator: Validator().validatePhoneNumber,
    //                       decoration: new InputDecoration(
    //                         border: InputBorder.none,
    //                         hintStyle: GoogleFonts.poppins(
    //                             fontSize: 12, color: HexColor("#D2D2D2")),
    //                         focusedBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(
    //                               color: errorText != null
    //                                   ? Colors.white: HexColor("#D6DCFF"), width: 1.0),
    //                           borderRadius: BorderRadius.only(
    //                               bottomRight: Radius.circular(10),
    //                               topRight: Radius.circular(10)),
    //                         ),
    //                         contentPadding:
    //                             EdgeInsets.fromLTRB(15.0, 25, 40.0, 0.0),
    //                         enabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(
    //                               color: HexColor("#EAEBED"), width: 1.0),
    //                           borderRadius: BorderRadius.only(
    //                               bottomRight: Radius.circular(10),
    //                               topRight: Radius.circular(10)),
    //                         ),
    //                         focusedErrorBorder: OutlineInputBorder(
    //                           borderSide: BorderSide(
    //                               color: HexColor("#EAEBED"), width: 1.0),
    //                           borderRadius: BorderRadius.only(
    //                               bottomRight: Radius.circular(10),
    //                               topRight: Radius.circular(10)),
    //                         ),
    //                         errorBorder: OutlineInputBorder(
    //                           borderSide:
    //                               BorderSide(color: Colors.red, width: 1.0),
    //                           borderRadius: BorderRadius.only(
    //                               bottomRight: Radius.circular(10),
    //                               topRight: Radius.circular(10)),
    //                         ),
    //                         hintText: '1310000000',
    //                       ),
    //                     )
    //                   : Container(
    //                       child: Padding(
    //                         padding: EdgeInsets.only(left: 15.0, right: 10),
    //                         child: Text(
    //                           companyInfoVm.isLoading
    //                               ? ''
    //                               : companyInfoVm.details?.userMobile
    //                                       .toString()
    //                                       .substring(1) ??
    //                                   '',
    //                           style: GoogleFonts.poppins(fontSize: 15),
    //                         ),
    //                       ),
    //                     ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     errorText != null
    //         ? Padding(
    //             padding: const EdgeInsets.only(left: 22.0, top: 8),
    //             child: Text(
    //               errorText,
    //               style: TextStyle(color: Colors.red.shade700, fontSize: 12),
    //             ),
    //           )
    //         : SizedBox()
    //   ],
    // );
    var emailHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Email',
            style: GoogleFonts.poppins(fontSize: 12),
          ),
          Text(
            vm.isPersonalInfoEditing ? '*' : "",
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );
    var email = vm.isPersonalInfoEditing
        ? Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4),
            child: DoctorFormField(
              validator: Validator().validateEmail,
              controller: _userEmail,
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
                    companyInfoVm.isLoading
                        ? ''
                        : companyInfoVm.details?.userEmail ?? '',
                    style: GoogleFonts.poppins(fontSize: 15),
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
                  borderRadius: BorderRadius.circular(5)),
              color: AppTheme.buttonActiveColor,
              onPressed: () {
                _showAlertDialogForPassword(context);
              },
              child: Text(
                StringResources.clickHere,
                style: GoogleFonts.roboto(color: Colors.white),
              )),
        ],
      ),
    );
    var editButton = !vm.isPersonalInfoEditing
        ? FlatButton(
            minWidth: MediaQuery.of(context).size.width,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {
              setState(() {
                vm.editingPersonalInfo(isPersonalInfoEditing: true);
              });
            },
            child: Text(
              'Edit Your Profile',
              style: GoogleFonts.roboto(color: Colors.white),
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
                      vm.editingPersonalInfo(isPersonalInfoEditing: false);
                      errorText = null;
                    });
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(color: Colors.white),
                  )),
              FlatButton(
                  minWidth: MediaQuery.of(context).size.width * .4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: AppTheme.buttonActiveColor,
                  onPressed: () async {
                    // setState(() {
                    //   errorText = Validator()
                    //       .validateDoctorPhoneNumber(_userMobile.text);
                    //   print(errorText);
                    // });
                    if (_formKey.currentState.validate()) {
                      // setState(() {
                      //   errorText = Validator().validateDoctorPhoneNumber(_userMobile.text);
                      //   print(errorText);
                      // });
                      await companyInfoVm.updateDoctorProfile(
                          userEmail: _userEmail.text,
                          userMobile: _userMobile.text,
                          hospitalNo: companyInfoVm.details.name,
                          id: companyInfoVm.details.userId.toString());
                      if (companyInfoVm.resDoctorStatusCode == '200') {
                        vm.editingPersonalInfo(isPersonalInfoEditing: false);
                      }
                    }
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(color: Colors.white),
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
            child: Form(
              key: _formKey,
              child: Column(
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
                  clickHere,
                ],
              ),
            ),
          ),
          spaceBetween,
          spaceBetween,
          editButton
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
