import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/advice_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/chief_complaint_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/clinical_history_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/note_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/past_illness_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/disposal_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/past_illness_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/disease_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/investigation_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/investigations_findings_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/medication_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/patient_dermography.dart';
import 'dart:math' as math;

import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/orthosis_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/past_illness_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/procedure_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/provisional_diagnosis_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/referred_OPD_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/referred_doctor_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/use_template_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/vitals_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/advice_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/chief_complaint_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/clinical_history_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/disease_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/investigation_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/medication_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/orthosis_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/past_illness_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/prescription_template_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/procedure_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/provisional_diagnosis_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
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

  init() async {
    await ChiefComplaintViewModel.read(context).getData();
    await ProvisionalDiagnosisViewModel.read(context).getData();
    await PastIllnessViewModel.read(context).getData();
    await ClinicalHistoryViewModel.read(context).getData();
    await AdviceViewModel.read(context).getData();
    await InvestigationViewModel.read(context).getData();
    await DiseaseViewModel.read(context).getData();
    await MedicationViewModel.read(context).getData();
    await OrthosisViewModel.read(context).getData();
    await ProcedureViewModel.read(context).getData();
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
          UseTemplateWidget(),
          PatientDermographyWidget(),
          VitalsWidget(),
          ChiefComplaintWidget(),
          ClinicalHistoryWidget(),
          PastIllnessWidget(),
          ProvisionalDiagnosisWidget(),
          DiseaseWidget(),
          InvestigationWidget(),
          InvestigationFindingsWidget(),
          OrthosisWidget(),
          AdviceWidget(),
          ProcedureWidget(),
          ReferredDoctorWidget(),
          ReferredOPDWidget(),
          MedicationWidget(),
          DisposalWidget(),
          NoteWidget(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffAFBBFF),
                ),
                child: Center(
                    child: Text(
                  "Save as template",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffAFBBFF),
                ),
                child: Center(
                    child: Text(
                  "Submit prescription",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
