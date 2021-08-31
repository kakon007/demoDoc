// To parse this JSON data, do
//
//     final getTemplateDataModel = getTemplateDataModelFromJson(jsonString);

import 'dart:convert';

GetTemplateDataModel getTemplateDataModelFromJson(String str) => GetTemplateDataModel.fromJson(json.decode(str));

String getTemplateDataModelToJson(GetTemplateDataModel data) => json.encode(data.toJson());

class GetTemplateDataModel {
  GetTemplateDataModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.items,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  dynamic items;
  Obj obj;

  factory GetTemplateDataModel.fromJson(Map<String, dynamic> json) => GetTemplateDataModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"],
    obj: Obj.fromJson(json["obj"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "info": info,
    "warning": warning,
    "message": message,
    "valid": valid,
    "id": id,
    "model": model,
    "items": items,
    "obj": obj.toJson(),
  };
}

class Obj {
  Obj({
    this.note,
    this.treatmentList,
    this.diseaseList,
    this.chiefComplainList,
    this.finalizationThreeList,
    this.clinicalHistoryNote,
    this.clinicalHistory2List,
    this.medicationNote,
    this.department,
    this.prescriptionTemp,
    this.adviceList,
    this.eyeIpd,
    this.dietAdviceList,
    this.patHistoryList,
    this.referralDoctorList,
    this.investigationNote,
    this.eyeRemarks,
    this.patPhysicalExamList,
    this.finalizationOneList,
    this.medicineList,
    this.investigationList,
    this.clinicalHistory3List,
    this.finalizationTwoList,
    this.medicationList,
    this.diagnosisList,
    this.dentalTreatment,
    this.clinicalHistoryList,
  });

  Note note;
  List<dynamic> treatmentList;
  List<dynamic> diseaseList;
  List<Note> chiefComplainList;
  List<dynamic> finalizationThreeList;
  dynamic clinicalHistoryNote;
  List<Note> clinicalHistory2List;
  dynamic medicationNote;
  dynamic department;
  PrescriptionTemp prescriptionTemp;
  List<Note> adviceList;
  dynamic eyeIpd;
  List<dynamic> dietAdviceList;
  List<dynamic> patHistoryList;
  List<dynamic> referralDoctorList;
  dynamic investigationNote;
  dynamic eyeRemarks;
  List<dynamic> patPhysicalExamList;
  List<dynamic> finalizationOneList;
  List<dynamic> medicineList;
  List<Note> investigationList;
  List<Note> clinicalHistory3List;
  List<dynamic> finalizationTwoList;
  List<MedicationList> medicationList;
  List<Note> diagnosisList;
  dynamic dentalTreatment;
  List<Note> clinicalHistoryList;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    note: Note.fromJson(json["note"]),
    treatmentList: List<dynamic>.from(json["treatmentList"].map((x) => x)),
    diseaseList: List<dynamic>.from(json["diseaseList"].map((x) => x)),
    chiefComplainList: List<Note>.from(json["chiefComplainList"].map((x) => Note.fromJson(x))),
    finalizationThreeList: List<dynamic>.from(json["finalizationThreeList"].map((x) => x)),
    clinicalHistoryNote: json["clinicalHistoryNote"],
    clinicalHistory2List: List<Note>.from(json["clinicalHistory2List"].map((x) => Note.fromJson(x))),
    medicationNote: json["medicationNote"],
    department: json["department"],
    prescriptionTemp: PrescriptionTemp.fromJson(json["prescriptionTemp"]),
    adviceList: List<Note>.from(json["adviceList"].map((x) => Note.fromJson(x))),
    eyeIpd: json["eyeIPD"],
    dietAdviceList: List<dynamic>.from(json["dietAdviceList"].map((x) => x)),
    patHistoryList: List<dynamic>.from(json["patHistoryList"].map((x) => x)),
    referralDoctorList: List<dynamic>.from(json["referralDoctorList"].map((x) => x)),
    investigationNote: json["investigationNote"],
    eyeRemarks: json["eyeRemarks"],
    patPhysicalExamList: List<dynamic>.from(json["patPhysicalExamList"].map((x) => x)),
    finalizationOneList: List<dynamic>.from(json["finalizationOneList"].map((x) => x)),
    medicineList: List<dynamic>.from(json["medicineList"].map((x) => x)),
    investigationList: List<Note>.from(json["investigationList"].map((x) => Note.fromJson(x))),
    clinicalHistory3List: List<Note>.from(json["clinicalHistory3List"].map((x) => Note.fromJson(x))),
    finalizationTwoList: List<dynamic>.from(json["finalizationTwoList"].map((x) => x)),
    medicationList: List<MedicationList>.from(json["medicationList"].map((x) => MedicationList.fromJson(x))),
    diagnosisList: List<Note>.from(json["diagnosisList"].map((x) => Note.fromJson(x))),
    dentalTreatment: json["dentalTreatment"],
    clinicalHistoryList: List<Note>.from(json["clinicalHistoryList"].map((x) => Note.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "note": note.toJson(),
    "treatmentList": List<dynamic>.from(treatmentList.map((x) => x)),
    "diseaseList": List<dynamic>.from(diseaseList.map((x) => x)),
    "chiefComplainList": List<dynamic>.from(chiefComplainList.map((x) => x.toJson())),
    "finalizationThreeList": List<dynamic>.from(finalizationThreeList.map((x) => x)),
    "clinicalHistoryNote": clinicalHistoryNote,
    "clinicalHistory2List": List<dynamic>.from(clinicalHistory2List.map((x) => x.toJson())),
    "medicationNote": medicationNote,
    "department": department,
    "prescriptionTemp": prescriptionTemp.toJson(),
    "adviceList": List<dynamic>.from(adviceList.map((x) => x.toJson())),
    "eyeIPD": eyeIpd,
    "dietAdviceList": List<dynamic>.from(dietAdviceList.map((x) => x)),
    "patHistoryList": List<dynamic>.from(patHistoryList.map((x) => x)),
    "referralDoctorList": List<dynamic>.from(referralDoctorList.map((x) => x)),
    "investigationNote": investigationNote,
    "eyeRemarks": eyeRemarks,
    "patPhysicalExamList": List<dynamic>.from(patPhysicalExamList.map((x) => x)),
    "finalizationOneList": List<dynamic>.from(finalizationOneList.map((x) => x)),
    "medicineList": List<dynamic>.from(medicineList.map((x) => x)),
    "investigationList": List<dynamic>.from(investigationList.map((x) => x.toJson())),
    "clinicalHistory3List": List<dynamic>.from(clinicalHistory3List.map((x) => x.toJson())),
    "finalizationTwoList": List<dynamic>.from(finalizationTwoList.map((x) => x)),
    "medicationList": List<dynamic>.from(medicationList.map((x) => x.toJson())),
    "diagnosisList": List<dynamic>.from(diagnosisList.map((x) => x.toJson())),
    "dentalTreatment": dentalTreatment,
    "clinicalHistoryList": List<dynamic>.from(clinicalHistoryList.map((x) => x.toJson())),
  };
}

class Note {
  Note({
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
    this.referenceId,
    this.duration,
    this.durationMu,
    this.timeDuration,
    this.timeDurationMu,
    this.quantity,
    this.timePriod,
    this.followUpDate,
    this.findings,
    this.findingsClob,
    this.continueFlag,
    this.unit,
    this.headNo,
    this.isDeleted,
    this.isBold,
    this.inReportSerial,
    this.activeStatus,
  });

  int ssCreator;
  SsEdOn ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  SsEdOn ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  dynamic organizationNo;
  int id;
  String preDiagnosisVal;
  int preDiagnosisValType;
  int referenceId;
  dynamic duration;
  dynamic durationMu;
  dynamic timeDuration;
  dynamic timeDurationMu;
  dynamic quantity;
  dynamic timePriod;
  String followUpDate;
  dynamic findings;
  dynamic findingsClob;
  dynamic continueFlag;
  dynamic unit;
  dynamic headNo;
  dynamic isDeleted;
  int isBold;
  int inReportSerial;
  int activeStatus;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    ssCreator: json["ssCreator"],
    ssCreatedOn: ssEdOnValues.map[json["ssCreatedOn"]],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: ssEdOnValues.map[json["ssModifiedOn"]],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    preDiagnosisVal: json["preDiagnosisVal"],
    preDiagnosisValType: json["preDiagnosisValType"],
    referenceId: json["referenceId"] == null ? null : json["referenceId"],
    duration: json["duration"],
    durationMu: json["durationMu"],
    timeDuration: json["timeDuration"],
    timeDurationMu: json["timeDurationMu"],
    quantity: json["quantity"],
    timePriod: json["timePriod"],
    followUpDate: json["followUpDate"] == null ? null : json["followUpDate"],
    findings: json["findings"],
    findingsClob: json["findingsClob"],
    continueFlag: json["continueFlag"],
    unit: json["unit"],
    headNo: json["headNo"],
    isDeleted: json["isDeleted"],
    isBold: json["isBold"],
    inReportSerial: json["inReportSerial"],
    activeStatus: json["activeStatus"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssEdOnValues.reverse[ssCreatedOn],
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssEdOnValues.reverse[ssModifiedOn],
    "ssModifiedSession": ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "id": id,
    "preDiagnosisVal": preDiagnosisVal,
    "preDiagnosisValType": preDiagnosisValType,
    "referenceId": referenceId == null ? null : referenceId,
    "duration": duration,
    "durationMu": durationMu,
    "timeDuration": timeDuration,
    "timeDurationMu": timeDurationMu,
    "quantity": quantity,
    "timePriod": timePriod,
    "followUpDate": followUpDate == null ? null : followUpDate,
    "findings": findings,
    "findingsClob": findingsClob,
    "continueFlag": continueFlag,
    "unit": unit,
    "headNo": headNo,
    "isDeleted": isDeleted,
    "isBold": isBold,
    "inReportSerial": inReportSerial,
    "activeStatus": activeStatus,
  };
}

enum SsEdOn { THE_20210831_T11_45030000000, THE_20210831_T11_45020000000 }

final ssEdOnValues = EnumValues({
  "2021-08-31T11:45:02.000+0000": SsEdOn.THE_20210831_T11_45020000000,
  "2021-08-31T11:45:03.000+0000": SsEdOn.THE_20210831_T11_45030000000
});

class MedicationList {
  MedicationList({
    this.id,
    this.genericName,
    this.brandName,
    this.formName,
    this.itemNo,
    this.inReportSerial,
    this.isDeleted,
    this.activeStatus,
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.presMedDtlList,
  });

  int id;
  String genericName;
  String brandName;
  dynamic formName;
  dynamic itemNo;
  int inReportSerial;
  int isDeleted;
  int activeStatus;
  int ssCreator;
  SsEdOn ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  SsEdOn ssModifiedOn;
  int ssModifiedSession;
  List<PresMedDtlList> presMedDtlList;

  factory MedicationList.fromJson(Map<String, dynamic> json) => MedicationList(
    id: json["id"],
    genericName: json["genericName"],
    brandName: json["brandName"] == null ? null : json["brandName"],
    formName: json["formName"],
    itemNo: json["itemNo"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    activeStatus: json["activeStatus"],
    ssCreator: json["ssCreator"],
    ssCreatedOn: ssEdOnValues.map[json["ssCreatedOn"]],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: ssEdOnValues.map[json["ssModifiedOn"]],
    ssModifiedSession: json["ssModifiedSession"],
    presMedDtlList: List<PresMedDtlList>.from(json["presMedDtlList"].map((x) => PresMedDtlList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "genericName": genericName,
    "brandName": brandName == null ? null : brandName,
    "formName": formName,
    "itemNo": itemNo,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "activeStatus": activeStatus,
    "ssCreator": ssCreator,
    "ssCreatedOn": ssEdOnValues.reverse[ssCreatedOn],
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssEdOnValues.reverse[ssModifiedOn],
    "ssModifiedSession": ssModifiedSession,
    "presMedDtlList": List<dynamic>.from(presMedDtlList.map((x) => x.toJson())),
  };
}

class PresMedDtlList {
  PresMedDtlList({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.dosage,
    this.duration,
    this.durationMu,
    this.durationComment,
    this.itemQty,
    this.medicineComment,
    this.eye,
    this.eyeDrop,
    this.inReportSerial,
    this.isDeleted,
    this.continueFlag,
    this.activeStatus,
  });

  int ssCreator;
  SsEdOn ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  SsEdOn ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  dynamic organizationNo;
  int id;
  String dosage;
  String duration;
  String durationMu;
  dynamic durationComment;
  int itemQty;
  String medicineComment;
  dynamic eye;
  dynamic eyeDrop;
  int inReportSerial;
  int isDeleted;
  int continueFlag;
  int activeStatus;

  factory PresMedDtlList.fromJson(Map<String, dynamic> json) => PresMedDtlList(
    ssCreator: json["ssCreator"],
    ssCreatedOn: ssEdOnValues.map[json["ssCreatedOn"]],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: ssEdOnValues.map[json["ssModifiedOn"]],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    dosage: json["dosage"],
    duration: json["duration"],
    durationMu: json["durationMu"],
    durationComment: json["durationComment"],
    itemQty: json["itemQty"] == null ? null : json["itemQty"],
    medicineComment: json["medicineComment"],
    eye: json["eye"],
    eyeDrop: json["eyeDrop"],
    inReportSerial: json["inReportSerial"],
    isDeleted: json["isDeleted"],
    continueFlag: json["continueFlag"],
    activeStatus: json["activeStatus"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssEdOnValues.reverse[ssCreatedOn],
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssEdOnValues.reverse[ssModifiedOn],
    "ssModifiedSession": ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "id": id,
    "dosage": dosage,
    "duration": duration,
    "durationMu": durationMu,
    "durationComment": durationComment,
    "itemQty": itemQty == null ? null : itemQty,
    "medicineComment": medicineComment,
    "eye": eye,
    "eyeDrop": eyeDrop,
    "inReportSerial": inReportSerial,
    "isDeleted": isDeleted,
    "continueFlag": continueFlag,
    "activeStatus": activeStatus,
  };
}

class PrescriptionTemp {
  PrescriptionTemp({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.templateName,
    this.departmentNo,
    this.doctorNo,
    this.activeStatus,
    this.ipdFlag,
    this.wardNo,
  });

  int ssCreator;
  SsEdOn ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  SsEdOn ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int id;
  String templateName;
  dynamic departmentNo;
  String doctorNo;
  int activeStatus;
  int ipdFlag;
  dynamic wardNo;

  factory PrescriptionTemp.fromJson(Map<String, dynamic> json) => PrescriptionTemp(
    ssCreator: json["ssCreator"],
    ssCreatedOn: ssEdOnValues.map[json["ssCreatedOn"]],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: ssEdOnValues.map[json["ssModifiedOn"]],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    templateName: json["templateName"],
    departmentNo: json["departmentNo"],
    doctorNo: json["doctorNo"],
    activeStatus: json["activeStatus"],
    ipdFlag: json["ipdFlag"],
    wardNo: json["wardNo"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssEdOnValues.reverse[ssCreatedOn],
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssEdOnValues.reverse[ssModifiedOn],
    "ssModifiedSession": ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "id": id,
    "templateName": templateName,
    "departmentNo": departmentNo,
    "doctorNo": doctorNo,
    "activeStatus": activeStatus,
    "ipdFlag": ipdFlag,
    "wardNo": wardNo,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
