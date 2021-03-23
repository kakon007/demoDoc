import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_contrainer_for_prescription.dart';

class PrescriptionScreen extends StatefulWidget {
  @override
  _PrescriptionScreenState createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                hintText: 'Search prescription',
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
                    child: Text("33 Prescription(s) found",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w600),),
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
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                      PrescriptionContrainer(),
                    ],
                  )),
              ),
            ],
          )

    );
  }
}
