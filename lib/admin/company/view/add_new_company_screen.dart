import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/root.dart';

class AddCompanyScreen extends StatefulWidget {
  @override
  _AddCompanyScreenState createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  TextEditingController _companyId = TextEditingController();
  TextEditingController _companyName = TextEditingController();
  TextEditingController _companyCode = TextEditingController();
  TextEditingController _addressCode = TextEditingController();
  TextEditingController _contPerDesign = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
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
    var companyID = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company ID',
      minimizeBottomPadding: true,
      controller: _companyId,
    );
    var companyName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Name',
      minimizeBottomPadding: true,
      controller: _companyName,
    );
    var companyCode = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Code',
      minimizeBottomPadding: true,
      controller: _companyCode,
    );
    var companySlogan = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Company Slogan',
      minimizeBottomPadding: true,
      controller: _companyCode,
    );
    var address = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Address',
      minimizeBottomPadding: true,
      controller: _addressCode,
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
    var contactPerson = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Contact Person',
      minimizeBottomPadding: true,
      controller: _addressCode,
    );
    var contactContPerDesign = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Cont. Per Design',
      minimizeBottomPadding: true,
      controller: _contPerDesign,
    );
    var phoneNo = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Phone No',
      minimizeBottomPadding: true,
      controller: _phoneNumber,
    );
    String selectOrganization;
    var selectOrganizations = Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
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
    var selectCategory = Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
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
                'Select Category ',
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
    var selectCountry = Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
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
                'Select Country ',
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Company"),
        backgroundColor: Color(0xff354291),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              spaceBetween,
              activeStatus,
              companyID,
              companyName,
              companyCode,
              companySlogan,
              address,
              spaceBetween,
              expiredOn,
              contactPerson,
              contactContPerDesign,
              phoneNo,
              selectOrganizations
            ],
          ),
        ),
      ),
    );
  }
}
