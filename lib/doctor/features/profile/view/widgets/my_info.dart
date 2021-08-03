import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/upload_digital_signature.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/doctor_profile_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key key}) : super(key: key);

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<DoctorProfileViewModel>(context, listen: false);
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
    var doctorName =vm.isDoctorInfoEditing? Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(minimizeBottomPadding: true,
        hintText: 'Enter Your Name',
      ),
    ) :  Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            border: Border.all(color: HexColor('#AFBBFF'))
            // boxShadow: [
            //   BoxShadow(
            //     color: HexColor("#0D1231").withOpacity(0.08),
            //     spreadRadius: 2,
            //     blurRadius: 2,
            //     offset: Offset(0, 1), // changes position of shadow
            //   ),
            // ]
          ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
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
    var bmdcNo = vm.isDoctorInfoEditing? Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(minimizeBottomPadding: true,
        hintText: 'Enter BMDC No',
      ),
    ) : Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            border: Border.all(color: HexColor('#AFBBFF'))
            // boxShadow: [
            //   BoxShadow(
            //     color: HexColor("#0D1231").withOpacity(0.08),
            //     spreadRadius: 2,
            //     blurRadius: 2,
            //     offset: Offset(0, 1), // changes position of shadow
            //   ),
            // ]
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
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
    var degree = vm.isDoctorInfoEditing? Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(minimizeBottomPadding: true,
      hintText: 'Enter Degree',
      ),
    ) : Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFFFFF"),
            border: Border.all(color: HexColor('#AFBBFF'))
            // boxShadow: [
            //   BoxShadow(
            //     color: HexColor("#0D1231").withOpacity(0.08),
            //     spreadRadius: 2,
            //     blurRadius: 2,
            //     offset: Offset(0, 1), // changes position of shadow
            //   ),
            // ]
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white,),
                //SizedBox(width: 10,),
                Text(
                  'Add More',
                  style: GoogleFonts.roboto(color: Colors.white),
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
            border: Border.all(color: HexColor('#AFBBFF'))
            // boxShadow: [
            //   BoxShadow(
            //     color: HexColor("#0D1231").withOpacity(0.08),
            //     spreadRadius: 2,
            //     blurRadius: 2,
            //     offset: Offset(0, 1), // changes position of shadow
            //   ),
            // ]
        ),
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
            //  constraints: BoxConstraints(maxHeight: 200.0,),
              height: 120.0,
              width:  width * .6,
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Image.asset(uploadImageIcon,height: 60,width: 60,fit: BoxFit.fitHeight,),
             ),
              // child: Icon(Icons.insert_photo_rounded,size: 80,color: Colors.grey.shade200,),
            ),
          ),
          spaceBetween,
          FlatButton(
            minWidth:  width * .6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppTheme.buttonActiveColor,
            onPressed: () {
              _uploadSignature(context);
            },
            child: Text(
              'Upload Your Signature',
              style: GoogleFonts.roboto(color: Colors.white),
            ),),
          spaceBetween,
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
       // spaceBetween,
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
  void _uploadSignature(BuildContext context) {
    showDialog(
        //barrierColor: Color(0x00ffffff),
        context: context,
        builder: (context) {
          return DoctorSignaturePrompt();
        });
  }
}
