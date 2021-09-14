import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class EditUserDetails extends StatefulWidget {
  @override
  _EditUserDetailsState createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  String _selectedGender;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width;
    var presentVillage = SignUpFormField(
      hintText: 'Village',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var presentUnion = SignUpFormField(
      hintText: 'Union',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var presentPostOffice = SignUpFormField(
      hintText: 'Post Office',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var presentThana = SignUpFormField(
      hintText: 'Thana',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var presentProvince = SignUpFormField(
      hintText: 'Province',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var presentDistrict = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Container(
            height: isTablet ? 50 : 45.0,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor('#EAEBED')),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: width * .87,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: _selectedGender != null
                              ? Colors.black54
                              : HexColor("#D2D2D2"),
                        ),
                        iconSize: 25,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            enabledBorder: InputBorder.none),
                        isExpanded: true,
                        hint: Text(
                          'District',
                          style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: HexColor("#D2D2D2")),
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: StringResources.genderList.map((gender) {
                          return DropdownMenuItem(
                            child: new Text(
                              gender,
                              style: GoogleFonts.roboto(fontSize: 14),
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
        ),
      ],
    );
    var presentDivision = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Container(
            height: isTablet ? 50 : 45.0,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor('#EAEBED')),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: width * .87,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: _selectedGender != null
                              ? Colors.black54
                              : HexColor("#D2D2D2"),
                        ),
                        iconSize: 25,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            enabledBorder: InputBorder.none),
                        isExpanded: true,
                        hint: Text(
                          'Division',
                          style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: HexColor("#D2D2D2")),
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: StringResources.genderList.map((gender) {
                          return DropdownMenuItem(
                            child: new Text(
                              gender,
                              style: GoogleFonts.roboto(fontSize: 14),
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
        ),
      ],
    );
    var presentCountry = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Container(
            height: isTablet ? 50 : 45.0,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor('#EAEBED')),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: width * .87,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: _selectedGender != null
                              ? Colors.black54
                              : HexColor("#D2D2D2"),
                        ),
                        iconSize: 25,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            enabledBorder: InputBorder.none),
                        isExpanded: true,
                        hint: Text(
                          'Country',
                          style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: HexColor("#D2D2D2")),
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: StringResources.genderList.map((gender) {
                          return DropdownMenuItem(
                            child: new Text(
                              gender,
                              style: GoogleFonts.roboto(fontSize: 14),
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
        ),
      ],
    );

    var permanentVillage = SignUpFormField(
      hintText: 'Village',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var permanentUnion = SignUpFormField(
      hintText: 'Union',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var permanentPostOffice = SignUpFormField(
      hintText: 'Post Office',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var permanentThana = SignUpFormField(
      hintText: 'Thana',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var permanentProvince = SignUpFormField(
      hintText: 'Province',
      borderRadius: 10,
      isFilled: true,
      minimizeBottomPadding: true,
    );
    var permanentDistrict = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Container(
            height: isTablet ? 50 : 45.0,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor('#EAEBED')),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: width * .87,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: _selectedGender != null
                              ? Colors.black54
                              : HexColor("#D2D2D2"),
                        ),
                        iconSize: 25,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            enabledBorder: InputBorder.none),
                        isExpanded: true,
                        hint: Text(
                          'District',
                          style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: HexColor("#D2D2D2")),
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: StringResources.genderList.map((gender) {
                          return DropdownMenuItem(
                            child: new Text(
                              gender,
                              style: GoogleFonts.roboto(fontSize: 14),
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
        ),
      ],
    );
    var permanentDivision = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Container(
            height: isTablet ? 50 : 45.0,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor('#EAEBED')),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: width * .87,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: _selectedGender != null
                              ? Colors.black54
                              : HexColor("#D2D2D2"),
                        ),
                        iconSize: 25,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            enabledBorder: InputBorder.none),
                        isExpanded: true,
                        hint: Text(
                          'Division',
                          style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: HexColor("#D2D2D2")),
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: StringResources.genderList.map((gender) {
                          return DropdownMenuItem(
                            child: new Text(
                              gender,
                              style: GoogleFonts.roboto(fontSize: 14),
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
        ),
      ],
    );
    var permanentCountry = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Container(
            height: isTablet ? 50 : 45.0,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor('#EAEBED')),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: width * .87,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        onTap: () {
                          FocusManager.instance.primaryFocus.unfocus();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: _selectedGender != null
                              ? Colors.black54
                              : HexColor("#D2D2D2"),
                        ),
                        iconSize: 25,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            enabledBorder: InputBorder.none),
                        isExpanded: true,
                        hint: Text(
                          'Country',
                          style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: HexColor("#D2D2D2")),
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: StringResources.genderList.map((gender) {
                          return DropdownMenuItem(
                            child: new Text(
                              gender,
                              style: GoogleFonts.roboto(fontSize: 14),
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
        ),
      ],
    );

    var sameAddress = Row(
      children: [
        Checkbox(
            activeColor: HexColor('#141D53'),
            value: this.value,
            onChanged: (bool value) {
              setState(() {
                this.value = value;
              });
            }),
        Text(
          'Same as present',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ],
    );
    var cancelButton = Container(
      width: width*.4,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffFF6161),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            // minWidth: MediaQuery.of(context).size.width * .3,

            onPressed: () {},
            child: Text(
              StringResources.cancelButtonText,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            )));
    var saveButton = Container(
        width: width*.4,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppTheme.appbarPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            // minWidth: MediaQuery.of(context).size.width * .3,

            onPressed: () {},
            child: Text(
              StringResources.savedText,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 18 : 15),
            )));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Portal user Details',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Color(0xffEFF5FF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Present Address : ',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                    ),
                    presentVillage,
                    presentUnion,
                    presentPostOffice,
                    presentThana,
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: presentDistrict,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: presentDivision,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: presentCountry,
                    ),
                    presentProvince,
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Permanent Address : ',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                    ),
                    sameAddress,
                    permanentVillage,
                    permanentUnion,
                    permanentPostOffice,
                    permanentThana,
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: permanentDistrict,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: permanentDivision,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: permanentCountry,
                    ),
                    permanentProvince,
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left : 8.0),
                          child: cancelButton,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right : 8.0),
                          child: saveButton,
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
