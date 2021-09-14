import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  var _noteFieldFocusNode2 = FocusNode();
  TextEditingController _companyId = TextEditingController();
  TextEditingController _companyName = TextEditingController();
  TextEditingController _companyCode = TextEditingController();
  TextEditingController _addressCode = TextEditingController();
  TextEditingController _contPerDesign = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _companyTelephone = TextEditingController();
  TextEditingController _companyThana = TextEditingController();
  TextEditingController _contactPerson = TextEditingController();
  TextEditingController _nationality = TextEditingController();
  TextEditingController _companyFax = TextEditingController();
  TextEditingController _companyEmail = TextEditingController();
  TextEditingController _companyWebsite = TextEditingController();
  TextEditingController _companyPhoneNo = TextEditingController();
  TextEditingController promotionalTextEditingController =
      TextEditingController();
  String selectOrganization;
  var pickedDate;
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
  var promotionalValOne = 1;
  @override
  Widget build(BuildContext context) {
    String selectOrganization;
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var spaceBetween = SizedBox(
      height: 10,
    );
    var width = MediaQuery.of(context).size.width;
    var spaceBetween1 = SizedBox(
      height: 15,
    );
    var activeStatus = Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Active Status'),
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
    var docRefNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Doc./Ref.No',
      minimizeBottomPadding: true,
      controller: _companyId,
    );
    var companyName = Padding(
      padding: EdgeInsets.only(left: 5, right: 1),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: isTablet ? 50 : 45.0,
                width: width * 0.90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD2D2D2)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        width: width * 0.8,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            onTap: () {
                              FocusManager.instance.primaryFocus.unfocus();
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: selectOrganization != null
                                  ? Colors.black54
                                  : Color(0XFFD2D2D2),
                            ),
                            iconSize: 25,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, -5, 0, 0),
                                enabledBorder: InputBorder.none),
                            isExpanded: true,
                            hint: Text(
                              'Company Name',
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet ? 17 : 15,
                                  color: Color(0XFFD2D2D2)),
                            ),
                            value: selectOrganization,
                            onChanged: (newValue) {
                              setState(() {});
                            },
                            items:
                                StringResources.organizationList.map((gender) {
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
      ),
    );
    var doctorName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Doctor name',
      minimizeBottomPadding: true,
      controller: _companyCode,
    );
    var fathersName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Father\'s name',
      minimizeBottomPadding: true,
      controller: _companyCode,
    );
    var mothersName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Mother\'s name',
      minimizeBottomPadding: true,
      controller: _companyCode,
    );
    var maritalStatus = Padding(
      padding: EdgeInsets.only(left: 5, right: 1),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: isTablet ? 50 : 45.0,
                width: width * 0.90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD2D2D2)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        width: width * 0.8,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            onTap: () {
                              FocusManager.instance.primaryFocus.unfocus();
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: selectOrganization != null
                                  ? Colors.black54
                                  : Color(0XFFD2D2D2),
                            ),
                            iconSize: 25,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, -5, 0, 0),
                                enabledBorder: InputBorder.none),
                            isExpanded: true,
                            hint: Text(
                              'Marital Status',
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet ? 17 : 15,
                                  color: Color(0XFFD2D2D2)),
                            ),
                            value: selectOrganization,
                            onChanged: (newValue) {
                              setState(() {});
                            },
                            items:
                                StringResources.organizationList.map((gender) {
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
      ),
    );
    var spouseName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Spouse name',
      minimizeBottomPadding: true,
      controller: _companyCode,
    );
    var email = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Email',
      minimizeBottomPadding: true,
      controller: _companyCode,
    );
    var department = Padding(
      padding: EdgeInsets.only(left: 5, right: 1),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: isTablet ? 50 : 45.0,
                width: width * 0.90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD2D2D2)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        width: width * 0.8,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            onTap: () {
                              FocusManager.instance.primaryFocus.unfocus();
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: selectOrganization != null
                                  ? Colors.black54
                                  : Color(0XFFD2D2D2),
                            ),
                            iconSize: 25,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, -5, 0, 0),
                                enabledBorder: InputBorder.none),
                            isExpanded: true,
                            hint: Text(
                              'Department',
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet ? 17 : 15,
                                  color: Color(0XFFD2D2D2)),
                            ),
                            value: selectOrganization,
                            onChanged: (newValue) {
                              setState(() {});
                            },
                            items:
                                StringResources.organizationList.map((gender) {
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
      ),
    );
    var jobTitle = Padding(
      padding: EdgeInsets.only(left: 5, right: 1),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: isTablet ? 50 : 45.0,
                width: width * 0.90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD2D2D2)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        width: width * 0.8,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            onTap: () {
                              FocusManager.instance.primaryFocus.unfocus();
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: selectOrganization != null
                                  ? Colors.black54
                                  : Color(0XFFD2D2D2),
                            ),
                            iconSize: 25,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, -5, 0, 0),
                                enabledBorder: InputBorder.none),
                            isExpanded: true,
                            hint: Text(
                              'Job Title',
                              style: GoogleFonts.roboto(
                                  fontSize: isTablet ? 17 : 15,
                                  color: Color(0XFFD2D2D2)),
                            ),
                            value: selectOrganization,
                            onChanged: (newValue) {
                              setState(() {});
                            },
                            items:
                                StringResources.organizationList.map((gender) {
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
      ),
    );
    var phoneNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Phone No',
      minimizeBottomPadding: true,
      controller: _phoneNumber,
    );

    var selectOrganizations = Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15,
        ),
        child: Container(
          width: 145,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: selectOrganization != null
                      ? Colors.black54
                      : Color(0XFFD2D2D2),
                ),
              ),
              iconSize: 25.0,
              hint: Text(
                'Select Organization Name',
                style:
                    GoogleFonts.roboto(fontSize: 15, color: Color(0xffD2D2D2)),
              ),
              // Not necessary for Option 1
              value: selectOrganization,
              onChanged: (newValue) {
                setState(() {
                  selectOrganization = newValue;
                });
              },
              items: StringResources.organizationList.map((organization) {
                return DropdownMenuItem(
                  child: new Text(
                    organization,
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  value: organization,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
    var selectCategory = Row(
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
                            color: selectOrganization != null
                                ? Colors.black54
                                : HexColor("#D2D2D2"),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            'Select Category',
                            style: GoogleFonts.roboto(
                                fontSize: isTablet ? 17 : 15,
                                color: HexColor("#D2D2D2")),
                          ),
                          value: selectOrganization,
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
    var selectCountry = Row(
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
                            color: selectOrganization != null
                                ? Colors.black54
                                : HexColor("#D2D2D2"),
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
                                color: HexColor("#D2D2D2")),
                          ),
                          value: selectOrganization,
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
              width: width * .42,
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
                            color: selectOrganization != null
                                ? Colors.black54
                                : HexColor("#D2D2D2"),
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
                                color: HexColor("#D2D2D2")),
                          ),
                          value: selectOrganization,
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
                            color: selectOrganization != null
                                ? Colors.black54
                                : HexColor("#D2D2D2"),
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
                                color: HexColor("#D2D2D2")),
                          ),
                          value: selectOrganization,
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
    var nationality = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Nationality',
      minimizeBottomPadding: true,
      isFilled: true,
      controller: _nationality,
    );
    var bdmcRefNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'BDMC-Reg Date(DD-MM-YYYY)',
      minimizeBottomPadding: true,
      isFilled: true,
      controller: _nationality,
    );
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
    var descriptionField = Padding(
      padding: EdgeInsets.only(left: 5),
      child: Container(
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffD2D2D2)),
            borderRadius: BorderRadius.circular(8)),
        width: isTablet ? width * 92 : MediaQuery.of(context).size.width * .9,
        height: isTablet ? 200 : 100,
        child: SizedBox(
          height: 500,
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            //maxLength: 75,
            maxLengthEnforced: false,
            autofocus: false,
            textInputAction: TextInputAction.newline,
            focusNode: _noteFieldFocusNode2,
            controller: promotionalTextEditingController,
            cursorColor: HexColor('#C5CAE8'),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Description',
              hintStyle: GoogleFonts.poppins(
                  fontSize: isTablet ? 15 : 11, fontWeight: FontWeight.w400),
              fillColor: Colors.white,
            ),
            onSubmitted: (v) {
              //vm2.search(_searchTextEditingController2.text,widget.accessToken);
            },
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(75),
            // ]
          ),
        ),
      ),
    );
    var companyTelephone = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Telephone',
      minimizeBottomPadding: true,
      isFilled: true,
      controller: _companyTelephone,
    );
    var companyFax = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Fax',
      minimizeBottomPadding: true,
      isFilled: true,
      controller: _companyFax,
    );
    var companyEmail = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Email',
      minimizeBottomPadding: true,
      isFilled: true,
      controller: _companyEmail,
    );
    var companyWebsite = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Website',
      minimizeBottomPadding: true,
      isFilled: true,
      controller: _companyWebsite,
    );
    var companyPhoneNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Phone No',
      minimizeBottomPadding: true,
      isFilled: true,
      controller: _companyPhoneNo,
    );
    var promotionalInfo = Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Promotional Info'),
            ),
            SizedBox(
              width: 30,
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: promotionalValOne,
                  onChanged: (value) {
                    setState(() {
                      promotionalValOne = value;
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
                  groupValue: promotionalValOne,
                  onChanged: (value) {
                    setState(() {
                      promotionalValOne = value;
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
    var yourCompanyImage = Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Company Image:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          spaceBetween,
          DashedContainer(
            dashColor: Color(0xffE9ECFE),
            borderRadius: 10.0,
            dashedLength: 10.0,
            blankLength: 16.0,
            strokeWidth: 2,
            child: Container(
              //  constraints: BoxConstraints(maxHeight: 200.0,),
              height: 145.0,
              width: width * .43,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      uploadImageIcon,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text(
                    '272 X 150 pixel',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Tap to upload',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // child: Icon(Icons.insert_photo_rounded,size: 80,color: Colors.grey.shade200,),
            ),
          ),
          spaceBetween,
          // FlatButton(
          //   minWidth: width * .6,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //   color: AppTheme.buttonActiveColor,
          //   onPressed: () {
          //     //_uploadSignature(context);
          //   },
          //   child: Text(
          //     'Upload Your Logo',
          //     style: GoogleFonts.roboto(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w600,
          //         fontSize: isTablet ? 18 : 15),
          //   ),
          // ),
          // : SizedBox(),
          spaceBetween,
        ],
      ),
    );
    var yourCompanyLogo = Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Company Logo:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          spaceBetween,
          DashedContainer(
            dashColor: Color(0xffE9ECFE),
            borderRadius: 10.0,
            dashedLength: 10.0,
            blankLength: 16.0,
            strokeWidth: 2,
            child: Container(
              //  constraints: BoxConstraints(maxHeight: 200.0,),
              height: 145.0,
              width: width * .43,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      uploadImageIcon,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text(
                    '66 X 66 pixel',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Tap to upload',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // child: Icon(Icons.insert_photo_rounded,size: 80,color: Colors.grey.shade200,),
            ),
          ),
          spaceBetween,
          // FlatButton(
          //   minWidth: width * .6,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //   color: AppTheme.buttonActiveColor,
          //   onPressed: () {
          //     //_uploadSignature(context);
          //   },
          //   child: Text(
          //     'Upload Your Logo',
          //     style: GoogleFonts.roboto(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w600,
          //         fontSize: isTablet ? 18 : 15),
          //   ),
          // ),
          // : SizedBox(),
          spaceBetween,
        ],
      ),
    );
    var saveButton = Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              activeStatus,
              selectOrganizations,
              spaceBetween1,
              companyName,
              spaceBetween,
              docRefNo,
              doctorName,
              fathersName,
              mothersName,
              spaceBetween,
              maritalStatus,
              spaceBetween,
              spouseName,
              phoneNo,
              email,
              spaceBetween,
              department,
              spaceBetween,
              jobTitle,
              spaceBetween,
              nationality,
              spaceBetween,
              expiredOn,
              bdmcRefNo,
              spaceBetween,
              expiredOn,
              spaceBetween,
              descriptionField,
              spaceBetween,
              saveButton,
              spaceBetween,
              spaceBetween
            ],
          ),
        ),
      ),
    );
  }
}
