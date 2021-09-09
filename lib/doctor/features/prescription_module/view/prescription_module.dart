import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/advice_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/chief_complaint_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/clinical_history_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/disease_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/disposal_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/investigation_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/investigations_findings_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/medication_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/note_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/orthosis_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/past_illness_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/patient_dermography.dart';
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
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/investigation_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/medication_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/orthosis_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/past_illness_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/prescription_template_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/procedure_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/provisional_diagnosis_view_model.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class Module extends StatefulWidget {
  String id;
  String name;
  String age;
  String gender;
  String bloodGroup;
  String phoneNumber;
  String consultationTime;
  String consultType;
  int serial;
  int regNo;
  int doctorNo;
  String consultationId;
  String consultationTypeNo;
  var patTypeNumber;
  var appointmentNumber;
  var departmentNumber;
  var departmentName;
  var consultationNumber;
  var isPatientOut;
  var ipdFlag;
  var companyNumber;

  Module(
      {this.appointmentNumber,
      this.companyNumber,
      this.consultationNumber,
      this.consultationTypeNo,
      this.departmentName,
      this.departmentNumber,
      this.ipdFlag,
      this.isPatientOut,
      this.patTypeNumber,
      this.consultationId,
      this.id,
      this.name,
      this.age,
      this.gender,
      this.bloodGroup,
      this.phoneNumber,
      this.consultationTime,
      this.consultType,
      this.serial,
      this.regNo,
      this.doctorNo});
  @override
  _ModuleState createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  TextEditingController templateNameController = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) => init());
    //Disposal
    var templateVm =
        Provider.of<GetTamplateDataViewModel>(context, listen: false);
    templateVm.chosenDisposalValue = null;
    templateVm.disposalDurationController.clear();
    templateVm.disposalDurationType = null;
    templateVm.disposalSelectedDate = DateTime.now();
//OPD
    templateVm.referredOPDSelectedItems = '';
    //Doctor
    templateVm.referredDoctorSelectedItems = '';
    templateVm.investigationSelectedItems = [];
    templateVm.clinicalHistorySelectedItems = [];
    templateVm.pastIllnessSelectedItems = [];
    templateVm.chiefComplaintSelectedItems = [];
    templateVm.diseaseSelectedItems = [];
    templateVm.provisionalDiagnosisSelectedItems = [];
    templateVm.adviceSelectedItems = [];
    templateVm.multiDoseControlerList = [];
    templateVm.vitals = [];
    templateVm.multiDoseItemList = [];
    templateVm.medicineList = [];
    templateVm.procedureSelectedItems = [];
    templateVm.disposeSelectedItems = [];
    templateVm.opdSelectedItems = [];
    templateVm.doctorSelectedItems = [];
    templateVm.orthosisSelectedItems = [];
    templateVm.investigationFindingItems = [];
    templateVm.noteTextEditingController.clear();
    //vitals
    templateVm.tempTextEditingController.clear();
    templateVm.pulseTextEditingController.clear();
    templateVm.heartRateTextEditingController.clear();
    templateVm.spo2TextEditingController.clear();
    templateVm.resRateTextEditingController.clear();
    templateVm.bpSysTextEditingController.clear();
    templateVm.bpDiaTextEditingController.clear();
    templateVm.minBpTextEditingController.clear();
    templateVm.weightTextEditingController.clear();
    templateVm.heightTextEditingController.clear();
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
    await Provider.of<PrescriptionTamplateViewModel>(context, listen: false)
        .getData();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    var templateVm = Provider.of<GetTamplateDataViewModel>(context);
    var vm = Provider.of<PrescriptionTamplateViewModel>(context, listen: true);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Prescription Module"),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            UseTemplateWidget(),
            PatientDermographyWidget(
              consultationId: widget.consultationId,
              id: widget.id,
              name: widget.name,
              gender: widget.gender,
              serial: widget.serial,
              phoneNumber: widget.phoneNumber,
              bloodGroup: widget.bloodGroup,
              age: widget.age,
              consultationTime: widget.consultationTime,
              consultType: widget.consultType,
              regNo: widget.regNo,
              doctorNo: widget.doctorNo,
            ),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: TextField(
                                          autofocus: false,
                                          textInputAction:
                                              TextInputAction.search,
                                          // focusNode: _searchFieldFocusNode,
                                          controller: templateNameController,
                                          cursorColor: Color(0xffC5CAE8),
                                          decoration: InputDecoration(
                                            //border: InputBorder.none,
                                            hintText: 'Template Name',
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey
                                                    .withOpacity(0.5)),
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
                                      onTap: () async {
                                        if (templateNameController
                                            .text.isEmpty) {
                                          BotToast.showText(
                                              text:
                                                  "Template name field is empty");
                                        } else {
                                          var vm =
                                              GetTamplateDataViewModel.read(
                                                  context);
                                          vm.templateName =
                                              templateNameController.text;
                                          BotToast.showLoading();
                                          await vm.setPrescriptionData();
                                          BotToast.closeAllLoading();
                                          templateNameController.clear();
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Material(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        color: AppTheme.buttonActiveColor,
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
                      ).then((value) async => await Provider.of<PrescriptionTamplateViewModel>(context, listen: false).getData());
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.buttonActiveColor,
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
                    onTap: templateVm.isActive
                        ? null
                        : () {
                            var vm = GetTamplateDataViewModel.read(context);
                            vm.savePrescriptionData(
                              patTypeNumber: widget.patTypeNumber,
                              isPatientOut: widget.isPatientOut,
                              ipdFlag: widget.ipdFlag,
                              departmentNumber: widget.departmentNumber,
                              departmentName: widget.departmentName.toString(),
                              consultationTypeNo: widget.consultationTypeNo,
                              consultationNumber: widget.consultationNumber,
                              companyNumber: widget.companyNumber,
                              appointmentNumber: widget.appointmentNumber,
                              consultationId: widget.consultationId,
                              id: widget.id,
                              name: widget.name,
                              gender: widget.gender,
                              serial: widget.serial,
                              phoneNumber: widget.phoneNumber,
                              bloodGroup: widget.bloodGroup,
                              age: widget.age,
                              consultationTime: widget.consultationTime,
                              consultType: widget.consultType,
                              regNo: widget.regNo,
                              doctorNo: widget.doctorNo,
                            );
                          },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: templateVm.isActive
                            ? Color(0xffAFBBFF)
                            : AppTheme.buttonActiveColor,
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
      ),
    );
  }

  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
        context: context,
        builder: (context) {
          bool isTablet = Responsive.isTablet(context);
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Material(
                type: MaterialType.transparency,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 0, left: 20, right: 20),
                          child: Container(
                            height: 180,
                            width: isTablet ? 450 : 350,
                            decoration: BoxDecoration(
                                //color: HexColor('#f9f2f3'),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xfffdf0f2),
                                    Color(0xffFFFFFF)
                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          fontSize: isTablet ? 18 : 16.0,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  'Do you want to leave without saving?'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: isTablet ? 25 : 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Material(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: Color(0xff354291))),
                                          color: Colors.white,
                                          child: SizedBox(
                                            height: 50,
                                            width: isTablet ? 170 : 120,
                                            child: Center(
                                              child: Text(
                                                "No",
                                                style: GoogleFonts.poppins(
                                                    color: Color(0xff354291),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        isTablet ? 18 : 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Material(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          color: Color(0xff354291),
                                          child: SizedBox(
                                            height: 50,
                                            width: isTablet ? 170 : 120,
                                            child: Center(
                                              child: Text(
                                                "Yes",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        isTablet ? 18 : 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 175,
                      //top: MediaQuery.of(context).size.height / 1.8,
                      left: 100,
                      right: 100,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: Constants.avatarRadius,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Constants.avatarRadius)),
                            child: Image.asset(
                              "assets/images/warning.png",
                              height: 90,
                              width: 90,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    return shouldPop ?? false;
  }
}
