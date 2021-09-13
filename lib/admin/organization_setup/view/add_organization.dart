import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

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
        title: Text("Add Organization"),
        backgroundColor: Color(0xff354291),
      ),
      backgroundColor: Color(0xffF9F9F9),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
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
                child: selectOrganizations,
              ),
              orgThana,
              orgWebSite,
              orgEmail,
              orgFax,
            ],
          ),
        ),
      ),
    );
  }
}
