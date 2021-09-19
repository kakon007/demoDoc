import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class OtherInformation extends StatefulWidget {
  @override
  _OtherInformationState createState() => _OtherInformationState();
}

class _OtherInformationState extends State<OtherInformation> {
  var _noteFieldFocusNode2 = FocusNode();
  TextEditingController _companyId = TextEditingController();
  TextEditingController _chamberAddress = TextEditingController();
  TextEditingController _chamberAddress1 = TextEditingController();
  TextEditingController _chamberAddress2 = TextEditingController();
  TextEditingController _chamberAddress3 = TextEditingController();
  TextEditingController _consultation = TextEditingController();
  TextEditingController _qualification = TextEditingController();
  TextEditingController _degree = TextEditingController();
  TextEditingController _offDayRemarks = TextEditingController();
  TextEditingController _doctorSignature = TextEditingController();
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
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    String selectOrganization;
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var spaceBetween = SizedBox(
      height: 10,
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
            Text('Blocklist', style: TextStyle(fontSize: 12)),
          ],
        ),
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
            Text('Vip Flag', style: TextStyle(fontSize: 12)),
          ],
        ),
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
            Text(
              'Online Doctor Flag',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
    var width = MediaQuery.of(context).size.width;
    var spaceBetween1 = SizedBox(
      height: 15,
    );
    var spacilization = Container(
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
                'Specialization',
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
    var degree = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Degree',
      minimizeBottomPadding: true,
      controller: _degree,
    );
    var doctorSignature = Padding(
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
            controller: _doctorSignature,
            cursorColor: HexColor('#C5CAE8'),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Doctor Signature',
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
    var offDayRemarks = Padding(
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
            controller: _offDayRemarks,
            cursorColor: HexColor('#C5CAE8'),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Off Day Remarks',
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
    var qualification = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Qualification',
      minimizeBottomPadding: true,
      controller: _qualification,
    );
    var consultation = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Consultation Fee',
      minimizeBottomPadding: true,
      controller: _consultation,
    );
    var chamberAddress = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Chamber Address',
      minimizeBottomPadding: true,
      controller: _chamberAddress,
    );
    var chamberAddress1 = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Chamber Address1',
      minimizeBottomPadding: true,
      controller: _chamberAddress1,
    );
    var chamberAddress2 = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Chamber Address2',
      minimizeBottomPadding: true,
      controller: _chamberAddress2,
    );
    var chamberAddress3 = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Chamber Address3',
      minimizeBottomPadding: true,
      controller: _chamberAddress3,
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
              checkAll,
              spacilization,
              spaceBetween1,
              degree,
              spaceBetween,
              doctorSignature,
              spaceBetween,
              offDayRemarks,
              spaceBetween,
              qualification,
              spaceBetween,
              consultation,
              spaceBetween,
              chamberAddress,
              spaceBetween,
              chamberAddress1,
              spaceBetween,
              chamberAddress2,
              spaceBetween,
              chamberAddress3,
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
