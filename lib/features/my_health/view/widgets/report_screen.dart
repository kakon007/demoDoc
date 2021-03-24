import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_contrainer_for_report.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    var searchField=
    Container(
      //height: 40,
        width: 200,
        height: 60,
        child:Padding(
          padding: const EdgeInsets.only(bottom:20.0,right: 12),
          child: Stack(
              children:[
                Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
                TextFormField(
                  cursorColor: HexColor('#C5CAE8'),
                  decoration: InputDecoration(
                    hintText: 'Search reports',
                    hintStyle: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w400),
                    //labelText: "Resevior Name",
                    fillColor: Colors.white,
                    focusedBorder:UnderlineInputBorder(
                      borderSide:  BorderSide(color: HexColor('#354291').withOpacity(0.5), width: 1.5),
                      //borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onChanged: (text) {
                    //value = text;
                  },
                ),
              ]
          ),
        )
    );
    return Scaffold(
        body:

        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:12.0,bottom: 20),
                  child: Text("13 Report(s) found",style: GoogleFonts.poppins(fontSize: 10),),
                ),
                Spacer(),
                searchField,
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      ReportContrainer("assets/icons/right.svg"),
                      ReportContrainer("assets/icons/right.svg"),
                      ReportContrainer("assets/icons/greyright.svg"),
                      ReportContrainer("assets/icons/greyright.svg"),
                      ReportContrainer("assets/icons/greyright.svg"),
                      ReportContrainer("assets/icons/greyright.svg"),
                      ReportContrainer("assets/icons/greyright.svg"),
                      ReportContrainer("assets/icons/greyright.svg"),
                      ReportContrainer("assets/icons/greyright.svg"),
                    ],
                  )),
            ),
          ],
        )

    );
  }
}
