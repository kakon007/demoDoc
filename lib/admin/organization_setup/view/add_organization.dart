import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/upload_digital_signature.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/digital_signature_view_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

class AddOrganizationScreen extends StatefulWidget {
  @override
  _AddOrganizationScreenState createState() => _AddOrganizationScreenState();
}

class _AddOrganizationScreenState extends State<AddOrganizationScreen> {
  TextEditingController _orgName = TextEditingController();
  TextEditingController _orgCode = TextEditingController();
  TextEditingController _orgAddressCode = TextEditingController();
  TextEditingController _orgContPerDesign = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _orgMobileNumber = TextEditingController();
  TextEditingController _orgContactNumber = TextEditingController();
  TextEditingController _orgThana = TextEditingController();
  TextEditingController _orgWebSIte = TextEditingController();
  TextEditingController _orgEmail = TextEditingController();
  TextEditingController _orgFax = TextEditingController();
  var pickedDate;
  String selectedCountry;
  String selectedDivision;
  String selectedDistric;
  DateTime selectedExpectedDate = DateTime.now();
  Future<Null> _expectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050, 1));
    if (picked != null && picked != selectedExpectedDate)
      setState(() {
        pickedDate = picked;
        //cartVM.saveOrderConfirmDataData(expectedDate: cartVM.selectedExpectedDate,);
        var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
        // cartVM.expectedDate.value =
        //     TextEditingValue(text: "${formattedDate.toString()}");
      });
  }

  @override
  var valOne = 1;
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var spaceBetween = SizedBox(
      height: 10,
    );
    var activeStatus = Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Foreign Traveler'),
            ),
            SizedBox(
              width: 30,
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: valOne,
                  onChanged: (value) {
                    setState(() {
                      valOne = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
                Text('On')
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: valOne,
                  onChanged: (value) {
                    setState(() {
                      valOne = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
                Text('Off')
              ],
            ),
          ],
        ),
      ],
    );
    var orgName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Organization Name',
      minimizeBottomPadding: true,
      controller: _orgName,
      isFilled: true,
    );
    var orgCode = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Org Code/Alias',
      minimizeBottomPadding: true,
      controller: _orgCode,
      isFilled: true,
    );
    var orgSlogan = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Slogan',
      minimizeBottomPadding: true,
      controller: _orgCode,
      isFilled: true,
    );
    var orgAddress = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Address',
      minimizeBottomPadding: true,
      controller: _orgAddressCode,
      isFilled: true,
    );
    // var expiredOn = SignUpFormField(
    //   hintSize: isTablet ? 17 : 12,
    //   hintText: 'Address',
    //   minimizeBottomPadding: true,
    //   controller: _addressCode,
    // );
    var width = MediaQuery.of(context).size.width;
    var expiredOn = GestureDetector(
      child: Container(
        height: 50.0,
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
        width: isTablet
            ? width * .94
            : width <= 330
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '',
                // DateFormat("dd-MMM-yyyy")
                //     .format(cartVM.selectedExpectedDate

                style: GoogleFonts.poppins(
                    color: AppTheme.signInSignUpColor,
                    fontSize: isTablet ? 18 : 13.0),
              ),
              Container(
                  height: 25,
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xff808080),
                  )),
            ],
          ),
        ),
      ),
      onTap: () {
        _expectedDate(context);
      },
    );
    var orgContactPerson = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Contact Person',
      minimizeBottomPadding: true,
      controller: _orgAddressCode,
      isFilled: true,
    );
    var orgContactContPerDesign = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Cont. Per Design',
      minimizeBottomPadding: true,
      controller: _orgContPerDesign,
      isFilled: true,
    );
    var orgPhoneNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Phone No',
      minimizeBottomPadding: true,
      controller: _phoneNumber,
      isFilled: true,
    );
    var orgMobileNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Mobile No',
      minimizeBottomPadding: true,
      controller: _orgMobileNumber,
      isFilled: true,
    );
    var orgContactNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Contact No',
      minimizeBottomPadding: true,
      controller: _orgContactNumber,
      isFilled: true,
    );
    var orgThana = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Thana',
      minimizeBottomPadding: true,
      controller: _orgThana,
      isFilled: true,
    );
    var orgWebSite = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Website',
      minimizeBottomPadding: true,
      controller: _orgWebSIte,
      isFilled: true,
    );
    var orgEmail = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Email',
      minimizeBottomPadding: true,
      controller: _orgEmail,
      isFilled: true,
    );
    var orgFax = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Fax',
      minimizeBottomPadding: true,
      controller: _orgFax,
      isFilled: true,
    );

    var selectCountry = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isTablet ? 50 : 45.0,
              width: width * .895,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD2D2D2)),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: width * .82,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          onTap: () {
                            FocusManager.instance.primaryFocus.unfocus();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: selectedCountry != null
                                ? Colors.black54
                                : Color(0xffD2D2D2),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            'Select Country',
                            style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: Color(0xffD2D2D2),
                            ),
                          ),
                          value: selectedCountry,
                          onChanged: (newValue) {
                            setState(() {});
                          },
                          items: StringResources.organizationList.map((gender) {
                            return DropdownMenuItem(
                              child: new Text(
                                gender,
                                style: GoogleFonts.roboto(fontSize: 15),
                              ),
                              value: gender,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
    var selectDivision = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isTablet ? 50 : 45.0,
              width: width * .43,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD2D2D2)),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: width * .35,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          onTap: () {
                            FocusManager.instance.primaryFocus.unfocus();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: selectedDivision != null
                                ? Colors.black54
                                : Color(0xffD2D2D2),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            'Select Division',
                            style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: Color(0xffD2D2D2),
                            ),
                          ),
                          value: selectedDivision,
                          onChanged: (newValue) {
                            setState(() {});
                          },
                          items: StringResources.organizationList.map((gender) {
                            return DropdownMenuItem(
                              child: new Text(
                                gender,
                                style: GoogleFonts.roboto(fontSize: 15),
                              ),
                              value: gender,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
    var selectDistrict = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isTablet ? 50 : 45.0,
              width: width * .43,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD2D2D2)),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: width * .35,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          onTap: () {
                            FocusManager.instance.primaryFocus.unfocus();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: selectedDistric != null
                                ? Colors.black54
                                : Color(0xffD2D2D2),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            'Select District',
                            style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: Color(0xffD2D2D2),
                            ),
                          ),
                          value: selectedDistric,
                          onChanged: (newValue) {
                            setState(() {});
                          },
                          items: StringResources.organizationList.map((gender) {
                            return DropdownMenuItem(
                              child: new Text(
                                gender,
                                style: GoogleFonts.roboto(fontSize: 15),
                              ),
                              value: gender,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
    // var digitalSignVm = DigitalSignatureViewModel.watch(context);
    // var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    // var personalInfoVm = PersonalInfoViewModel.read(context);
    // void _uploadSignature(BuildContext context) {
    //   showDialog(
    //       //barrierColor: Color(0x00ffffff),
    //       context: context,
    //       builder: (context) {
    //         return DoctorSignaturePrompt();
    //       });
    // }

    var orgLogo = Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // digitalSignVm.imageFile != null
          //     ?
          // DashedContainer(
          //         dashColor: Color(0xffE9ECFE),
          //         borderRadius: 10.0,
          //         dashedLength: 10.0,
          //         blankLength: 2.0,
          //         child: Container(
          //           //  constraints: BoxConstraints(maxHeight: 200.0,),
          //           height: 120.0,
          //           width: width * .6,
          //           child: Padding(
          //             padding: const EdgeInsets.all(20.0),
          //             child: Image.file(
          //               digitalSignVm.imageFile,
          //               height: 60,
          //               width: 60,
          //               fit: BoxFit.fitHeight,
          //             ),
          //           ),
          //           // child: Icon(Icons.insert_photo_rounded,size: 80,color: Colors.grey.shade200,),
          //         ),
          //       )
          //     : digitalSignVm.signatureImage != null
          //         ? companyInfoVm.loadProfileImage(
          //             digitalSignVm.signatureImage, 120.0, 120.0, 20)
          //         :
          DashedContainer(
            dashColor: Color(0xffE9ECFE),
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
          // spaceBetween,
          // personalInfoVm.isPersonalInfoEditing
          //     ?
          spaceBetween,
          FlatButton(
            minWidth: width * .6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {
              //_uploadSignature(context);
            },
            child: Text(
              'Upload Your Logo',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            ),
          ),
          // : SizedBox(),
          spaceBetween,
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Organization"),
        backgroundColor: Color(0xff354291),
      ),
      backgroundColor: Color(0xffF9F9F9),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              orgName,
              orgCode,
              orgPhoneNo,
              orgMobileNo,
              orgAddress,
              orgContactPerson,
              orgContactContPerDesign,
              orgContactNo,
              orgSlogan,
              spaceBetween,
              expiredOn,
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                child: selectCountry,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectDivision,
                    selectDistrict,
                  ],
                ),
              ),
              orgThana,
              orgWebSite,
              orgEmail,
              orgFax,
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                child: Text(
                  "Your organization logo:",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ),
              spaceBetween,
              orgLogo,
              spaceBetween,
              spaceBetween,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * .35,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xffFF6161),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Cancel"),
                    ),
                  ),
                  Container(
                    width: width * .35,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppTheme.buttonActiveColor),
                      ),
                      onPressed: () {},
                      child: Text("Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
