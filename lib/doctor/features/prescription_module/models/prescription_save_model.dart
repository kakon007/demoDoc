// To parse this JSON data, do
//
//     final prescriptionSaveModel = prescriptionSaveModelFromJson(jsonString);

import 'dart:convert';

PrescriptionSaveModel prescriptionSaveModelFromJson(String str) => PrescriptionSaveModel.fromJson(json.decode(str));

String prescriptionSaveModelToJson(PrescriptionSaveModel data) => json.encode(data.toJson());

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
  });

  Prescription prescription;
  List<VitalList> vitalList;
  List<SaveAdviceListElement> adviceList;
  List<dynamic> medicineList;
  List<SaveAdviceListElement> diagnosisList;
  List<SaveChiefComplainList> chiefComplainList;
  List<SaveClinicalHistory2ListElement> clinicalHistory2List;
  List<SaveAdviceListElement> clinicalHistory3List;
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
  Note note;
  List<SaveMedicationList> medicationList;

  factory PrescriptionSaveModel.fromJson(Map<String, dynamic> json) => PrescriptionSaveModel(
    prescription: Prescription.fromJson(json["prescription"]),
    vitalList: List<VitalList>.from(json["vitalList"].map((x) => VitalList.fromJson(x))),
    adviceList: List<SaveAdviceListElement>.from(json["adviceList"].map((x) => SaveAdviceListElement.fromJson(x))),
    medicineList: List<dynamic>.from(json["medicineList"].map((x) => x)),
    diagnosisList: List<SaveAdviceListElement>.from(json["diagnosisList"].map((x) => SaveAdviceListElement.fromJson(x))),
    chiefComplainList: List<SaveChiefComplainList>.from(json["chiefComplainList"].map((x) => SaveChiefComplainList.fromJson(x))),
    clinicalHistory2List: List<SaveClinicalHistory2ListElement>.from(json["clinicalHistory2List"].map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
    clinicalHistory3List: List<SaveAdviceListElement>.from(json["clinicalHistory3List"].map((x) => SaveAdviceListElement.fromJson(x))),
    disposalList: List<SaveDisposalList>.from(json["disposalList"].map((x) => SaveDisposalList.fromJson(x))),
    referralList: List<SaveClinicalHistory2ListElement>.from(json["referralList"].map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
    physicalExamList: List<dynamic>.from(json["physicalExamList"].map((x) => x)),
    opdVitalList: List<dynamic>.from(json["opdVitalList"].map((x) => x)),
    investigationList: List<SaveInvestigationList>.from(json["investigationList"].map((x) => SaveInvestigationList.fromJson(x))),
    investigationFindingsList: List<SaveInvestigationList>.from(json["investigationFindingsList"].map((x) => SaveInvestigationList.fromJson(x))),
    diseaseList: List<SaveClinicalHistory2ListElement>.from(json["diseaseList"].map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
    dentalFindingsList: List<dynamic>.from(json["dentalFindingsList"].map((x) => x)),
    dentalTreatment: json["dentalTreatment"],
    eyeFindingsList: List<dynamic>.from(json["eyeFindingsList"].map((x) => x)),
    treatmentList: List<SaveClinicalHistory2ListElement>.from(json["treatmentList"].map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
    referralDoctorList: List<SaveClinicalHistory2ListElement>.from(json["referralDoctorList"].map((x) => SaveClinicalHistory2ListElement.fromJson(x))),
    dietAdviceList: List<dynamic>.from(json["dietAdviceList"].map((x) => x)),
    referredToWard: json["referredToWard"],
    note: Note.fromJson(json["note"]),
    medicationList: List<SaveMedicationList>.from(json["medicationList"].map((x) => SaveMedicationList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "prescription": prescription.toJson(),
    "vitalList": List<dynamic>.from(vitalList.map((x) => x.toJson())),
    "adviceList": List<dynamic>.from(adviceList.map((x) => x.toJson())),
    "medicineList": List<dynamic>.from(medicineList.map((x) => x)),
    "diagnosisList": List<dynamic>.from(diagnosisList.map((x) => x.toJson())),
    "chiefComplainList": List<dynamic>.from(chiefComplainList.map((x) => x.toJson())),
    "clinicalHistory2List": List<dynamic>.from(clinicalHistory2List.map((x) => x.toJson())),
    "clinicalHistory3List": List<dynamic>.from(clinicalHistory3List.map((x) => x.toJson())),
    "disposalList": List<dynamic>.from(disposalList.map((x) => x.toJson())),
    "referralList": List<dynamic>.from(referralList.map((x) => x.toJson())),
    "physicalExamList": List<dynamic>.from(physicalExamList.map((x) => x)),
    "opdVitalList": List<dynamic>.from(opdVitalList.map((x) => x)),
    "investigationList": List<dynamic>.from(investigationList.map((x) => x.toJson())),
    "investigationFindingsList": List<dynamic>.from(investigationFindingsList.map((x) => x.toJson())),
    "diseaseList": List<dynamic>.from(diseaseList.map((x) => x.toJson())),
    "dentalFindingsList": List<dynamic>.from(dentalFindingsList.map((x) => x)),
    "dentalTreatment": dentalTreatment,
    "eyeFindingsList": List<dynamic>.from(eyeFindingsList.map((x) => x)),
    "treatmentList": List<dynamic>.from(treatmentList.map((x) => x.toJson())),
    "referralDoctorList": List<dynamic>.from(referralDoctorList.map((x) => x.toJson())),
    "dietAdviceList": List<dynamic>.from(dietAdviceList.map((x) => x)),
    "referredToWard": referredToWard,
    "note": note.toJson(),
    "medicationList": List<dynamic>.from(medicationList.map((x) => x.toJson())),
  };
}

class SaveAdviceListElement {
  SaveAdviceListElement({
    this.followUpDate,
    this.selected,
    this.inReportSerial,
    this.isDeleted,
    this.referenceId,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    this.doctorNo,
    this.duration,
    this.durationMu,
    this.continueFlag,
    this.findingsClob,
  });

  DateTime followUpDate;
  int selected;
  int inReportSerial;
  int isDeleted;
  dynamic referenceId;
  String preDiagnosisVal;
  int preDiagnosisValType;
  int doctorNo;
  dynamic duration;
  dynamic durationMu;
  dynamic continueFlag;
  dynamic findingsClob;

  factory SaveAdviceListElement.fromJson(Map<String, dynamic> json) => SaveAdviceListElement(
    followUpDate: DateTime.parse(json["followUpDate"]),
    selected: json["selected"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    referenceId: json["referenceId"],
    preDiagnosisVal: json["preDiagnosisVal"],
    preDiagnosisValType: json["preDiagnosisValType"],
    doctorNo: json["doctorNo"],
    duration: json["duration"],
    durationMu: json["durationMu"],
    continueFlag: json["continueFlag"],
    findingsClob: json["findingsClob"],
  );

  Map<String, dynamic> toJson() => {
    "followUpDate": followUpDate.toIso8601String(),
    "selected": selected,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "referenceId": referenceId,
    "preDiagnosisVal": preDiagnosisVal,
    "preDiagnosisValType": preDiagnosisValType,
    "doctorNo": doctorNo,
    "duration": duration,
    "durationMu": durationMu,
    "continueFlag": continueFlag,
    "findingsClob": findingsClob,
  };
}

class SaveChiefComplainList {
  SaveChiefComplainList({
    this.followUpDate,
    this.selected,
    this.inReportSerial,
    this.isDeleted,
    this.referenceId,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    this.doctorNo,
    this.duration,
    this.durationMu,
    this.continueFlag,
    this.findingsClob,
    this.id,
    this.preDiagnosisValLocal,
    this.preDiagnosisValShort,
    this.preDiagnosisValUnit,
    this.preDiagnosisValDefaultVal,
    this.orderSl,
    this.preDiagnosisValInputType,
    this.departmentNo,
    this.activeStatus,
    this.calculationMethod,
    this.companyNo,
    this.organizationNo,
  });

  DateTime followUpDate;
  int selected;
  int inReportSerial;
  int isDeleted;
  dynamic referenceId;
  String preDiagnosisVal;
  dynamic preDiagnosisValType;
  int doctorNo;
  dynamic duration;
  dynamic durationMu;
  dynamic continueFlag;
  dynamic findingsClob;
  int id;
  dynamic preDiagnosisValLocal;
  dynamic preDiagnosisValShort;
  dynamic preDiagnosisValUnit;
  dynamic preDiagnosisValDefaultVal;
  dynamic orderSl;
  dynamic preDiagnosisValInputType;
  dynamic departmentNo;
  int activeStatus;
  dynamic calculationMethod;
  int companyNo;
  int organizationNo;

  factory SaveChiefComplainList.fromJson(Map<String, dynamic> json) => SaveChiefComplainList(
    followUpDate: json["followUpDate"] == null ? null : DateTime.parse(json["followUpDate"]),
    selected: json["selected"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    referenceId: json["referenceId"],
    preDiagnosisVal: json["preDiagnosisVal"],
    preDiagnosisValType: json["preDiagnosisValType"],
    doctorNo: json["doctorNo"],
    duration: json["duration"],
    durationMu: json["durationMu"],
    continueFlag: json["continueFlag"],
    findingsClob: json["findingsClob"],
    id: json["id"] == null ? null : json["id"],
    preDiagnosisValLocal: json["preDiagnosisValLocal"],
    preDiagnosisValShort: json["preDiagnosisValShort"],
    preDiagnosisValUnit: json["preDiagnosisValUnit"],
    preDiagnosisValDefaultVal: json["preDiagnosisValDefaultVal"],
    orderSl: json["orderSl"],
    preDiagnosisValInputType: json["preDiagnosisValInputType"],
    departmentNo: json["departmentNo"],
    activeStatus: json["activeStatus"] == null ? null : json["activeStatus"],
    calculationMethod: json["calculationMethod"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
  );

  Map<String, dynamic> toJson() => {
    "followUpDate": followUpDate == null ? null : followUpDate.toIso8601String(),
    "selected": selected,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "referenceId": referenceId,
    "preDiagnosisVal": preDiagnosisVal,
    "preDiagnosisValType": preDiagnosisValType,
    "doctorNo": doctorNo,
    "duration": duration,
    "durationMu": durationMu,
    "continueFlag": continueFlag,
    "findingsClob": findingsClob,
    "id": id == null ? null : id,
    "preDiagnosisValLocal": preDiagnosisValLocal,
    "preDiagnosisValShort": preDiagnosisValShort,
    "preDiagnosisValUnit": preDiagnosisValUnit,
    "preDiagnosisValDefaultVal": preDiagnosisValDefaultVal,
    "orderSl": orderSl,
    "preDiagnosisValInputType": preDiagnosisValInputType,
    "departmentNo": departmentNo,
    "activeStatus": activeStatus == null ? null : activeStatus,
    "calculationMethod": calculationMethod,
    "companyNo": companyNo == null ? null : companyNo,
    "organizationNo": organizationNo == null ? null : organizationNo,
  };
}

class SaveClinicalHistory2ListElement {
  SaveClinicalHistory2ListElement({
    this.followUpDate,
    this.selected,
    this.inReportSerial,
    this.isDeleted,
    this.activeStatus,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    this.referenceId,
  });

  DateTime followUpDate;
  int selected;
  int inReportSerial;
  int isDeleted;
  int activeStatus;
  String preDiagnosisVal;
  String preDiagnosisValType;
  int referenceId;

  factory SaveClinicalHistory2ListElement.fromJson(Map<String, dynamic> json) => SaveClinicalHistory2ListElement(
    followUpDate: DateTime.parse(json["followUpDate"]),
    selected: json["selected"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    activeStatus: json["activeStatus"] == null ? null : json["activeStatus"],
    preDiagnosisVal: json["preDiagnosisVal"],
    preDiagnosisValType: json["preDiagnosisValType"],
    referenceId: json["referenceId"] == null ? null : json["referenceId"],
  );

  Map<String, dynamic> toJson() => {
    "followUpDate": followUpDate.toIso8601String(),
    "selected": selected,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "activeStatus": activeStatus == null ? null : activeStatus,
    "preDiagnosisVal": preDiagnosisVal,
    "preDiagnosisValType": preDiagnosisValType,
    "referenceId": referenceId == null ? null : referenceId,
  };
}

class SaveDisposalList {
  SaveDisposalList({
    this.followUpDate,
    this.selected,
    this.inReportSerial,
    this.isDeleted,
    this.preDiagnosisVal,
    this.referenceId,
    this.slNo,
    this.preDiagnosisValType,
    this.duration,
    this.durationMu,
  });

  DateTime followUpDate;
  int selected;
  int inReportSerial;
  int isDeleted;
  String preDiagnosisVal;
  int referenceId;
  int slNo;
  String preDiagnosisValType;
  int duration;
  String durationMu;

  factory SaveDisposalList.fromJson(Map<String, dynamic> json) => SaveDisposalList(
    followUpDate: DateTime.parse(json["followUpDate"]),
    selected: json["selected"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    preDiagnosisVal: json["preDiagnosisVal"],
    referenceId: json["referenceId"],
    slNo: json["slNo"],
    preDiagnosisValType: json["preDiagnosisValType"],
    duration: json["duration"],
    durationMu: json["durationMu"],
  );

  Map<String, dynamic> toJson() => {
    "followUpDate": followUpDate.toIso8601String(),
    "selected": selected,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "preDiagnosisVal": preDiagnosisVal,
    "referenceId": referenceId,
    "slNo": slNo,
    "preDiagnosisValType": preDiagnosisValType,
    "duration": duration,
    "durationMu": durationMu,
  };
}

class SaveInvestigationList {
  SaveInvestigationList({
    this.activeStatus,
    this.inReportSerial,
    this.isDeleted,
    this.itemTypeNo,
    this.itemName,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    this.referenceId,
  });

  int activeStatus;
  int inReportSerial;
  int isDeleted;
  int itemTypeNo;
  String itemName;
  String preDiagnosisVal;
  int preDiagnosisValType;
  int referenceId;

  factory SaveInvestigationList.fromJson(Map<String, dynamic> json) => SaveInvestigationList(
    activeStatus: json["activeStatus"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    itemTypeNo: json["itemTypeNo"],
    itemName: json["itemName"],
    preDiagnosisVal: json["preDiagnosisVal"],
    preDiagnosisValType: json["preDiagnosisValType"],
    referenceId: json["referenceId"] == null ? null : json["referenceId"],
  );

  Map<String, dynamic> toJson() => {
    "activeStatus": activeStatus,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "itemTypeNo": itemTypeNo,
    "itemName": itemName,
    "preDiagnosisVal": preDiagnosisVal,
    "preDiagnosisValType": preDiagnosisValType,
    "referenceId": referenceId == null ? null : referenceId,
  };
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

  List<PresMedDtlList> presMedDtlList;
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

  factory SaveMedicationList.fromJson(Map<String, dynamic> json) => SaveMedicationList(
    presMedDtlList: List<PresMedDtlList>.from(json["presMedDtlList"].map((x) => PresMedDtlList.fromJson(x))),
    genericName: json["genericName"] == null ? null : json["genericName"],
    brandName: json["brandName"],
    form: json["form"],
    formName: json["formName"],
    itemNo: json["itemNo"],
    strength: json["strength"],
    route: json["route"],
    preDiagnosisValType: json["preDiagnosisValType"],
    medicineStat: json["medicineStat"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    inReportSerial: json["inReportSerial"],
  );

  Map<String, dynamic> toJson() => {
    "presMedDtlList": List<dynamic>.from(presMedDtlList.map((x) => x.toJson())),
    "genericName": genericName == null ? null : genericName,
    "brandName": brandName,
    "form": form,
    "formName": formName,
    "itemNo": itemNo,
    "strength": strength,
    "route": route,
    "preDiagnosisValType": preDiagnosisValType,
    "medicineStat": medicineStat,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "inReportSerial": inReportSerial,
  };
}

class PresMedDtlList {
  PresMedDtlList({
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

  factory PresMedDtlList.fromJson(Map<String, dynamic> json) => PresMedDtlList(
    itemQty: json["itemQty"],
    continueFlag: json["continueFlag"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    dosage: json["dosage"],
    duration: json["duration"],
    durationMu: json["durationMu"],
    durationComment: json["durationComment"] == null ? null : json["durationComment"],
    medicineComment: json["medicineComment"],
    eye: json["eye"],
    eyeDrop: json["eyeDrop"],
    relationWithMeal: json["relationWithMeal"],
  );

  Map<String, dynamic> toJson() => {
    "itemQty": itemQty,
    "continueFlag": continueFlag,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "dosage": dosage,
    "duration": duration,
    "durationMu": durationMu,
    "durationComment": durationComment == null ? null : durationComment,
    "medicineComment": medicineComment,
    "eye": eye,
    "eyeDrop": eyeDrop,
    "relationWithMeal": relationWithMeal,
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
    followUpDate: DateTime.parse(json["followUpDate"]),
    selected: json["selected"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    preDiagnosisValType: json["preDiagnosisValType"],
    preDiagnosisVal: json["preDiagnosisVal"],
  );

  Map<String, dynamic> toJson() => {
    "followUpDate": followUpDate.toIso8601String(),
    "selected": selected,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "preDiagnosisValType": preDiagnosisValType,
    "preDiagnosisVal": preDiagnosisVal,
  };
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
    consultationTypeNo: json["consultationTypeNo"],
    patientTypeNo: json["patientTypeNo"],
    shiftNo: json["shiftNo"],
    id: json["id"],
    appointmentNo: json["appointmentNo"],
    registrationNo: json["registrationNo"],
    hospitalId: json["hospitalId"],
    consultationNo: json["consultationNo"],
    consultationId: json["consultationId"],
    departmentNo: json["departmentNo"],
    departmentName: json["departmentName"],
    isPatientOut: json["isPatientOut"],
    ipdFlag: json["ipdFlag"],
    companyNo: json["companyNo"],
  );

  Map<String, dynamic> toJson() => {
    "consultationTypeNo": consultationTypeNo,
    "patientTypeNo": patientTypeNo,
    "shiftNo": shiftNo,
    "id": id,
    "appointmentNo": appointmentNo,
    "registrationNo": registrationNo,
    "hospitalId": hospitalId,
    "consultationNo": consultationNo,
    "consultationId": consultationId,
    "departmentNo": departmentNo,
    "departmentName": departmentName,
    "isPatientOut": isPatientOut,
    "ipdFlag": ipdFlag,
    "companyNo": companyNo,
  };
}

class VitalList {
  VitalList({
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

  factory VitalList.fromJson(Map<String, dynamic> json) => VitalList(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    preDiagnosisVal: json["preDiagnosisVal"],
    preDiagnosisValType: json["preDiagnosisValType"],
    preDiagnosisValLocal: json["preDiagnosisValLocal"],
    preDiagnosisValShort: json["preDiagnosisValShort"],
    preDiagnosisValUnit: json["preDiagnosisValUnit"] == null ? null : json["preDiagnosisValUnit"],
    preDiagnosisValDefaultVal: json["preDiagnosisValDefaultVal"],
    orderSl: json["orderSl"],
    preDiagnosisValInputType: json["preDiagnosisValInputType"] == null ? null : json["preDiagnosisValInputType"],
    calculationMethod: json["calculationMethod"],
    departmentNo: json["departmentNo"],
    doctorNo: json["doctorNo"],
    activeStatus: json["activeStatus"],
    idNotEqual: json["idNotEqual"],
    preDiagnosisValTypes: json["preDiagnosisValTypes"],
    deptNoNull: json["deptNoNull"],
    inReportSerial: json["inReportSerial"],
    referenceId: json["referenceId"],
    findings: json["findings"],
    unit: json["unit"] == null ? null : json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "id": id,
    "preDiagnosisVal": preDiagnosisVal,
    "preDiagnosisValType": preDiagnosisValType,
    "preDiagnosisValLocal": preDiagnosisValLocal,
    "preDiagnosisValShort": preDiagnosisValShort,
    "preDiagnosisValUnit": preDiagnosisValUnit == null ? null : preDiagnosisValUnit,
    "preDiagnosisValDefaultVal": preDiagnosisValDefaultVal,
    "orderSl": orderSl,
    "preDiagnosisValInputType": preDiagnosisValInputType == null ? null : preDiagnosisValInputType,
    "calculationMethod": calculationMethod,
    "departmentNo": departmentNo,
    "doctorNo": doctorNo,
    "activeStatus": activeStatus,
    "idNotEqual": idNotEqual,
    "preDiagnosisValTypes": preDiagnosisValTypes,
    "deptNoNull": deptNoNull,
    "inReportSerial": inReportSerial,
    "referenceId": referenceId,
    "findings": findings,
    "unit": unit == null ? null : unit,
  };
}
