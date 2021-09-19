import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
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
    return Container(
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
