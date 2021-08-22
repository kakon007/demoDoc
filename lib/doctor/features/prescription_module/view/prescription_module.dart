import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';

class Module extends StatefulWidget {
  @override
  _ModuleState createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescription Module"),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          tapHeaderToExpand: true,
          iconColor: Colors.blue,
          useInkWell: false,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            PrescriptionCommonWidget(),
            // Card3(),
          ],
        ),
      ),
    );
  }
}
