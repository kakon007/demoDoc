import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class AdressWidget extends StatefulWidget {
  @override
  _AdressWidgetState createState() => _AdressWidgetState();
}

class _AdressWidgetState extends State<AdressWidget> {
  TextEditingController _village = TextEditingController();
  TextEditingController _union = TextEditingController();
  TextEditingController _postOffice = TextEditingController();
  TextEditingController _thana = TextEditingController();
  TextEditingController _province = TextEditingController();
  var selectOrganization;
  bool valuesecond = false;
  String choseGender;
  String choseReligion;
  var pickedDate;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var village = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Village',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _village,
    );
    var union = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Union',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _union,
    );
    var postOffice = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Post Office',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _postOffice,
    );
    var thana = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Thana',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _thana,
    );
    var province = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Province',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _province,
    );
    var spaceBetween = SizedBox(
      height: 10,
    );
    var country = Container(
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
                'Country',
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
    var division = Container(
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
                'Division',
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
    var district = Container(
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
                'District',
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
    var checkAll = Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: this.valuesecond,
              onChanged: (bool value) {
                setState(() {
                  this.valuesecond = value;
                });
              },
            ),
            Text('Same as present', style: TextStyle(fontSize: 12)),
          ],
        ),
      ],
    );
    var village1 = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Village',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _village,
    );
    var union1 = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Union',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _union,
    );
    var postOffice1 = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Post Office',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _postOffice,
    );
    var thana1 = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Thana',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _thana,
    );
    var bloodGroup = Container(
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
                'Blood Group',
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
    var selectGender = DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        value: choseGender,
        //elevation: 5,
        style: TextStyle(color: Colors.black),
        items: <String>[
          'Male',
          'Female',
          'Other',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: isMobile ? 14 : 18),
            ),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "Gender",
            style: TextStyle(
                color: Colors.grey,
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        onChanged: (String value) {
          setState(() {
            choseGender = value;
          });
        },
      ),
    );
    var selectReligion = DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        value: choseReligion,
        //elevation: 5,
        style: TextStyle(color: Colors.black),
        items: <String>[
          'Male',
          'Female',
          'Other',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: isMobile ? 14 : 18),
            ),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "Religion",
            style: TextStyle(
                color: Colors.grey,
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        onChanged: (String value) {
          setState(() {
            choseReligion = value;
          });
        },
      ),
    );
    var gender = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
                margin: EdgeInsets.only(bottom: 20),
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: selectGender,
                ),
              ),
            ],
          ),
        )
      ],
    );
    var religion = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
                margin: EdgeInsets.only(bottom: 20),
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: selectReligion,
                ),
              ),
            ],
          ),
        )
      ],
    );
    var fax = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Fax',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _postOffice,
    );
    var passport = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Passport',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _postOffice,
    );
    var driLcNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'driv Lc No',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _postOffice,
    );
    var tinNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Tin No',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: _postOffice,
    );
    var remarks = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      isFilled: true,
      hintText: 'Remarks',
      minimizeBottomPadding: true,
      // controller: clientIdController,
      maxLines: 3,
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
          var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
        });
    }

    var personalInfo = GestureDetector(
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
                'Date of Birth',
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0XFFEFF5FF)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Present Address: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  village,
                  union,
                  postOffice,
                  thana,
                  district,
                  spaceBetween,
                  division,
                  spaceBetween,
                  country,
                  province,
                  spaceBetween,
                  spaceBetween,
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Permanent Address: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  checkAll,
                  village1,
                  union1,
                  postOffice1,
                  thana1,
                  bloodGroup,
                  spaceBetween,
                  personalInfo,
                  spaceBetween,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [gender, religion],
                  ),
                  fax,
                  passport,
                  driLcNo,
                  tinNo,
                  remarks,
                  saveButton
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
