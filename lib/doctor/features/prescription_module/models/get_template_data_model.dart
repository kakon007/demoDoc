// To parse this JSON data, do
//
//     final getTemplateDataModel = getTemplateDataModelFromJson(jsonString);

import 'dart:convert';

GetTemplateDataModel getTemplateDataModelFromJson(String str) =>
    GetTemplateDataModel.fromJson(json.decode(str));

String getTemplateDataModelToJson(GetTemplateDataModel data) =>
    json.encode(data.toJson());

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

  factory GetTemplateDataModel.fromJson(Map<String, dynamic> json) =>
      GetTemplateDataModel(
        success: json["success"] == null ? null : json["success"],
        info: json["info"] == null ? null : json["info"],
        warning: json["warning"] == null ? null : json["warning"],
        message: json["message"] == null ? null : json["message"],
        valid: json["valid"] == null ? null : json["valid"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null ? null : Obj.fromJson(json["obj"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "info": info == null ? null : info,
        "warning": warning == null ? null : warning,
        "message": message == null ? null : message,
        "valid": valid == null ? null : valid,
        "id": id,
        "model": model,
        "items": items,
        "obj": obj == null ? null : obj.toJson(),
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
  List<Note> diseaseList;
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
  List<dynamic> diagnosisList;
  dynamic dentalTreatment;
  List<Note> clinicalHistoryList;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        note: json["note"] == null ? null : Note.fromJson(json["note"]),
        treatmentList: json["treatmentList"] == null
            ? null
            : List<Note>.from(json["treatmentList"].map((x) => x)),
        diseaseList: json["diseaseList"] == null
            ? null
            : List<Note>.from(json["diseaseList"].map((x) => Note.fromJson(x))),
        chiefComplainList: json["chiefComplainList"] == null
            ? null
            : List<Note>.from(
                json["chiefComplainList"].map((x) => Note.fromJson(x))),
        finalizationThreeList: json["finalizationThreeList"] == null
            ? null
            : List<dynamic>.from(json["finalizationThreeList"].map((x) => x)),
        clinicalHistoryNote: json["clinicalHistoryNote"],
        clinicalHistory2List: json["clinicalHistory2List"] == null
            ? null
            : List<Note>.from(
                json["clinicalHistory2List"].map((x) => Note.fromJson(x))),
        medicationNote: json["medicationNote"],
        department: json["department"],
        prescriptionTemp: json["prescriptionTemp"] == null
            ? null
            : PrescriptionTemp.fromJson(json["prescriptionTemp"]),
        adviceList: json["adviceList"] == null
            ? null
            : List<Note>.from(json["adviceList"].map((x) => Note.fromJson(x))),
        eyeIpd: json["eyeIPD"],
        dietAdviceList: json["dietAdviceList"] == null
            ? null
            : List<dynamic>.from(json["dietAdviceList"].map((x) => x)),
        patHistoryList: json["patHistoryList"] == null
            ? null
            : List<dynamic>.from(json["patHistoryList"].map((x) => x)),
        referralDoctorList: json["referralDoctorList"] == null
            ? null
            : List<dynamic>.from(json["referralDoctorList"].map((x) => x)),
        investigationNote: json["investigationNote"],
        eyeRemarks: json["eyeRemarks"],
        patPhysicalExamList: json["patPhysicalExamList"] == null
            ? null
            : List<dynamic>.from(json["patPhysicalExamList"].map((x) => x)),
        finalizationOneList: json["finalizationOneList"] == null
            ? null
            : List<dynamic>.from(json["finalizationOneList"].map((x) => x)),
        medicineList: json["medicineList"] == null
            ? null
            : List<dynamic>.from(json["medicineList"].map((x) => x)),
        investigationList: json["investigationList"] == null
            ? null
            : List<Note>.from(
                json["investigationList"].map((x) => Note.fromJson(x))),
        clinicalHistory3List: json["clinicalHistory3List"] == null
            ? null
            : List<Note>.from(
                json["clinicalHistory3List"].map((x) => Note.fromJson(x))),
        finalizationTwoList: json["finalizationTwoList"] == null
            ? null
            : List<dynamic>.from(json["finalizationTwoList"].map((x) => x)),
        medicationList: json["medicationList"] == null
            ? null
            : List<MedicationList>.from(
                json["medicationList"].map((x) => MedicationList.fromJson(x))),
        diagnosisList: json["diagnosisList"] == null
            ? null
            : List<dynamic>.from(json["diagnosisList"].map((x) => x)),
        dentalTreatment: json["dentalTreatment"],
        clinicalHistoryList: json["clinicalHistoryList"] == null
            ? null
            : List<Note>.from(
                json["clinicalHistoryList"].map((x) => Note.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "note": note == null ? null : note.toJson(),
        "treatmentList": treatmentList == null
            ? null
            : List<dynamic>.from(treatmentList.map((x) => x)),
        "diseaseList": diseaseList == null
            ? null
            : List<Note>.from(diseaseList.map((x) => x.toJson())),
        "chiefComplainList": chiefComplainList == null
            ? null
            : List<dynamic>.from(chiefComplainList.map((x) => x.toJson())),
        "finalizationThreeList": finalizationThreeList == null
            ? null
            : List<dynamic>.from(finalizationThreeList.map((x) => x)),
        "clinicalHistoryNote": clinicalHistoryNote,
        "clinicalHistory2List": clinicalHistory2List == null
            ? null
            : List<dynamic>.from(clinicalHistory2List.map((x) => x.toJson())),
        "medicationNote": medicationNote,
        "department": department,
        "prescriptionTemp":
            prescriptionTemp == null ? null : prescriptionTemp.toJson(),
        "adviceList": adviceList == null
            ? null
            : List<dynamic>.from(adviceList.map((x) => x.toJson())),
        "eyeIPD": eyeIpd,
        "dietAdviceList": dietAdviceList == null
            ? null
            : List<dynamic>.from(dietAdviceList.map((x) => x)),
        "patHistoryList": patHistoryList == null
            ? null
            : List<dynamic>.from(patHistoryList.map((x) => x)),
        "referralDoctorList": referralDoctorList == null
            ? null
            : List<dynamic>.from(referralDoctorList.map((x) => x)),
        "investigationNote": investigationNote,
        "eyeRemarks": eyeRemarks,
        "patPhysicalExamList": patPhysicalExamList == null
            ? null
            : List<dynamic>.from(patPhysicalExamList.map((x) => x)),
        "finalizationOneList": finalizationOneList == null
            ? null
            : List<dynamic>.from(finalizationOneList.map((x) => x)),
        "medicineList": medicineList == null
            ? null
            : List<dynamic>.from(medicineList.map((x) => x)),
        "investigationList": investigationList == null
            ? null
            : List<dynamic>.from(investigationList.map((x) => x.toJson())),
        "clinicalHistory3List": clinicalHistory3List == null
            ? null
            : List<dynamic>.from(clinicalHistory3List.map((x) => x.toJson())),
        "finalizationTwoList": finalizationTwoList == null
            ? null
            : List<dynamic>.from(finalizationTwoList.map((x) => x)),
        "medicationList": medicationList == null
            ? null
            : List<dynamic>.from(medicationList.map((x) => x.toJson())),
        "diagnosisList": diagnosisList == null
            ? null
            : List<dynamic>.from(diagnosisList.map((x) => x)),
        "dentalTreatment": dentalTreatment,
        "clinicalHistoryList": clinicalHistoryList == null
            ? null
            : List<dynamic>.from(clinicalHistoryList.map((x) => x.toJson())),
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
        ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssCreatedOn"]],
        ssCreateSession:
            json["ssCreateSession"] == null ? null : json["ssCreateSession"],
        ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssModifiedOn"]],
        ssModifiedSession: json["ssModifiedSession"] == null
            ? null
            : json["ssModifiedSession"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        organizationNo: json["organizationNo"],
        id: json["id"] == null ? null : json["id"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        referenceId: json["referenceId"] == null ? null : json["referenceId"],
        duration: json["duration"],
        durationMu: json["durationMu"],
        timeDuration: json["timeDuration"],
        timeDurationMu: json["timeDurationMu"],
        quantity: json["quantity"],
        timePriod: json["timePriod"],
        followUpDate:
            json["followUpDate"] == null ? null : json["followUpDate"],
        findings: json["findings"],
        findingsClob: json["findingsClob"],
        continueFlag: json["continueFlag"],
        unit: json["unit"],
        headNo: json["headNo"],
        isDeleted: json["isDeleted"],
        isBold: json["isBold"] == null ? null : json["isBold"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator == null ? null : ssCreator,
        "ssCreatedOn":
            ssCreatedOn == null ? null : ssEdOnValues.reverse[ssCreatedOn],
        "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
        "ssModifier": ssModifier == null ? null : ssModifier,
        "ssModifiedOn":
            ssModifiedOn == null ? null : ssEdOnValues.reverse[ssModifiedOn],
        "ssModifiedSession":
            ssModifiedSession == null ? null : ssModifiedSession,
        "companyNo": companyNo == null ? null : companyNo,
        "organizationNo": organizationNo,
        "id": id == null ? null : id,
        "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
        "preDiagnosisValType":
            preDiagnosisValType == null ? null : preDiagnosisValType,
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
        "isBold": isBold == null ? null : isBold,
        "inReportSerial": inReportSerial == null ? null : inReportSerial,
        "activeStatus": activeStatus == null ? null : activeStatus,
      };
}

enum SsEdOn { THE_20210421_T07_48200000000 }

final ssEdOnValues = EnumValues(
    {"2021-04-21T07:48:20.000+0000": SsEdOn.THE_20210421_T07_48200000000});

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
        id: json["id"] == null ? null : json["id"],
        genericName: json["genericName"] == null ? null : json["genericName"],
        brandName: json["brandName"] == null ? null : json["brandName"],
        formName: json["formName"],
        itemNo: json["itemNo"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
        ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssCreatedOn"]],
        ssCreateSession:
            json["ssCreateSession"] == null ? null : json["ssCreateSession"],
        ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssModifiedOn"]],
        ssModifiedSession: json["ssModifiedSession"] == null
            ? null
            : json["ssModifiedSession"],
        presMedDtlList: json["presMedDtlList"] == null
            ? null
            : List<PresMedDtlList>.from(
                json["presMedDtlList"].map((x) => PresMedDtlList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "genericName": genericName == null ? null : genericName,
        "brandName": brandName == null ? null : brandName,
        "formName": formName,
        "itemNo": itemNo,
        "inReportSerial": inReportSerial == null ? null : inReportSerial,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "activeStatus": activeStatus == null ? null : activeStatus,
        "ssCreator": ssCreator == null ? null : ssCreator,
        "ssCreatedOn":
            ssCreatedOn == null ? null : ssEdOnValues.reverse[ssCreatedOn],
        "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
        "ssModifier": ssModifier == null ? null : ssModifier,
        "ssModifiedOn":
            ssModifiedOn == null ? null : ssEdOnValues.reverse[ssModifiedOn],
        "ssModifiedSession":
            ssModifiedSession == null ? null : ssModifiedSession,
        "presMedDtlList": presMedDtlList == null
            ? null
            : List<dynamic>.from(presMedDtlList.map((x) => x.toJson())),
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
        ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssCreatedOn"]],
        ssCreateSession:
            json["ssCreateSession"] == null ? null : json["ssCreateSession"],
        ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssModifiedOn"]],
        ssModifiedSession: json["ssModifiedSession"] == null
            ? null
            : json["ssModifiedSession"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        organizationNo: json["organizationNo"],
        id: json["id"] == null ? null : json["id"],
        dosage: json["dosage"] == null ? null : json["dosage"],
        duration: json["duration"] == null ? null : json["duration"],
        durationMu: json["durationMu"] == null ? null : json["durationMu"],
        durationComment: json["durationComment"],
        itemQty: json["itemQty"] == null ? null : json["itemQty"],
        medicineComment:
            json["medicineComment"] == null ? null : json["medicineComment"],
        eye: json["eye"],
        eyeDrop: json["eyeDrop"],
        inReportSerial:
            json["inReportSerial"] == null ? null : json["inReportSerial"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        continueFlag:
            json["continueFlag"] == null ? null : json["continueFlag"],
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator == null ? null : ssCreator,
        "ssCreatedOn":
            ssCreatedOn == null ? null : ssEdOnValues.reverse[ssCreatedOn],
        "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
        "ssModifier": ssModifier == null ? null : ssModifier,
        "ssModifiedOn":
            ssModifiedOn == null ? null : ssEdOnValues.reverse[ssModifiedOn],
        "ssModifiedSession":
            ssModifiedSession == null ? null : ssModifiedSession,
        "companyNo": companyNo == null ? null : companyNo,
        "organizationNo": organizationNo,
        "id": id == null ? null : id,
        "dosage": dosage == null ? null : dosage,
        "duration": duration == null ? null : duration,
        "durationMu": durationMu == null ? null : durationMu,
        "durationComment": durationComment,
        "itemQty": itemQty == null ? null : itemQty,
        "medicineComment": medicineComment == null ? null : medicineComment,
        "eye": eye,
        "eyeDrop": eyeDrop,
        "inReportSerial": inReportSerial == null ? null : inReportSerial,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "continueFlag": continueFlag == null ? null : continueFlag,
        "activeStatus": activeStatus == null ? null : activeStatus,
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

  factory PrescriptionTemp.fromJson(Map<String, dynamic> json) =>
      PrescriptionTemp(
        ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssCreatedOn"]],
        ssCreateSession:
            json["ssCreateSession"] == null ? null : json["ssCreateSession"],
        ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssModifiedOn"]],
        ssModifiedSession: json["ssModifiedSession"] == null
            ? null
            : json["ssModifiedSession"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        organizationNo:
            json["organizationNo"] == null ? null : json["organizationNo"],
        id: json["id"] == null ? null : json["id"],
        templateName:
            json["templateName"] == null ? null : json["templateName"],
        departmentNo: json["departmentNo"],
        doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
        ipdFlag: json["ipdFlag"] == null ? null : json["ipdFlag"],
        wardNo: json["wardNo"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator == null ? null : ssCreator,
        "ssCreatedOn":
            ssCreatedOn == null ? null : ssEdOnValues.reverse[ssCreatedOn],
        "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
        "ssModifier": ssModifier == null ? null : ssModifier,
        "ssModifiedOn":
            ssModifiedOn == null ? null : ssEdOnValues.reverse[ssModifiedOn],
        "ssModifiedSession":
            ssModifiedSession == null ? null : ssModifiedSession,
        "companyNo": companyNo == null ? null : companyNo,
        "organizationNo": organizationNo == null ? null : organizationNo,
        "id": id == null ? null : id,
        "templateName": templateName == null ? null : templateName,
        "departmentNo": departmentNo,
        "doctorNo": doctorNo == null ? null : doctorNo,
        "activeStatus": activeStatus == null ? null : activeStatus,
        "ipdFlag": ipdFlag == null ? null : ipdFlag,
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
