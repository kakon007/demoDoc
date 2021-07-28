import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key key}) : super(key: key);

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var nameHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Text(
        'Name:',
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
    var doctorName = Padding(
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
              'Assoc. Dr. Mahmud Rahim',
            ),
          ),
        ),
      ),
    );
    var bmdcNoHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Text(
          'BMDC No:',
          style: GoogleFonts.roboto(fontSize: 12),
        ));
    var bmdcNo = Padding(
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
              'A 187',
            ),
          ),
        ),
      ),
    );
    var degreeHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Text(
          'Degree:',
          style: GoogleFonts.roboto(fontSize: 12),
        ));
    var degree = Padding(
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
              'BCS(Health), MD(Chest)',
            ),
          ),
        ),
      ),
    );
    var addMoreButton = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: SizedBox(
        child: FlatButton(
           minWidth: MediaQuery.of(context).size.width*.1 ,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white,),
                //SizedBox(width: 10,),
                Text(
                  'Add More',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            )),
      ),
    );
    var doctorSignatureHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Text(
          "Doctor's signature: ",
          style: GoogleFonts.roboto(fontSize: 12),
        ));
    var doctorSignature = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
      constraints: BoxConstraints(minHeight: 100),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assoc. Dr. Mahmud Rahim',
                ),Text(
                  'MBBS(Dhaka)',
                ),
                Text(
                  'BCS(Health), MD(Chest)',
                ),
              ],
            ),
          ),
        ),
      ),
    );
    var digitalSignatureHeading = Padding(
        padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
        child: Text(
          "Digital signature: ",
          style: GoogleFonts.roboto(fontSize: 12),
        ));
    var digitalSignature = Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DashedContainer(
            dashColor: HexColor("#E9ECFE"),
            borderRadius: 10.0,
            dashedLength: 10.0,
            blankLength: 2.0,
            child: Container(
              constraints: BoxConstraints(minHeight: 90.0,),
              // height: isTablet ? 100 : 90.0,
              width:  width * .6,
              child: Icon(Icons.insert_photo_rounded,size: 80,color: Colors.grey.shade200,),
            ),
          ),
          spaceBetween,
          FlatButton(
            minWidth:  width * .6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {},
            child: Text(
              'Upload Your Signature',
              style: GoogleFonts.poppins(color: Colors.white),
            ),)
        ],
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
        nameHeading,
        //spaceBetween,
        doctorName,
        spaceBetween,
        spaceBetween,
        bmdcNoHeading,
        bmdcNo,
        spaceBetween,
        degreeHeading,
        degree,
        spaceBetween,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(), addMoreButton],
        ),
        spaceBetween,
        doctorSignatureHeading,
        doctorSignature,
        spaceBetween,
        digitalSignatureHeading,
        digitalSignature,
      ],
    );
  }
}
