import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/advice_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/chief_complaint_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/disease_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/investigation_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/oethosis_widget.dart';
import 'dart:math' as math;

import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/procedure_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/provisional_diagnosis_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/advice_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/chief_complaint_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/provisional_diagnosis_view_model.dart';
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
    ProvisionalDiagnosisViewModel.read(context).getData();
    AdviceViewModel.read(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescription Module"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ChiefComplaintWidget(),
          // ProvisionalDiagnosisWidget(),
          // DiseaseWidget(),
          // InvestigationWidget(),
          OrthosisWidget(),
          AdviceWidget(),
          ProcedureWidget(),
        ],
      ),
    );
  }
}
