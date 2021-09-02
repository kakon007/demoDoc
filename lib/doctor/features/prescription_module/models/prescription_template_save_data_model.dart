// // To parse this JSON data, do
// //
// //     final prescriptionTemplateSaveModel = prescriptionTemplateSaveModelFromJson(jsonString);
//
import 'dart:convert';

PrescriptionTemplateSaveModel prescriptionTemplateSaveModelFromJson(
        String str) =>
    PrescriptionTemplateSaveModel.fromJson(json.decode(str));

String prescriptionTemplateSaveModelToJson(
        PrescriptionTemplateSaveModel data) =>
    json.encode(data.toJson());

class PrescriptionTemplateSaveModel {
  PrescriptionTemplateSaveModel({
    this.prescriptionTemp,
    this.adviceList,
    this.medicineList,
    this.investigationList,
    this.diagnosisList,
    this.diseaseList,
    this.chiefComplainList,
    this.clinicalHistory2List,
    this.dentalFindingsList,
    this.eyeFindingsList,
    this.dentalTreatment,
    this.clinicalHistory3List,
    this.treatmentList,
    this.eyeAddPowerList,
    this.eyeIpd,
    this.eyeRemarks,
    this.eyeGlassTypeList,
    this.eyeGlassUsageTypeList,
    this.physicalTherapyList,
    this.therapeuticExerciseList,
    this.orthosisList,
    this.dietAdviceList,
    this.note,
    this.disposalList,
    this.medicationList,
  });

  PrescriptionTempData prescriptionTemp;
  List<AdviceListElement> adviceList;
  List<dynamic> medicineList;
  List<InvestigationList> investigationList;
  List<AdviceListElement> diagnosisList;
  List<dynamic> diseaseList;
  List<AdviceListElement> chiefComplainList;
  List<AdviceListElement> clinicalHistory2List;
  List<dynamic> dentalFindingsList;
  List<EyeFindingsList> eyeFindingsList;
  dynamic dentalTreatment;
  List<AdviceListElement> clinicalHistory3List;
  List<AdviceListElement> treatmentList;
  List<dynamic> eyeAddPowerList;
  dynamic eyeIpd;
  dynamic eyeRemarks;
  List<dynamic> eyeGlassTypeList;
  List<dynamic> eyeGlassUsageTypeList;
  List<dynamic> physicalTherapyList;
  List<dynamic> therapeuticExerciseList;
  List<dynamic> orthosisList;
  List<dynamic> dietAdviceList;
  Note note;
  List<dynamic> disposalList;
  List<MedicationList2> medicationList;

  factory PrescriptionTemplateSaveModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionTemplateSaveModel(
        prescriptionTemp: json["prescriptionTemp"] == null
            ? null
            : PrescriptionTempData.fromJson(json["prescriptionTemp"]),
        adviceList: json["adviceList"] == null
            ? []
            : List<AdviceListElement>.from(
                json["adviceList"].map((x) => AdviceListElement.fromJson(x))),
        medicineList: json["medicineList"] == null
            ? []
            : List<dynamic>.from(json["medicineList"].map((x) => x)),
        investigationList: json["investigationList"] == null
            ? []
            : List<InvestigationList>.from(json["investigationList"]
                .map((x) => InvestigationList.fromJson(x))),
        diagnosisList: json["diagnosisList"] == null
            ? []
            : List<AdviceListElement>.from(json["diagnosisList"]
                .map((x) => AdviceListElement.fromJson(x))),
        diseaseList: json["diseaseList"] == null
            ? []
            : List<dynamic>.from(json["diseaseList"].map((x) => x)),
        chiefComplainList: json["chiefComplainList"] == null
            ? []
            : List<AdviceListElement>.from(json["chiefComplainList"]
                .map((x) => AdviceListElement.fromJson(x))),
        clinicalHistory2List: json["clinicalHistory2List"] == null
            ? []
            : List<AdviceListElement>.from(json["clinicalHistory2List"]
                .map((x) => AdviceListElement.fromJson(x))),
        dentalFindingsList: json["dentalFindingsList"] == null
            ? null
            : List<dynamic>.from(json["dentalFindingsList"].map((x) => x)),
        eyeFindingsList: json["eyeFindingsList"] == null
            ? []
            : List<EyeFindingsList>.from(json["eyeFindingsList"]
                .map((x) => EyeFindingsList.fromJson(x))),
        dentalTreatment: json["dentalTreatment"],
        clinicalHistory3List: json["clinicalHistory3List"] == null
            ? []
            : List<AdviceListElement>.from(json["clinicalHistory3List"]
                .map((x) => AdviceListElement.fromJson(x))),
        treatmentList: json["treatmentList"] == null
            ? []
            : List<AdviceListElement>.from(json["treatmentList"]
                .map((x) => AdviceListElement.fromJson(x))),
        eyeAddPowerList: json["eyeAddPowerList"] == null
            ? []
            : List<dynamic>.from(json["eyeAddPowerList"].map((x) => x)),
        eyeIpd: json["eyeIPD"],
        eyeRemarks: json["eyeRemarks"],
        eyeGlassTypeList: json["eyeGlassTypeList"] == null
            ? []
            : List<dynamic>.from(json["eyeGlassTypeList"].map((x) => x)),
        eyeGlassUsageTypeList: json["eyeGlassUsageTypeList"] == null
            ? []
            : List<dynamic>.from(json["eyeGlassUsageTypeList"].map((x) => x)),
        physicalTherapyList: json["physicalTherapyList"] == null
            ? null
            : List<dynamic>.from(json["physicalTherapyList"].map((x) => x)),
        therapeuticExerciseList: json["therapeuticExerciseList"] == null
            ? []
            : List<dynamic>.from(json["therapeuticExerciseList"].map((x) => x)),
        orthosisList: json["orthosisList"] == null
            ? []
            : List<dynamic>.from(json["orthosisList"].map((x) => x)),
        dietAdviceList: json["dietAdviceList"] == null
            ? []
            : List<dynamic>.from(json["dietAdviceList"].map((x) => x)),
        note: json["note"] == null ? null : Note.fromJson(json["note"]),
        disposalList: json["disposalList"] == null
            ? []
            : List<dynamic>.from(json["disposalList"].map((x) => x)),
        medicationList: json["medicationList"] == null
            ? []
            : List<MedicationList2>.from(
                json["medicationList"].map((x) => MedicationList2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "prescriptionTemp":
            prescriptionTemp == null ? null : prescriptionTemp.toJson(),
        "adviceList": adviceList == null
            ? []
            : List<dynamic>.from(adviceList.map((x) => x.toJson())),
        "medicineList": medicineList == null
            ? []
            : List<dynamic>.from(medicineList.map((x) => x)),
        "investigationList": investigationList == null
            ? []
            : List<dynamic>.from(investigationList.map((x) => x.toJson())),
        "diagnosisList": diagnosisList == null
            ? []
            : List<dynamic>.from(diagnosisList.map((x) => x.toJson())),
        "diseaseList": diseaseList == null
            ? []
            : List<dynamic>.from(diseaseList.map((x) => x)),
        "chiefComplainList": chiefComplainList == null
            ? []
            : List<dynamic>.from(chiefComplainList.map((x) => x.toJson())),
        "clinicalHistory2List": clinicalHistory2List == null
            ? []
            : List<dynamic>.from(clinicalHistory2List.map((x) => x.toJson())),
        "dentalFindingsList": dentalFindingsList == null
            ? []
            : List<dynamic>.from(dentalFindingsList.map((x) => x)),
        "eyeFindingsList": eyeFindingsList == null
            ? []
            : List<dynamic>.from(eyeFindingsList.map((x) => x.toJson())),
        "dentalTreatment": dentalTreatment,
        "clinicalHistory3List": clinicalHistory3List == null
            ? []
            : List<dynamic>.from(clinicalHistory3List.map((x) => x.toJson())),
        "treatmentList": treatmentList == null
            ? []
            : List<dynamic>.from(treatmentList.map((x) => x.toJson())),
        "eyeAddPowerList": eyeAddPowerList == null
            ? []
            : List<dynamic>.from(eyeAddPowerList.map((x) => x)),
        "eyeIPD": eyeIpd,
        "eyeRemarks": eyeRemarks,
        "eyeGlassTypeList": eyeGlassTypeList == null
            ? []
            : List<dynamic>.from(eyeGlassTypeList.map((x) => x)),
        "eyeGlassUsageTypeList": eyeGlassUsageTypeList == null
            ? []
            : List<dynamic>.from(eyeGlassUsageTypeList.map((x) => x)),
        "physicalTherapyList": physicalTherapyList == null
            ? []
            : List<dynamic>.from(physicalTherapyList.map((x) => x)),
        "therapeuticExerciseList": therapeuticExerciseList == null
            ? []
            : List<dynamic>.from(therapeuticExerciseList.map((x) => x)),
        "orthosisList": orthosisList == null
            ? []
            : List<dynamic>.from(orthosisList.map((x) => x)),
        "dietAdviceList": dietAdviceList == null
            ? []
            : List<dynamic>.from(dietAdviceList.map((x) => x)),
        "note": note == null ? null : note.toJson(),
        "disposalList": disposalList == null
            ? []
            : List<dynamic>.from(disposalList.map((x) => x)),
        "medicationList": medicationList == null
            ? []
            : List<dynamic>.from(medicationList.map((x) => x.toJson())),
      };
}

class AdviceListElement {
  AdviceListElement({
    // this.followUpDate,
    // this.selected,
    // this.inReportSerial,
    // this.isDeleted,
    // this.referenceId,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    // this.doctorNo,
    // this.duration,
    // this.durationMu,
    // this.continueFlag,
    // this.findingsClob,
  });

  // DateTime followUpDate;
  // int selected;
  // int inReportSerial;
  // int isDeleted;
  // dynamic referenceId;
  String preDiagnosisVal;
  int preDiagnosisValType;
  // int doctorNo;
  // dynamic duration;
  // dynamic durationMu;
  // dynamic continueFlag;
  // dynamic findingsClob;

  factory AdviceListElement.fromJson(Map<String, dynamic> json) =>
      AdviceListElement(
        // followUpDate: json["followUpDate"] == null
        //     ? null
        //     : DateTime.parse(json["followUpDate"]),
        // selected: json["selected"] == null ? null : json["selected"],
        // inReportSerial:
        //     json["inReportSerial"] == null ? null : json["inReportSerial"],
        // isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        // referenceId: json["referenceId"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        // doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
        // duration: json["duration"],
        // durationMu: json["durationMu"],
        // continueFlag: json["continueFlag"],
        // findingsClob: json["findingsClob"],
      );

  Map<String, dynamic> toJson() => {
        // "followUpDate":
        //     followUpDate == null ? null : followUpDate.toIso8601String(),
        // "selected": selected == null ? null : selected,
        // "inReportSerial": inReportSerial == null ? null : inReportSerial,
        // "isDeleted": isDeleted == null ? null : isDeleted,
        // "referenceId": referenceId,
        "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
        "preDiagnosisValType":
            preDiagnosisValType == null ? null : preDiagnosisValType,
        // "doctorNo": doctorNo == null ? null : doctorNo,
        // "duration": duration,
        // "durationMu": durationMu,
        // "continueFlag": continueFlag,
        // "findingsClob": findingsClob,
      };
}

class EyeFindingsList {
  EyeFindingsList({
    this.middleValue,
  });

  String middleValue;

  factory EyeFindingsList.fromJson(Map<String, dynamic> json) =>
      EyeFindingsList(
        middleValue: json["middleValue"] == null ? null : json["middleValue"],
      );

  Map<String, dynamic> toJson() => {
        "middleValue": middleValue == null ? null : middleValue,
      };
}

class InvestigationList {
  InvestigationList({
    // this.activeStatus,
    // this.inReportSerial,
    // this.isDeleted,
    this.itemTypeNo,
    // this.itemName,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    // this.referenceId,
  });

  // int activeStatus;
  // int inReportSerial;
  // int isDeleted;
  int itemTypeNo;
  // String itemName;
  String preDiagnosisVal;
  int preDiagnosisValType;
  // int referenceId;

  factory InvestigationList.fromJson(Map<String, dynamic> json) =>
      InvestigationList(
        // activeStatus:
        //     json["activeStatus"] == null ? null : json["activeStatus"],
        // inReportSerial:
        //     json["inReportSerial"] == null ? null : json["inReportSerial"],
        // isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        itemTypeNo: json["itemTypeNo"] == null ? null : json["itemTypeNo"],
        // itemName: json["itemName"] == null ? null : json["itemName"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        // referenceId: json["referenceId"] == null ? null : json["referenceId"],
      );

  Map<String, dynamic> toJson() => {
        // "activeStatus": activeStatus == null ? null : activeStatus,
        // "inReportSerial": inReportSerial == null ? null : inReportSerial,
        // "isDeleted": isDeleted == null ? null : isDeleted,
        "itemTypeNo": itemTypeNo == null ? null : itemTypeNo,
        // "itemName": itemName == null ? null : itemName,
        "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
        "preDiagnosisValType":
            preDiagnosisValType == null ? null : preDiagnosisValType,
        // "referenceId": referenceId == null ? null : referenceId,
      };
}

class MedicationList2 {
  MedicationList2({
    this.presMedDtlList,
    this.genericName,
    this.brandName,
    this.form,
    this.formName,
    this.itemNo,
    this.strength,
    this.route,
    this.preDiagnosisValType,
    this.medicineStat,
    this.inReportSerial,
  });

  List<PresMedDtlList2> presMedDtlList;
  String genericName;
  String brandName;
  dynamic form;
  dynamic formName;
  int itemNo;
  dynamic strength;
  String route;
  int preDiagnosisValType;
  String medicineStat;
  int inReportSerial;

  factory MedicationList2.fromJson(Map<String, dynamic> json) =>
      MedicationList2(
        presMedDtlList: json["presMedDtlList"] == null
            ? null
            : List<dynamic>.from(json["presMedDtlList"].map((x) => x)),
        genericName: json["genericName"] == null ? null : json["genericName"],
        brandName: json["brandName"] == null ? null : json["brandName"],
        form: json["form"],
        formName: json["formName"],
        itemNo: json["itemNo"] == null ? null : json["itemNo"],
        strength: json["strength"],
        route: json["route"] == null ? null : json["route"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        medicineStat:
            json["medicineStat"] == null ? null : json["medicineStat"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
      );

  Map<String, dynamic> toJson() => {
        "presMedDtlList": presMedDtlList == null
            ? null
            : List<dynamic>.from(presMedDtlList.map((x) => x)),
        "genericName": genericName == null ? null : genericName,
        "brandName": brandName == null ? null : brandName,
        "form": form,
        "formName": formName,
        "itemNo": itemNo == null ? null : itemNo,
        "strength": strength,
        "route": route == null ? null : route,
        "preDiagnosisValType":
            preDiagnosisValType == null ? null : preDiagnosisValType,
        "medicineStat": medicineStat == null ? null : medicineStat,
        "inReportSerial": inReportSerial == null ? null : inReportSerial,
      };
}

class Note {
  Note({
    this.followUpDate,
    this.selected,
    this.inReportSerial,
    this.isDeleted,
    this.preDiagnosisValType,
    this.preDiagnosisVal,
  });

  DateTime followUpDate;
  int selected;
  int inReportSerial;
  int isDeleted;
  int preDiagnosisValType;
  String preDiagnosisVal;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        followUpDate: json["followUpDate"] == null
            ? null
            : DateTime.parse(json["followUpDate"]),
        selected: json["selected"] == null ? null : json["selected"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
      );

  Map<String, dynamic> toJson() => {
        "followUpDate":
            followUpDate == null ? null : followUpDate.toIso8601String(),
        "selected": selected == null ? null : selected,
        "inReportSerial": inReportSerial == null ? null : inReportSerial,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "preDiagnosisValType":
            preDiagnosisValType == null ? null : preDiagnosisValType,
        "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
      };
}

class PresMedDtlList2 {
  PresMedDtlList2({
    this.dosage,
    this.duration,
    this.durationMu,
    this.inReportSerial,
    this.itemQty,
    this.medicineComment,
  });

  String dosage;
  String duration;
  String durationMu;
  int inReportSerial;
  int itemQty;
  String medicineComment;

  factory PresMedDtlList2.fromJson(Map<String, dynamic> json) =>
      PresMedDtlList2(
        dosage: json["dosage"],
        duration: json["duration"],
        durationMu: json["durationMu"],
        inReportSerial: json["inReportSerial"],
        itemQty: json["itemQty"],
        medicineComment: json["medicineComment"],
      );

  Map<String, dynamic> toJson() => {
        "dosage": dosage,
        "duration": duration,
        "durationMu": durationMu,
        "inReportSerial": inReportSerial,
        "itemQty": itemQty,
        "medicineComment": medicineComment,
      };
}

class PrescriptionTempData {
  PrescriptionTempData({
    this.activeStatus,
    this.templateName,
    this.departmentNo,
  });

  int activeStatus;
  String templateName;
  dynamic departmentNo;

  factory PrescriptionTempData.fromJson(Map<String, dynamic> json) =>
      PrescriptionTempData(
        activeStatus: json["activeStatus"] == null ? 1 : json["activeStatus"],
        templateName:
            json["templateName"] == null ? null : json["templateName"],
        departmentNo: json["departmentNo"],
      );

  Map<String, dynamic> toJson() => {
        "activeStatus": activeStatus == null ? 1 : activeStatus,
        "templateName": templateName == null ? null : templateName,
        "departmentNo": departmentNo,
      };
}

// import 'dart:convert';
//
// PrescriptionTemplateSaveModel prescriptionTemplateSaveModelFromJson(
//         String str) =>
//     PrescriptionTemplateSaveModel.fromJson(json.decode(str));
//
// String prescriptionTemplateSaveModelToJson(
//         PrescriptionTemplateSaveModel data) =>
//     json.encode(data.toJson());
//
// class PrescriptionTemplateSaveModel {
//   PrescriptionTemplateSaveModel({
//     this.prescriptionTemp,
//     this.adviceList,
//     this.medicineList,
//     this.investigationList,
//     this.diagnosisList,
//     this.diseaseList,
//     this.chiefComplainList,
//     this.clinicalHistory2List,
//     this.dentalFindingsList,
//     this.eyeFindingsList,
//     this.dentalTreatment,
//     this.clinicalHistory3List,
//     this.treatmentList,
//     this.eyeAddPowerList,
//     this.eyeIpd,
//     this.eyeRemarks,
//     this.eyeGlassTypeList,
//     this.eyeGlassUsageTypeList,
//     this.physicalTherapyList,
//     this.therapeuticExerciseList,
//     this.orthosisList,
//     this.dietAdviceList,
//     this.note,
//     this.disposalList,
//     this.medicationList,
//   });
//
//   PrescriptionTempData prescriptionTemp;
//   List<Note2> adviceList;
//   List<dynamic> medicineList;
//   List<InvestigationList> investigationList;
//   List<Note2> diagnosisList;
//   List<Note2> diseaseList;
//   List<Note2> chiefComplainList;
//   List<Note2> clinicalHistory2List;
//   List<dynamic> dentalFindingsList;
//   List<EyeFindingsList> eyeFindingsList;
//   dynamic dentalTreatment;
//   List<Note2> clinicalHistory3List;
//   List<Note2> treatmentList;
//   List<dynamic> eyeAddPowerList;
//   dynamic eyeIpd;
//   dynamic eyeRemarks;
//   List<dynamic> eyeGlassTypeList;
//   List<dynamic> eyeGlassUsageTypeList;
//   List<dynamic> physicalTherapyList;
//   List<dynamic> therapeuticExerciseList;
//   List<dynamic> orthosisList;
//   List<dynamic> dietAdviceList;
//   Note2 note;
//   List<dynamic> disposalList;
//   List<MedicationList> medicationList;
//
//   factory PrescriptionTemplateSaveModel.fromJson(Map<String, dynamic> json) =>
//       PrescriptionTemplateSaveModel(
//         prescriptionTemp:
//             PrescriptionTempData.fromJson(json["prescriptionTemp"]),
//         adviceList:
//             List<Note2>.from(json["adviceList"].map((x) => Note2.fromJson(x))),
//         medicineList: List<dynamic>.from(json["medicineList"].map((x) => x)),
//         investigationList: List<InvestigationList>.from(
//             json["investigationList"]
//                 .map((x) => InvestigationList.fromJson(x))),
//         diagnosisList: List<Note2>.from(
//             json["diagnosisList"].map((x) => Note2.fromJson(x))),
//         diseaseList:
//             List<Note2>.from(json["diseaseList"].map((x) => Note2.fromJson(x))),
//         chiefComplainList: List<Note2>.from(
//             json["chiefComplainList"].map((x) => Note2.fromJson(x))),
//         clinicalHistory2List: List<Note2>.from(
//             json["clinicalHistory2List"].map((x) => Note2.fromJson(x))),
//         dentalFindingsList:
//             List<dynamic>.from(json["dentalFindingsList"].map((x) => x)),
//         eyeFindingsList: List<EyeFindingsList>.from(
//             json["eyeFindingsList"].map((x) => EyeFindingsList.fromJson(x))),
//         dentalTreatment: json["dentalTreatment"],
//         clinicalHistory3List: List<Note2>.from(
//             json["clinicalHistory3List"].map((x) => Note2.fromJson(x))),
//         treatmentList: List<Note2>.from(
//             json["treatmentList"].map((x) => Note2.fromJson(x))),
//         eyeAddPowerList:
//             List<dynamic>.from(json["eyeAddPowerList"].map((x) => x)),
//         eyeIpd: json["eyeIPD"],
//         eyeRemarks: json["eyeRemarks"],
//         eyeGlassTypeList:
//             List<dynamic>.from(json["eyeGlassTypeList"].map((x) => x)),
//         eyeGlassUsageTypeList:
//             List<dynamic>.from(json["eyeGlassUsageTypeList"].map((x) => x)),
//         physicalTherapyList:
//             List<dynamic>.from(json["physicalTherapyList"].map((x) => x)),
//         therapeuticExerciseList:
//             List<dynamic>.from(json["therapeuticExerciseList"].map((x) => x)),
//         orthosisList: List<dynamic>.from(json["orthosisList"].map((x) => x)),
//         dietAdviceList:
//             List<dynamic>.from(json["dietAdviceList"].map((x) => x)),
//         note: Note2.fromJson(json["note"]),
//         disposalList: List<dynamic>.from(json["disposalList"].map((x) => x)),
//         medicationList: List<MedicationList>.from(
//             json["medicationList"].map((x) => MedicationList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "prescriptionTemp": prescriptionTemp.toJson(),
//         "adviceList": List<Note2>.from(adviceList.map((x) => x.toJson())),
//         "medicineList": List<Note2>.from(medicineList.map((x) => x)),
//         "investigationList": List<InvestigationList>.from(
//             investigationList.map((x) => x.toJson())),
//         "diagnosisList": List<Note2>.from(diagnosisList.map((x) => x.toJson())),
//         "diseaseList": List<Note2>.from(diseaseList.map((x) => x.toJson())),
//         "chiefComplainList":
//             List<Note2>.from(chiefComplainList.map((x) => x.toJson())),
//         "clinicalHistory2List":
//             List<Note2>.from(clinicalHistory2List.map((x) => x.toJson())),
//         "dentalFindingsList":
//             List<Note2>.from(dentalFindingsList.map((x) => x)),
//         "eyeFindingsList":
//             List<Note2>.from(eyeFindingsList.map((x) => x.toJson())),
//         "dentalTreatment": dentalTreatment,
//         "clinicalHistory3List":
//             List<Note2>.from(clinicalHistory3List.map((x) => x.toJson())),
//         "treatmentList": List<Note2>.from(treatmentList.map((x) => x.toJson())),
//         "eyeAddPowerList": List<Note2>.from(eyeAddPowerList.map((x) => x)),
//         "eyeIPD": eyeIpd,
//         "eyeRemarks": eyeRemarks,
//         "eyeGlassTypeList": List<Note2>.from(eyeGlassTypeList.map((x) => x)),
//         "eyeGlassUsageTypeList":
//             List<Note2>.from(eyeGlassUsageTypeList.map((x) => x)),
//         "physicalTherapyList":
//             List<Note2>.from(physicalTherapyList.map((x) => x)),
//         "therapeuticExerciseList":
//             List<Note2>.from(therapeuticExerciseList.map((x) => x)),
//         "orthosisList": List<Note2>.from(orthosisList.map((x) => x)),
//         "dietAdviceList": List<Note2>.from(dietAdviceList.map((x) => x)),
//         "note": note.toJson(),
//         "disposalList": List<Note2>.from(disposalList.map((x) => x)),
//         "medicationList":
//             List<MedicationList>.from(medicationList.map((x) => x.toJson())),
//       };
// }
//
// class Note2 {
//   Note2({
//     this.preDiagnosisVal,
//     this.preDiagnosisValType,
//   });
//
//   String preDiagnosisVal;
//   int preDiagnosisValType;
//
//   factory Note2.fromJson(Map<String, dynamic> json) => Note2(
//         preDiagnosisVal: json["preDiagnosisVal"],
//         preDiagnosisValType: json["preDiagnosisValType"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "preDiagnosisVal": preDiagnosisVal,
//         "preDiagnosisValType": preDiagnosisValType,
//       };
// }
//
// class EyeFindingsList {
//   EyeFindingsList({
//     this.middleValue,
//   });
//
//   String middleValue;
//
//   factory EyeFindingsList.fromJson(Map<String, dynamic> json) =>
//       EyeFindingsList(
//         middleValue: json["middleValue"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "middleValue": middleValue,
//       };
// }
//
// class InvestigationList {
//   InvestigationList({
//     this.preDiagnosisVal,
//     this.itemTypeNo,
//     this.preDiagnosisValType,
//   });
//
//   String preDiagnosisVal;
//   int itemTypeNo;
//   int preDiagnosisValType;
//
//   factory InvestigationList.fromJson(Map<String, dynamic> json) =>
//       InvestigationList(
//         preDiagnosisVal: json["preDiagnosisVal"],
//         itemTypeNo: json["itemTypeNo"],
//         preDiagnosisValType: json["preDiagnosisValType"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "preDiagnosisVal": preDiagnosisVal,
//         "itemTypeNo": itemTypeNo,
//         "preDiagnosisValType": preDiagnosisValType,
//       };
// }
//
// class MedicationList {
//   MedicationList({
//     this.presMedDtlList,
//     this.genericName,
//     this.brandName,
//     this.itemNo,
//     this.route,
//     this.preDiagnosisValType,
//   });
//
//   List<PresMedDtlList> presMedDtlList;
//   String genericName;
//   String brandName;
//   int itemNo;
//   String route;
//   int preDiagnosisValType;
//
//   factory MedicationList.fromJson(Map<String, dynamic> json) => MedicationList(
//         presMedDtlList: List<PresMedDtlList>.from(
//             json["presMedDtlList"].map((x) => PresMedDtlList.fromJson(x))),
//         genericName: json["genericName"],
//         brandName: json["brandName"],
//         itemNo: json["itemNo"],
//         route: json["route"],
//         preDiagnosisValType: json["preDiagnosisValType"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "presMedDtlList":
//             List<dynamic>.from(presMedDtlList.map((x) => x.toJson())),
//         "genericName": genericName,
//         "brandName": brandName,
//         "itemNo": itemNo,
//         "route": route,
//         "preDiagnosisValType": preDiagnosisValType,
//       };
// }
//
// class PresMedDtlList {
//   PresMedDtlList({
//     this.dosage,
//     this.duration,
//     this.durationMu,
//     this.inReportSerial,
//     this.itemQty,
//     this.medicineComment,
//   });
//
//   String dosage;
//   String duration;
//   String durationMu;
//   int inReportSerial;
//   int itemQty;
//   String medicineComment;
//
//   factory PresMedDtlList.fromJson(Map<String, dynamic> json) => PresMedDtlList(
//         dosage: json["dosage"],
//         duration: json["duration"],
//         durationMu: json["durationMu"],
//         inReportSerial: json["inReportSerial"],
//         itemQty: json["itemQty"],
//         medicineComment: json["medicineComment"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "dosage": dosage,
//         "duration": duration,
//         "durationMu": durationMu,
//         "inReportSerial": inReportSerial,
//         "itemQty": itemQty,
//         "medicineComment": medicineComment,
//       };
// }
//
// class PrescriptionTempData {
//   PrescriptionTempData({
//     this.activeStatus,
//     this.templateName,
//     this.departmentNo,
//   });
//
//   int activeStatus;
//   String templateName;
//   dynamic departmentNo;
//
//   factory PrescriptionTempData.fromJson(Map<String, dynamic> json) =>
//       PrescriptionTempData(
//         activeStatus: json["activeStatus"],
//         templateName: json["templateName"],
//         departmentNo: json["departmentNo"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "activeStatus": activeStatus,
//         "templateName": templateName,
//         "departmentNo": departmentNo,
//       };
// }
