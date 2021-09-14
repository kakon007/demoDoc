import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({Key key}) : super(key: key);

  @override
  _BasicInfoScreenState createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    TextEditingController _userId = TextEditingController();
    TextEditingController _userName = TextEditingController();
    TextEditingController _userPassword = TextEditingController();
    TextEditingController _userDefaultPageLink = TextEditingController();
    var spaceBetween = SizedBox(
      height: 10,
    );
    var selectedUserType;
    var selectedOrganization;
    var selectedCompany;
    var selectUserType = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isTablet ? 50 : 45.0,
              width: width * .945,
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
                            color: selectedUserType != null
                                ? Colors.black54
                                : Color(0xffD2D2D2),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            'Select User Type',
                            style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: Color(0xffD2D2D2),
                            ),
                          ),
                          value: selectedUserType,
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
    var selectOrganization = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isTablet ? 50 : 45.0,
              width: width * .945,
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
                            color: selectedOrganization != null
                                ? Colors.black54
                                : Color(0xffD2D2D2),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            'Organization',
                            style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: Color(0xffD2D2D2),
                            ),
                          ),
                          value: selectedOrganization,
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
    var selectCompany = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isTablet ? 50 : 45.0,
              width: width * .945,
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
                            color: selectedCompany != null
                                ? Colors.black54
                                : Color(0xffD2D2D2),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            'Company',
                            style: GoogleFonts.roboto(
                              fontSize: isTablet ? 17 : 15,
                              color: Color(0xffD2D2D2),
                            ),
                          ),
                          value: selectedCompany,
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
    var userId = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'User ID',
      minimizeBottomPadding: true,
      controller: _userId,
      isFilled: true,
    );
    var userName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'User Name',
      minimizeBottomPadding: true,
      controller: _userName,
      isFilled: true,
    );
    var userPassword = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Password',
      minimizeBottomPadding: true,
      controller: _userPassword,
      isFilled: true,
    );
    var userDefaultPageLink = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Default Pagelink',
      minimizeBottomPadding: true,
      controller: _userDefaultPageLink,
      isFilled: true,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          spaceBetween,
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: selectUserType,
          ),
          spaceBetween,
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: selectOrganization,
          ),
          spaceBetween,
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: selectCompany,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(right: 6, left: 6),
            child: userId,
          ),
          Padding(
            padding: EdgeInsets.only(right: 6, left: 6),
            child: userName,
          ),
          Padding(
            padding: EdgeInsets.only(right: 14, left: 14),
            child: Text(
              "[Note: Your user name must contain company code. ex: HHHL-APPADMIN]",
              style: TextStyle(color: Colors.red),
            ),
          ),
          spaceBetween,
          Padding(
            padding: EdgeInsets.only(right: 6, left: 6),
            child: userPassword,
          ),
          Padding(
            padding: EdgeInsets.only(right: 6, left: 6),
            child: userDefaultPageLink,
          ),
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
    );
  }
}
