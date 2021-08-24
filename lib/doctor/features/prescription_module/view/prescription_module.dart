import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/chief_complaint_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/clinical_history_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/past_illness_widget.dart';
import 'dart:math' as math;

import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/chief_complaint_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/clinical_history_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/past_illness_view_model.dart';
import 'package:provider/provider.dart';

class Module extends StatefulWidget {
  @override
  _ModuleState createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) => init());
    super.initState();
  }

  init() {
    ChiefComplaintViewModel.read(context).getData();
    PastIllnessViewModel.read(context).getData();
    ClinicalHistoryViewModel.read(context).getData();
  }

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
            ChiefComplaintWidget(),
            ClinicalHistoryWidget(),
            PastIllnessWidget(),
          ],
        ),
      ),
    );
  }
}
