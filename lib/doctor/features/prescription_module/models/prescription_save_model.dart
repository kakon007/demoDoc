// To parse this JSON data, do
//
//     final prescriptionSaveModel = prescriptionSaveModelFromJson(jsonString);

import 'dart:convert';

PrescriptionSaveModel prescriptionSaveModelFromJson(String str) =>
    PrescriptionSaveModel.fromJson(json.decode(str));

String prescriptionSaveModelToJson(PrescriptionSaveModel data) =>
    json.encode(data.toJson());

class PrescriptionSaveModel {
  PrescriptionSaveModel({
    this.prescription,
    this.vitalList,
    this.adviceList,
    this.medicineList,
    this.diagnosisList,
    this.chiefComplainList,
    this.clinicalHistory2List,
    this.clinicalHistory3List,
    this.disposalList,
    this.referralList,
    this.physicalExamList,
    this.opdVitalList,
    this.investigationList,
    this.investigationFindingsList,
    this.diseaseList,
    this.dentalFindingsList,
    this.dentalTreatment,
    this.eyeFindingsList,
    this.treatmentList,
    this.referralDoctorList,
    this.dietAdviceList,
    this.referredToWard,
    this.note,
    this.medicationList,
    this.orthosisList,
  });

  Prescription prescription;
  List<SaveVitalList> vitalList;
  List<SaveAdviceListElement> adviceList;
  List<dynamic> medicineList;
  List<SaveAdviceListElement> diagnosisList;
  List<SaveChiefComplainList> chiefComplainList;
  List<SaveClinicalHistory2ListElement> clinicalHistory2List;
  List<SaveAdviceListElement> clinicalHistory3List;
  List<SaveAdviceListElement> orthosisList;
  List<SaveDisposalList> disposalList;
  List<SaveClinicalHistory2ListElement> referralList;
  List<dynamic> physicalExamList;
  List<dynamic> opdVitalList;
  List<SaveInvestigationList> investigationList;
  List<SaveInvestigationList> investigationFindingsList;
  List<SaveClinicalHistory2ListElement> diseaseList;
  List<dynamic> dentalFindingsList;
  dynamic dentalTreatment;
  List<dynamic> eyeFindingsList;
  List<SaveClinicalHistory2ListElement> treatmentList;
  List<SaveClinicalHistory2ListElement> referralDoctorList;
  List<dynamic> dietAdviceList;
  dynamic referredToWard;
  SaveNote note;
  List<SaveMedicationList> medicationList;

  factory PrescriptionSaveModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionSaveModel(
        prescription: json["prescription"] == null
            ? null
            : Prescription.fromJson(json["prescription"]),
        vitalList: json["vitalList"] == null
            ? null
            : List<SaveVitalList>.from(
                json["vitalList"].map((x) => SaveVitalList.fromJson(x))),
        adviceList: json["adviceList"] == null
            ? null
            : List<SaveAdviceListElement>.from(json["adviceList"]
                .map((x) => SaveAdviceListElement.fromJson(x))),
        medicineList: json["medicineList"] == null
            ? null
            : List<dynamic>.from(json["medicineList"].map((x) => x)),
        diagnosisList: json["diagnosisList"] == null
            ? null
            : List<SaveAdviceListElement>.from(json["diagnosisList"]
                .map((x) => SaveAdviceListElement.fromJson(x))),
        chiefComplainList: json["chiefComplainList"] == null
            ? null
            : List<SaveChiefComplainList>.from(json["chiefComplainList"]
                .map((x) => SaveChiefComplainList.fromJson(x))),
        clinicalHistory2List: json["clinicalHistory2List"] == null
            ? null
            : List<SaveClinicalHistory2ListElement>.from(
                json["clinicalHistory2List"]
                    .map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
        clinicalHistory3List: json["clinicalHistory3List"] == null
            ? null
            : List<SaveAdviceListElement>.from(json["clinicalHistory3List"]
                .map((x) => SaveAdviceListElement.fromJson(x))),
        disposalList: json["disposalList"] == null
            ? null
            : List<SaveDisposalList>.from(
                json["disposalList"].map((x) => SaveDisposalList.fromJson(x))),
        referralList: json["referralList"] == null
            ? null
            : List<SaveClinicalHistory2ListElement>.from(json["referralList"]
                .map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
        physicalExamList: json["physicalExamList"] == null
            ? null
            : List<dynamic>.from(json["physicalExamList"].map((x) => x)),
        opdVitalList: json["opdVitalList"] == null
            ? null
            : List<dynamic>.from(json["opdVitalList"].map((x) => x)),
        investigationList: json["investigationList"] == null
            ? null
            : List<SaveInvestigationList>.from(json["investigationList"]
                .map((x) => SaveInvestigationList.fromJson(x))),
        investigationFindingsList: json["investigationFindingsList"] == null
            ? null
            : List<SaveInvestigationList>.from(json["investigationFindingsList"]
                .map((x) => SaveInvestigationList.fromJson(x))),
        diseaseList: json["diseaseList"] == null
            ? null
            : List<SaveClinicalHistory2ListElement>.from(json["diseaseList"]
                .map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
        dentalFindingsList: json["dentalFindingsList"] == null
            ? null
            : List<dynamic>.from(json["dentalFindingsList"].map((x) => x)),
        dentalTreatment: json["dentalTreatment"],
        eyeFindingsList: json["eyeFindingsList"] == null
            ? null
            : List<dynamic>.from(json["eyeFindingsList"].map((x) => x)),
        treatmentList: json["treatmentList"] == null
            ? null
            : List<SaveClinicalHistory2ListElement>.from(json["treatmentList"]
                .map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
        referralDoctorList: json["referralDoctorList"] == null
            ? null
            : List<SaveClinicalHistory2ListElement>.from(
                json["referralDoctorList"]
                    .map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
        dietAdviceList: json["dietAdviceList"] == null
            ? null
            : List<dynamic>.from(json["dietAdviceList"].map((x) => x)),
        referredToWard: json["referredToWard"],
        note: json["note"] == null ? null : SaveNote.fromJson(json["note"]),
        medicationList: json["medicationList"] == null
            ? null
            : List<SaveMedicationList>.from(json["medicationList"]
                .map((x) => SaveMedicationList.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    var pres = {
      "prescription": prescription == null ? null : prescription.toJson(),
      "vitalList": vitalList == null
          ? []
          : List<dynamic>.from(vitalList.map((x) => x.toJson())),
      "adviceList": adviceList == null
          ? []
          : List<dynamic>.from(adviceList.map((x) => x.toJson())),
      "medicineList": medicineList == null
          ? []
          : List<dynamic>.from(medicineList.map((x) => x)),
      "diagnosisList": diagnosisList == null
          ? []
          : List<dynamic>.from(diagnosisList.map((x) => x.toJson())),
      "chiefComplainList": chiefComplainList == null
          ? []
          : List<dynamic>.from(chiefComplainList.map((x) => x.toJson())),
      "clinicalHistory2List": clinicalHistory2List == null
          ? []
          : List<dynamic>.from(clinicalHistory2List.map((x) => x.toJson())),
      "clinicalHistory3List": clinicalHistory3List == null
          ? []
          : List<dynamic>.from(clinicalHistory3List.map((x) => x.toJson())),
      "orthosisList": orthosisList == null
          ? []
          : List<dynamic>.from(orthosisList.map((x) => x.toJson())),
      "disposalList": disposalList == null
          ? []
          : List<dynamic>.from(disposalList.map((x) => x.toJson())),
      "referralList": referralList == null
          ? []
          : List<dynamic>.from(referralList.map((x) => x.toJson())),
      "physicalExamList": physicalExamList == null
          ? []
          : List<dynamic>.from(physicalExamList.map((x) => x)),
      "opdVitalList": opdVitalList == null
          ? []
          : List<dynamic>.from(opdVitalList.map((x) => x)),
      "investigationList": investigationList == null
          ? []
          : List<dynamic>.from(investigationList.map((x) => x.toJson())),
      "investigationFindingsList": investigationFindingsList == null
          ? []
          : List<dynamic>.from(
              investigationFindingsList.map((x) => x.toJson())),
      "diseaseList": diseaseList == null
          ? []
          : List<dynamic>.from(diseaseList.map((x) => x.toJson())),
      "dentalFindingsList": dentalFindingsList == null
          ? []
          : List<dynamic>.from(dentalFindingsList.map((x) => x)),
      "dentalTreatment": dentalTreatment,
      "eyeFindingsList": eyeFindingsList == null
          ? []
          : List<dynamic>.from(eyeFindingsList.map((x) => x)),
      "treatmentList": treatmentList == null
          ? []
          : List<dynamic>.from(treatmentList.map((x) => x.toJson())),
      "referralDoctorList": referralDoctorList == null
          ? []
          : List<dynamic>.from(referralDoctorList.map((x) => x.toJson())),
      "dietAdviceList": dietAdviceList == null
          ? []
          : List<dynamic>.from(dietAdviceList.map((x) => x)),
      "referredToWard": referredToWard,
      "note": note == null ? "" : note.toJson(),
      "medicationList": medicationList == null
          ? []
          : List<dynamic>.from(medicationList.map((x) => x.toJson())),
    };
    pres.removeWhere((key, value) => value == null || value == '');
    return pres;
  }
}

class SaveAdviceListElement {
  SaveAdviceListElement({
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

  factory SaveAdviceListElement.fromJson(Map<String, dynamic> json) =>
      SaveAdviceListElement(
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

  Map<String, dynamic> toJson() {
    var data = {
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
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SaveChiefComplainList {
  SaveChiefComplainList({
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
    // this.id,
    // this.preDiagnosisValLocal,
    // this.preDiagnosisValShort,
    // this.preDiagnosisValUnit,
    // this.preDiagnosisValDefaultVal,
    // this.orderSl,
    // this.preDiagnosisValInputType,
    // this.departmentNo,
    // this.activeStatus,
    // this.calculationMethod,
    // this.companyNo,
    // this.organizationNo,
  });

  // DateTime followUpDate;
  // int selected;
  // int inReportSerial;
  // int isDeleted;
  // dynamic referenceId;
  String preDiagnosisVal;
  dynamic preDiagnosisValType;
  // int doctorNo;
  // dynamic duration;
  // dynamic durationMu;
  // dynamic continueFlag;
  // dynamic findingsClob;
  // int id;
  // dynamic preDiagnosisValLocal;
  // dynamic preDiagnosisValShort;
  // dynamic preDiagnosisValUnit;
  // dynamic preDiagnosisValDefaultVal;
  // dynamic orderSl;
  // dynamic preDiagnosisValInputType;
  // dynamic departmentNo;
  // int activeStatus;
  // dynamic calculationMethod;
  // int companyNo;
  // int organizationNo;

  factory SaveChiefComplainList.fromJson(Map<String, dynamic> json) =>
      SaveChiefComplainList(
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
        preDiagnosisValType: json["preDiagnosisValType"],
        // doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
        // duration: json["duration"],
        // durationMu: json["durationMu"],
        // continueFlag: json["continueFlag"],
        // findingsClob: json["findingsClob"],
        // id: json["id"] == null ? null : json["id"],
        // preDiagnosisValLocal: json["preDiagnosisValLocal"],
        // preDiagnosisValShort: json["preDiagnosisValShort"],
        // preDiagnosisValUnit: json["preDiagnosisValUnit"],
        // preDiagnosisValDefaultVal: json["preDiagnosisValDefaultVal"],
        // orderSl: json["orderSl"],
        // preDiagnosisValInputType: json["preDiagnosisValInputType"],
        // departmentNo: json["departmentNo"],
        // activeStatus:
        //     json["activeStatus"] == null ? null : json["activeStatus"],
        // calculationMethod: json["calculationMethod"],
        // companyNo: json["companyNo"] == null ? null : json["companyNo"],
        // organizationNo:
        //     json["organizationNo"] == null ? null : json["organizationNo"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      // "followUpDate":
      //     followUpDate == null ? null : followUpDate.toIso8601String(),
      // "selected": selected == null ? null : selected,
      // "inReportSerial": inReportSerial == null ? null : inReportSerial,
      // "isDeleted": isDeleted == null ? null : isDeleted,
      // "referenceId": referenceId,
      "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
      "preDiagnosisValType": preDiagnosisValType,
      // "doctorNo": doctorNo == null ? null : doctorNo,
      // "duration": duration,
      // "durationMu": durationMu,
      // "continueFlag": continueFlag,
      // "findingsClob": findingsClob,
      // "id": id == null ? null : id,
      // "preDiagnosisValLocal": preDiagnosisValLocal,
      // "preDiagnosisValShort": preDiagnosisValShort,
      // "preDiagnosisValUnit": preDiagnosisValUnit,
      // "preDiagnosisValDefaultVal": preDiagnosisValDefaultVal,
      // "orderSl": orderSl,
      // "preDiagnosisValInputType": preDiagnosisValInputType,
      // "departmentNo": departmentNo,
      // "activeStatus": activeStatus == null ? null : activeStatus,
      // "calculationMethod": calculationMethod,
      // "companyNo": companyNo == null ? null : companyNo,
      // "organizationNo": organizationNo == null ? null : organizationNo,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SaveClinicalHistory2ListElement {
  SaveClinicalHistory2ListElement({
    // this.followUpDate,
    // this.selected,
    // this.inReportSerial,
    // this.isDeleted,
    // this.activeStatus,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    // this.referenceId,
  });

  // DateTime followUpDate;
  // int selected;
  // int inReportSerial;
  // int isDeleted;
  // int activeStatus;
  String preDiagnosisVal;
  String preDiagnosisValType;
  // int referenceId;

  factory SaveClinicalHistory2ListElement.fromJson(Map<String, dynamic> json) =>
      SaveClinicalHistory2ListElement(
        // followUpDate: json["followUpDate"] == null
        //     ? null
        //     : DateTime.parse(json["followUpDate"]),
        // selected: json["selected"] == null ? null : json["selected"],
        // inReportSerial:
        //     json["inReportSerial"] == null ? null : json["inReportSerial"],
        // isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        // activeStatus:
        //     json["activeStatus"] == null ? null : json["activeStatus"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        // referenceId: json["referenceId"] == null ? null : json["referenceId"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      // "followUpDate":
      //     followUpDate == null ? null : followUpDate.toIso8601String(),
      // "selected": selected == null ? null : selected,
      // "inReportSerial": inReportSerial == null ? null : inReportSerial,
      // "isDeleted": isDeleted == null ? null : isDeleted,
      // "activeStatus": activeStatus == null ? null : activeStatus,
      "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
      "preDiagnosisValType":
          preDiagnosisValType == null ? null : preDiagnosisValType,
      // "referenceId": referenceId == null ? null : referenceId,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SaveDisposalList {
  SaveDisposalList({
    this.followUpDate,
    // this.selected,
    // this.inReportSerial,
    // this.isDeleted,
    this.preDiagnosisVal,
    // this.referenceId,
    // this.slNo,
    this.preDiagnosisValType,
    this.duration,
    this.durationMu,
  });

  DateTime followUpDate;
  // int selected;
  // int inReportSerial;
  // int isDeleted;
  String preDiagnosisVal;
  // int referenceId;
  // int slNo;
  String preDiagnosisValType;
  String duration;
  String durationMu;

  factory SaveDisposalList.fromJson(Map<String, dynamic> json) =>
      SaveDisposalList(
        followUpDate: json["followUpDate"] == null
            ? null
            : DateTime.parse(json["followUpDate"]),
        // selected: json["selected"] == null ? null : json["selected"],
        // inReportSerial:
        //     json["inReportSerial"] == null ? null : json["inReportSerial"],
        // isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        // referenceId: json["referenceId"] == null ? null : json["referenceId"],
        // slNo: json["slNo"] == null ? null : json["slNo"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        duration: json["duration"] == null ? null : json["duration"],
        durationMu: json["durationMu"] == null ? null : json["durationMu"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      "followUpDate":
          followUpDate == null ? null : followUpDate.toIso8601String(),
      // "selected": selected == null ? null : selected,
      // "inReportSerial": inReportSerial == null ? null : inReportSerial,
      // "isDeleted": isDeleted == null ? null : isDeleted,
      "preDiagnosisVal": preDiagnosisVal == null ? '' : preDiagnosisVal,
      // "referenceId": referenceId == null ? null : referenceId,
      // "slNo": slNo == null ? null : slNo,
      "preDiagnosisValType":
          preDiagnosisValType == null ? null : preDiagnosisValType,
      "duration": duration == null ? null : duration,
      "durationMu": durationMu == null ? null : durationMu,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SaveInvestigationList {
  SaveInvestigationList({
    // this.activeStatus,
    // this.inReportSerial,
    // this.isDeleted,
    this.itemTypeNo,
    // this.itemName,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    this.findings,
    this.isBold,
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
  String findings;
  int isBold;

  factory SaveInvestigationList.fromJson(Map<String, dynamic> json) =>
      SaveInvestigationList(
        // activeStatus:
        //     json["activeStatus"] == null ? null : json["activeStatus"],
        // inReportSerial:
        //     json["inReportSerial"] == null ? null : json["inReportSerial"],
        // isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        // itemTypeNo: json["itemTypeNo"] == null ? null : json["itemTypeNo"],
        // itemName: json["itemName"] == null ? null : json["itemName"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        findings: json["findings"] == null ? null : json["findings"],
        isBold: json["isBold"] == null ? null : json["isBold"],
        // referenceId: json["referenceId"] == null ? null : json["referenceId"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      // "activeStatus": activeStatus == null ? null : activeStatus,
      // "inReportSerial": inReportSerial == null ? null : inReportSerial,
      // "isDeleted": isDeleted == null ? null : isDeleted,
      // "itemTypeNo": itemTypeNo == null ? null : itemTypeNo,
      // "itemName": itemName == null ? null : itemName,
      "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
      "preDiagnosisValType":
          preDiagnosisValType == null ? null : preDiagnosisValType,
      // "referenceId": referenceId == null ? null : referenceId,
      "findings": findings == null ? null : findings,
      "isBold": isBold == null ? null : isBold,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SaveMedicationList {
  SaveMedicationList({
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
    this.isDeleted,
    this.inReportSerial,
  });

  List<SavePresMedDtlList> presMedDtlList;
  String genericName;
  String brandName;
  dynamic form;
  dynamic formName;
  dynamic itemNo;
  dynamic strength;
  String route;
  int preDiagnosisValType;
  String medicineStat;
  int isDeleted;
  int inReportSerial;

  factory SaveMedicationList.fromJson(Map<String, dynamic> json) =>
      SaveMedicationList(
        presMedDtlList: json["presMedDtlList"] == null
            ? []
            : List<SavePresMedDtlList>.from(json["presMedDtlList"]
                .map((x) => SavePresMedDtlList.fromJson(x))),
        genericName: json["genericName"] == null ? null : json["genericName"],
        brandName: json["brandName"] == null ? null : json["brandName"],
        form: json["form"],
        formName: json["formName"],
        itemNo: json["itemNo"],
        strength: json["strength"],
        route: json["route"] == null ? null : json["route"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        medicineStat:
            json["medicineStat"] == null ? null : json["medicineStat"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      "presMedDtlList": presMedDtlList == null
          ? []
          : List<dynamic>.from(presMedDtlList.map((x) => x.toJson())),
      "genericName": genericName == null ? null : genericName,
      "brandName": brandName == null ? null : brandName,
      "form": form,
      "formName": formName,
      "itemNo": itemNo,
      "strength": strength,
      "route": route == null ? null : route,
      "preDiagnosisValType":
          preDiagnosisValType == null ? null : preDiagnosisValType,
      "medicineStat": medicineStat == null ? null : medicineStat,
      "isDeleted": isDeleted == null ? null : isDeleted,
      "inReportSerial": inReportSerial == null ? null : inReportSerial,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SavePresMedDtlList {
  SavePresMedDtlList({
    this.itemQty,
    this.continueFlag,
    this.inReportSerial,
    this.isDeleted,
    this.dosage,
    this.duration,
    this.durationMu,
    this.durationComment,
    this.medicineComment,
    this.eye,
    this.eyeDrop,
    this.relationWithMeal,
  });

  int itemQty;
  int continueFlag;
  int inReportSerial;
  int isDeleted;
  String dosage;
  String duration;
  String durationMu;
  String durationComment;
  String medicineComment;
  dynamic eye;
  dynamic eyeDrop;
  dynamic relationWithMeal;

  factory SavePresMedDtlList.fromJson(Map<String, dynamic> json) =>
      SavePresMedDtlList(
        itemQty: json["itemQty"] == null ? null : json["itemQty"],
        continueFlag:
            json["continueFlag"] == null ? null : json["continueFlag"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        dosage: json["dosage"] == null ? null : json["dosage"],
        duration: json["duration"] == null ? null : json["duration"],
        durationMu: json["durationMu"] == null ? null : json["durationMu"],
        durationComment:
            json["durationComment"] == null ? null : json["durationComment"],
        medicineComment:
            json["medicineComment"] == null ? null : json["medicineComment"],
        eye: json["eye"],
        eyeDrop: json["eyeDrop"],
        relationWithMeal: json["relationWithMeal"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      "itemQty": itemQty == null ? null : itemQty,
      "continueFlag": continueFlag == null ? null : continueFlag,
      "inReportSerial": inReportSerial == null ? null : inReportSerial,
      "isDeleted": isDeleted == null ? null : isDeleted,
      "dosage": dosage == null ? null : dosage,
      "duration": duration == null ? null : duration,
      "durationMu": durationMu == null ? null : durationMu,
      "durationComment": durationComment == null ? null : durationComment,
      "medicineComment": medicineComment == null ? null : medicineComment,
      "eye": eye,
      "eyeDrop": eyeDrop,
      "relationWithMeal": relationWithMeal,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SaveNote {
  SaveNote({
    // this.followUpDate,
    // this.selected,
    // this.inReportSerial,
    // this.isDeleted,
    this.preDiagnosisValType,
    this.preDiagnosisVal,
  });

  // DateTime followUpDate;
  // int selected;
  // int inReportSerial;
  // int isDeleted;
  int preDiagnosisValType;
  String preDiagnosisVal;

  factory SaveNote.fromJson(Map<String, dynamic> json) => SaveNote(
        // followUpDate: json["followUpDate"] == null
        //     ? null
        //     : DateTime.parse(json["followUpDate"]),
        // selected: json["selected"] == null ? null : json["selected"],
        // inReportSerial:
        //     json["inReportSerial"] == null ? null : json["inReportSerial"],
        // isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      // "followUpDate":
      //     followUpDate == null ? null : followUpDate.toIso8601String(),
      // "selected": selected == null ? null : selected,
      // "inReportSerial": inReportSerial == null ? null : inReportSerial,
      // "isDeleted": isDeleted == null ? null : isDeleted,
      "preDiagnosisValType":
          preDiagnosisValType == null ? null : preDiagnosisValType,
      "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class Prescription {
  Prescription({
    this.consultationTypeNo,
    this.patientTypeNo,
    this.shiftNo,
    this.id,
    this.appointmentNo,
    this.registrationNo,
    this.hospitalId,
    this.consultationNo,
    this.consultationId,
    this.departmentNo,
    this.departmentName,
    this.isPatientOut,
    this.ipdFlag,
    this.companyNo,
  });

  int consultationTypeNo;
  int patientTypeNo;
  int shiftNo;
  dynamic id;
  int appointmentNo;
  int registrationNo;
  String hospitalId;
  int consultationNo;
  String consultationId;
  int departmentNo;
  String departmentName;
  int isPatientOut;
  int ipdFlag;
  int companyNo;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        consultationTypeNo: json["consultationTypeNo"] == null
            ? null
            : json["consultationTypeNo"],
        patientTypeNo:
            json["patientTypeNo"] == null ? null : json["patientTypeNo"],
        shiftNo: json["shiftNo"] == null ? null : json["shiftNo"],
        id: json["id"],
        appointmentNo:
            json["appointmentNo"] == null ? null : json["appointmentNo"],
        registrationNo:
            json["registrationNo"] == null ? null : json["registrationNo"],
        hospitalId: json["hospitalId"] == null ? null : json["hospitalId"],
        consultationNo:
            json["consultationNo"] == null ? null : json["consultationNo"],
        consultationId:
            json["consultationId"] == null ? null : json["consultationId"],
        departmentNo:
            json["departmentNo"] == null ? null : json["departmentNo"],
        departmentName:
            json["departmentName"] == null ? null : json["departmentName"],
        isPatientOut:
            json["isPatientOut"] == null ? null : json["isPatientOut"],
        ipdFlag: json["ipdFlag"] == null ? null : json["ipdFlag"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      "consultationTypeNo":
          consultationTypeNo == null ? null : consultationTypeNo,
      "patientTypeNo": patientTypeNo == null ? null : patientTypeNo,
      "shiftNo": shiftNo == null ? null : shiftNo,
      "id": id,
      "appointmentNo": appointmentNo == null ? null : appointmentNo,
      "registrationNo": registrationNo == null ? null : registrationNo,
      "hospitalId": hospitalId == null ? null : hospitalId,
      "consultationNo": consultationNo == null ? null : consultationNo,
      "consultationId": consultationId == null ? null : consultationId,
      "departmentNo": departmentNo == null ? null : departmentNo,
      "departmentName": departmentName == null ? null : departmentName,
      "isPatientOut": isPatientOut == null ? null : isPatientOut,
      "ipdFlag": ipdFlag == null ? null : ipdFlag,
      "companyNo": companyNo == null ? null : companyNo,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

class SaveVitalList {
  SaveVitalList({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    this.preDiagnosisValLocal,
    this.preDiagnosisValShort,
    this.preDiagnosisValUnit,
    this.preDiagnosisValDefaultVal,
    this.orderSl,
    this.preDiagnosisValInputType,
    this.calculationMethod,
    this.departmentNo,
    this.doctorNo,
    this.activeStatus,
    this.idNotEqual,
    this.preDiagnosisValTypes,
    this.deptNoNull,
    this.inReportSerial,
    this.referenceId,
    this.findings,
    this.unit,
  });

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  dynamic id;
  String preDiagnosisVal;
  int preDiagnosisValType;
  dynamic preDiagnosisValLocal;
  dynamic preDiagnosisValShort;
  String preDiagnosisValUnit;
  dynamic preDiagnosisValDefaultVal;
  int orderSl;
  int preDiagnosisValInputType;
  dynamic calculationMethod;
  dynamic departmentNo;
  int doctorNo;
  int activeStatus;
  dynamic idNotEqual;
  dynamic preDiagnosisValTypes;
  bool deptNoNull;
  int inReportSerial;
  int referenceId;
  String findings;
  String unit;

  factory SaveVitalList.fromJson(Map<String, dynamic> json) => SaveVitalList(
        ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
        ssCreateSession:
            json["ssCreateSession"] == null ? null : json["ssCreateSession"],
        ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
        ssModifiedOn:
            json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
        ssModifiedSession: json["ssModifiedSession"] == null
            ? null
            : json["ssModifiedSession"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        organizationNo:
            json["organizationNo"] == null ? null : json["organizationNo"],
        id: json["id"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        preDiagnosisValLocal: json["preDiagnosisValLocal"],
        preDiagnosisValShort: json["preDiagnosisValShort"],
        preDiagnosisValUnit: json["preDiagnosisValUnit"] == null
            ? null
            : json["preDiagnosisValUnit"],
        preDiagnosisValDefaultVal: json["preDiagnosisValDefaultVal"],
        orderSl: json["orderSl"] == null ? null : json["orderSl"],
        preDiagnosisValInputType: json["preDiagnosisValInputType"] == null
            ? null
            : json["preDiagnosisValInputType"],
        calculationMethod: json["calculationMethod"],
        departmentNo: json["departmentNo"],
        doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
        idNotEqual: json["idNotEqual"],
        preDiagnosisValTypes: json["preDiagnosisValTypes"],
        deptNoNull: json["deptNoNull"] == null ? null : json["deptNoNull"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
        referenceId: json["referenceId"] == null ? null : json["referenceId"],
        findings: json["findings"] == null ? null : json["findings"],
        unit: json["unit"] == null ? null : json["unit"],
      );

  Map<String, dynamic> toJson() {
    var data = {
      "ssCreator": ssCreator == null ? null : ssCreator,
      "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
      "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
      "ssModifier": ssModifier == null ? null : ssModifier,
      "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
      "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
      "companyNo": companyNo == null ? null : companyNo,
      "organizationNo": organizationNo == null ? null : organizationNo,
      "id": id,
      "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
      "preDiagnosisValType":
          preDiagnosisValType == null ? null : preDiagnosisValType,
      "preDiagnosisValLocal": preDiagnosisValLocal,
      "preDiagnosisValShort": preDiagnosisValShort,
      "preDiagnosisValUnit":
          preDiagnosisValUnit == null ? null : preDiagnosisValUnit,
      "preDiagnosisValDefaultVal": preDiagnosisValDefaultVal,
      "orderSl": orderSl == null ? null : orderSl,
      "preDiagnosisValInputType":
          preDiagnosisValInputType == null ? null : preDiagnosisValInputType,
      "calculationMethod": calculationMethod,
      "departmentNo": departmentNo,
      "doctorNo": doctorNo == null ? null : doctorNo,
      "activeStatus": activeStatus == null ? null : activeStatus,
      "idNotEqual": idNotEqual,
      "preDiagnosisValTypes": preDiagnosisValTypes,
      "deptNoNull": deptNoNull == null ? null : deptNoNull,
      "inReportSerial": inReportSerial == null ? null : inReportSerial,
      "referenceId": referenceId == null ? null : referenceId,
      "findings": findings == null ? null : findings,
      "unit": unit == null ? null : unit,
    };
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}
