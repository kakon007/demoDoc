import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class WritePrescription extends StatefulWidget {
  @override
  _WritePrescriptionState createState() => _WritePrescriptionState();
}

class _WritePrescriptionState extends State<WritePrescription> {

  TextEditingController _descriptionTextEditingController =
  TextEditingController();
  var _searchFieldFocusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    var writeDetailsField = Container(
      width: isTablet? width*92 : MediaQuery.of(context).size.width * .89,
      height: isTablet? 200 : 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //color: Colors.white,
        border: Border.all(color: HexColor('#8592E5')),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: SizedBox(
          height: 500,
          child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              maxLength: 200,
              maxLengthEnforced: false,
              autofocus: false,
              textInputAction: TextInputAction.newline,
              focusNode: _searchFieldFocusNode2,
              controller: _descriptionTextEditingController,
              cursorColor: HexColor('#C5CAE8'),
              decoration: InputDecoration(
                border: InputBorder.none,
                // hintText: 'Search here',
                hintStyle: GoogleFonts.poppins(
                    fontSize: isTablet? 15 : 11, fontWeight: FontWeight.w400),
                fillColor: Colors.white,
              ),
              onSubmitted: (v) {
                //vm2.search(_searchTextEditingController2.text,widget.accessToken);
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(200),
              ]),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Prescription", style: TextStyle(color: Colors.black)),
        backgroundColor:Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0,left: 15,right: 15),
        child: Column(
          children: [
            writeDetailsField,
            SizedBox(height: 20,),
            Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: HexColor("#354291"),
              child: SizedBox(
                width: double.infinity,
                height:
                isTablet? 55 : MediaQuery.of(context).size.width > 600 ? 35 : 40,
                child: Center(
                  child: Text(
                    "Save Prescription",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: isTablet? 20 : 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
