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
    Padding(padding: EdgeInsets.all(50),child: Container(
      height: 10,
        child: Theme(
          data: theme.copyWith(primaryColor: Colors.red),
          child: new TextField(
            decoration: new InputDecoration(
              labelText: "Hello",
              labelStyle: theme.textTheme.caption.copyWith(color: theme.primaryColor),
            ),
          ),
        )),);
    return Scaffold(
      body:

      Stack(
        children: [
          SingleChildScrollView(
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
            )),Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color:Colors.white,child: searchField),
            )]
      ),
    );
  }
}
