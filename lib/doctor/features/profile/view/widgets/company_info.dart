import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({Key key}) : super(key: key);

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var companyHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Text(
        'Company Name:',
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
    var companyName = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            boxShadow: [
              BoxShadow(
                color: HexColor("#0D1231").withOpacity(0.08),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ]),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Aalok Health Care(Branch Mirpur 10)',
            ),
          ),
        ),
      ),
    );
    var addressHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Text(
          'Address:',
          style: GoogleFonts.roboto(fontSize: 12),
        ));
    var address = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            boxShadow: [
              BoxShadow(
                color: HexColor("#0D1231").withOpacity(0.08),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ]),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Mirpur 10',
            ),
          ),
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceBetween,
        spaceBetween,
        // SignUpFormField(labelText: 'Shakil',
        // labelLeftPadding: 0,
        // )
        companyHeading,
        //spaceBetween,
        companyName,
        spaceBetween,
        spaceBetween,
        addressHeading,
        // spaceBetween,
        address,
        spaceBetween,
        spaceBetween,
      ],
    );
  }
}
