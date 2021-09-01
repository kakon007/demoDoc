import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class Module extends StatefulWidget {
  @override
  _ModuleState createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  TextEditingController templateNameController = TextEditingController();
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
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        int selectedRadio = null;
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Save Templates",
                                  style: GoogleFonts.poppins(
                                      // color: HexColor(
                                      //   '#354291',
                                      // ),
                                      fontSize: isTablet
                                          ? 20
                                          : width <= 330
                                              ? 14
                                              : 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close))
                              ],
                            ),
                          ),
                          content: StatefulBuilder(
                              builder: (context, StateSetter setState) {
                            return Container(
                              height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: deviceWidth <= 360
                                        ? deviceWidth * .38
                                        : MediaQuery.of(context).size.width *
                                            .60,
                                    height: 50,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(25),
                                    //   color: Colors.white,
                                    //   border: Border.all(color: HexColor('#E1E1E1')),
                                    // ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: TextField(
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        // focusNode: _searchFieldFocusNode,
                                        controller: templateNameController,
                                        cursorColor: Color(0xffC5CAE8),
                                        decoration: InputDecoration(
                                          //border: InputBorder.none,
                                          hintText: 'Template Name',
                                          hintStyle: GoogleFonts.poppins(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          fillColor: Colors.white,
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff354291)
                                                    .withOpacity(0.5),
                                                width: 1.5),
                                            //borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF1F1F1)),
                                            //  when the TextFormField in unfocused
                                          ),
                                        ),
                                        key: Key('notCompletedSearchKey'),
                                        onSubmitted: (v) {
                                          //vm.search(_searchTextEditingController1.text, widget.accessToken);
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      SVProgressHUD.show(status: "Please Wait");
                                      SVProgressHUD.dismiss();
                                      Navigator.pop(context);
                                    },
                                    child: Material(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      color: selectedRadio == null
                                          ? AppTheme.buttonInActiveColor
                                          : AppTheme.buttonActiveColor,
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: deviceWidth <= 360 ? 28 : 40,
                                        child: Center(
                                          child: Text(
                                            "Save",
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: isTablet
                                                    ? 15
                                                    : deviceWidth <= 360 &&
                                                            deviceWidth > 330
                                                        ? 9
                                                        : deviceWidth <= 330
                                                            ? 8
                                                            : 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        );
                      },
                    );
                  },
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
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
