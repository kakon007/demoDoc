// To parse this JSON data, do
//
//     final worklistModel = worklistModelFromJson(jsonString);

import 'dart:convert';

WorkListModel workListModelFromJson(String str) => WorkListModel.fromJson(json.decode(str));

String workListModelToJson(WorkListModel data) => json.encode(data.toJson());

class WorkListModel {
  WorkListModel({
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

  factory WorkListModel.fromJson(Map<String, dynamic> json) => WorkListModel(
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
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  String draw;
  String recordsFiltered;
  String recordsTotal;
  List<Datum> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"],
    recordsFiltered: json["recordsFiltered"],
    recordsTotal: json["recordsTotal"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsFiltered": recordsFiltered,
    "recordsTotal": recordsTotal,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.appointId,
    this.registrationNo,
    this.hospitalId,
    this.patientName,
    this.phoneMobile,
    this.dateOfBirth,
    this.age,
    this.ageYy,
    this.ageMm,
    this.ageDd,
    this.gender,
    this.consultTypeNo,
    this.consultTypeDesc,
    this.bloodGroup,
    this.peAddr1,
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.docDegree,
    this.appointDate,
    this.shiftdtlNo,
    this.startTime,
    this.endTime,
    this.slotSl,
    this.consultationNo,
    this.consultationId,
    this.consDate,
    this.consultationFee,
    this.consultationIn,
    this.consultationOut,
    this.consTime,
    this.departmentNo,
    this.departmentName,
    this.consultationConfirmBy,
    this.consultationConfirmTime,
    this.prescriptionNo,
    this.prescriptionDateTime,
    this.isPatientIn,
    this.isPatientOut,
    this.isFeesPaid,
    this.ogNo,
    this.ogName,
    this.companyNo,
    this.companyName,
    this.consultationNoNotNull,
    this.fromDate,
    this.toDate,
    this.appointFilter,
    this.waitingFilter,
    this.doneFilter,
    this.consultTypeNoList,
    this.mstatus,
  });

  int id;
  String appointId;
  int registrationNo;
  String hospitalId;
  String patientName;
  String phoneMobile;
  String dateOfBirth;
  String age;
  int ageYy;
  int ageMm;
  int ageDd;
  String gender;
  int consultTypeNo;
  dynamic consultTypeDesc;
  dynamic bloodGroup;
  PeAddr1 peAddr1;
  int doctorNo;
  DoctorId doctorId;
  DoctorName doctorName;
  DocDegree docDegree;
  String appointDate;
  int shiftdtlNo;
  String startTime;
  String endTime;
  int slotSl;
  int consultationNo;
  String consultationId;
  String consDate;
  int consultationFee;
  int consultationIn;
  int consultationOut;
  String consTime;
  int departmentNo;
  DepartmentName departmentName;
  String consultationConfirmBy;
  String consultationConfirmTime;
  int prescriptionNo;
  String prescriptionDateTime;
  int isPatientIn;
  int isPatientOut;
  IsFeesPaid isFeesPaid;
  int ogNo;
  OgName ogName;
  int companyNo;
  CompanyName companyName;
  bool consultationNoNotNull;
  dynamic fromDate;
  dynamic toDate;
  bool appointFilter;
  bool waitingFilter;
  bool doneFilter;
  dynamic consultTypeNoList;
  dynamic mstatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    appointId: json["appointId"],
    registrationNo: json["registrationNo"],
    hospitalId: json["hospitalId"],
    patientName: json["patientName"],
    phoneMobile: json["phoneMobile"],
    dateOfBirth: json["dateOfBirth"],
    age: json["age"],
    ageYy: json["ageYy"],
    ageMm: json["ageMm"],
    ageDd: json["ageDd"],
    gender: json["gender"],
    consultTypeNo: json["consultTypeNo"],
    consultTypeDesc: json["consultTypeDesc"],
    bloodGroup: json["bloodGroup"],
    peAddr1: peAddr1Values.map[json["peAddr1"]],
    doctorNo: json["doctorNo"],
    doctorId: doctorIdValues.map[json["doctorId"]],
    doctorName: doctorNameValues.map[json["doctorName"]],
    docDegree: docDegreeValues.map[json["docDegree"]],
    appointDate: json["appointDate"],
    shiftdtlNo: json["shiftdtlNo"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    slotSl: json["slotSl"],
    consultationNo: json["consultationNo"],
    consultationId: json["consultationId"],
    consDate: json["consDate"],
    consultationFee: json["consultationFee"],
    consultationIn: json["consultationIn"],
    consultationOut: json["consultationOut"],
    consTime: json["consTime"],
    departmentNo: json["departmentNo"],
    departmentName: departmentNameValues.map[json["departmentName"]],
    consultationConfirmBy: json["consultationConfirmBy"],
    consultationConfirmTime: json["consultationConfirmTime"],
    prescriptionNo: json["prescriptionNo"] == null ? null : json["prescriptionNo"],
    prescriptionDateTime: json["prescriptionDateTime"] == null ? null : json["prescriptionDateTime"],
    isPatientIn: json["isPatientIn"] == null ? null : json["isPatientIn"],
    isPatientOut: json["isPatientOut"] == null ? null : json["isPatientOut"],
    isFeesPaid: isFeesPaidValues.map[json["isFeesPaid"]],
    ogNo: json["ogNo"],
    ogName: ogNameValues.map[json["ogName"]],
    companyNo: json["companyNo"],
    companyName: companyNameValues.map[json["companyName"]],
    consultationNoNotNull: json["consultationNoNotNull"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    appointFilter: json["appointFilter"],
    waitingFilter: json["waitingFilter"],
    doneFilter: json["doneFilter"],
    consultTypeNoList: json["consultTypeNoList"],
    mstatus: json["mstatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appointId": appointId,
    "registrationNo": registrationNo,
    "hospitalId": hospitalId,
    "patientName": patientName,
    "phoneMobile": phoneMobile,
    "dateOfBirth": dateOfBirth,
    "age": age,
    "ageYy": ageYy,
    "ageMm": ageMm,
    "ageDd": ageDd,
    "gender": genderValues.reverse[gender],
    "consultTypeNo": consultTypeNo,
    "consultTypeDesc": consultTypeDesc,
    "bloodGroup": bloodGroup,
    "peAddr1": peAddr1Values.reverse[peAddr1],
    "doctorNo": doctorNo,
    "doctorId": doctorIdValues.reverse[doctorId],
    "doctorName": doctorNameValues.reverse[doctorName],
    "docDegree": docDegreeValues.reverse[docDegree],
    "appointDate": appointDate,
    "shiftdtlNo": shiftdtlNo,
    "startTime": startTime,
    "endTime": endTime,
    "slotSl": slotSl,
    "consultationNo": consultationNo,
    "consultationId": consultationId,
    "consDate": consDate,
    "consultationFee": consultationFee,
    "consultationIn": consultationIn,
    "consultationOut": consultationOut,
    "consTime": consTime,
    "departmentNo": departmentNo,
    "departmentName": departmentNameValues.reverse[departmentName],
    "consultationConfirmBy": consultationConfirmBy,
    "consultationConfirmTime": consultationConfirmTime,
    "prescriptionNo": prescriptionNo == null ? null : prescriptionNo,
    "prescriptionDateTime": prescriptionDateTime == null ? null : prescriptionDateTime,
    "isPatientIn": isPatientIn == null ? null : isPatientIn,
    "isPatientOut": isPatientOut == null ? null : isPatientOut,
    "isFeesPaid": isFeesPaidValues.reverse[isFeesPaid],
    "ogNo": ogNo,
    "ogName": ogNameValues.reverse[ogName],
    "companyNo": companyNo,
    "companyName": companyNameValues.reverse[companyName],
    "consultationNoNotNull": consultationNoNotNull,
    "fromDate": fromDate,
    "toDate": toDate,
    "appointFilter": appointFilter,
    "waitingFilter": waitingFilter,
    "doneFilter": doneFilter,
    "consultTypeNoList": consultTypeNoList,
    "mstatus": mstatus,
  };
}

enum CompanyName { AALOK_HEALTHCARE_LTD_BRANCH_MIRPUR_10 }

final companyNameValues = EnumValues({
  "Aalok Healthcare Ltd (Branch Mirpur 10) ": CompanyName.AALOK_HEALTHCARE_LTD_BRANCH_MIRPUR_10
});

enum DepartmentName { MEDICINE }

final departmentNameValues = EnumValues({
  "MEDICINE": DepartmentName.MEDICINE
});

enum DocDegree { BCS_HEALTH_MD_CHEST_SPECIALIST_MEDICINE }

final docDegreeValues = EnumValues({
  "BCS (Health), MD (Chest specialist & Medicine)": DocDegree.BCS_HEALTH_MD_CHEST_SPECIALIST_MEDICINE
});

enum DoctorId { AALOKMAIN03 }

final doctorIdValues = EnumValues({
  "aalokmain03": DoctorId.AALOKMAIN03
});

enum DoctorName { ASSOC_PROF_DR_MAHMUD_RAHIM }

final doctorNameValues = EnumValues({
  "Assoc. Prof. Dr. Mahmud Rahim": DoctorName.ASSOC_PROF_DR_MAHMUD_RAHIM
});

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE
});

enum IsFeesPaid { FEES_PAID }

final isFeesPaidValues = EnumValues({
  "Fees Paid": IsFeesPaid.FEES_PAID
});

enum OgName { AALOK_HEALTHCARE_LIMITED }

final ogNameValues = EnumValues({
  "AALOK Healthcare Limited": OgName.AALOK_HEALTHCARE_LIMITED
});

enum PeAddr1 { DHAKA }

final peAddr1Values = EnumValues({
  "Dhaka": PeAddr1.DHAKA
});

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
