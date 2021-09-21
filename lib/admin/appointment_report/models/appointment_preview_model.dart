// To parse this JSON data, do
//
//     final appointmentPreviewModel = appointmentPreviewModelFromJson(jsonString);

import 'dart:convert';

AppointmentPreviewModel appointmentPreviewModelFromJson(String str) => AppointmentPreviewModel.fromJson(json.decode(str));

String appointmentPreviewModelToJson(AppointmentPreviewModel data) => json.encode(data.toJson());

class AppointmentPreviewModel {
  AppointmentPreviewModel({
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
  List<Item> items;
  dynamic obj;

  factory AppointmentPreviewModel.fromJson(Map<String, dynamic> json) => AppointmentPreviewModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    obj: json["obj"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "info": info == null ? null : info,
    "warning": warning == null ? null : warning,
    "message": message == null ? null : message,
    "valid": valid == null ? null : valid,
    "id": id,
    "model": model,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj,
  };
}

class Item {
  Item({
    this.appointmentNo,
    this.appointId,
    this.doctorNo,
    this.appointDate,
    this.doctorName,
    this.hospitalNo,
    this.patientName,
    this.phoneMobile,
    this.startTime,
    this.endTime,
    this.shiftNo,
    this.shiftName,
    this.gender,
    this.age,
    this.companyNo,
    this.ogNo,
    this.patTypeNo,
    this.patTypeName,
    this.fromDate,
    this.toDate,
    this.remarks,
    this.slotSl,
    this.consultTypeNo,
    this.consultTypeName,
    this.companyName,
  });

  int appointmentNo;
  String appointId;
  int doctorNo;
  String appointDate;
  DoctorName doctorName;
  String hospitalNo;
  String patientName;
  String phoneMobile;
  String startTime;
  String endTime;
  int shiftNo;
  ShiftName shiftName;
  Gender gender;
  String age;
  int companyNo;
  int ogNo;
  int patTypeNo;
  PatTypeName patTypeName;
  dynamic fromDate;
  dynamic toDate;
  Remarks remarks;
  int slotSl;
  int consultTypeNo;
  ConsultTypeName consultTypeName;
  CompanyName companyName;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    appointmentNo: json["appointmentNo"] == null ? null : json["appointmentNo"],
    appointId: json["appointId"] == null ? null : json["appointId"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    appointDate: json["appointDate"] == null ? null : json["appointDate"],
    doctorName: json["doctorName"] == null ? null : doctorNameValues.map[json["doctorName"]],
    hospitalNo: json["hospitalNo"] == null ? null : json["hospitalNo"],
    patientName: json["patientName"] == null ? null : json["patientName"],
    phoneMobile: json["phoneMobile"] == null ? null : json["phoneMobile"],
    startTime: json["startTime"] == null ? null : json["startTime"],
    endTime: json["endTime"] == null ? null : json["endTime"],
    shiftNo: json["shiftNo"] == null ? null : json["shiftNo"],
    shiftName: json["shiftName"] == null ? null : shiftNameValues.map[json["shiftName"]],
    gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
    age: json["age"] == null ? null : json["age"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    ogNo: json["ogNo"] == null ? null : json["ogNo"],
    patTypeNo: json["patTypeNo"] == null ? null : json["patTypeNo"],
    patTypeName: json["patTypeName"] == null ? null : patTypeNameValues.map[json["patTypeName"]],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    remarks: json["remarks"] == null ? null : remarksValues.map[json["remarks"]],
    slotSl: json["slotSl"] == null ? null : json["slotSl"],
    consultTypeNo: json["consultTypeNo"] == null ? null : json["consultTypeNo"],
    consultTypeName: json["consultTypeName"] == null ? null : consultTypeNameValues.map[json["consultTypeName"]],
    companyName: json["companyName"] == null ? null : companyNameValues.map[json["companyName"]],
  );

  Map<String, dynamic> toJson() => {
    "appointmentNo": appointmentNo == null ? null : appointmentNo,
    "appointId": appointId == null ? null : appointId,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "appointDate": appointDate == null ? null : appointDate,
    "doctorName": doctorName == null ? null : doctorNameValues.reverse[doctorName],
    "hospitalNo": hospitalNo == null ? null : hospitalNo,
    "patientName": patientName == null ? null : patientName,
    "phoneMobile": phoneMobile == null ? null : phoneMobile,
    "startTime": startTime == null ? null : startTime,
    "endTime": endTime == null ? null : endTime,
    "shiftNo": shiftNo == null ? null : shiftNo,
    "shiftName": shiftName == null ? null : shiftNameValues.reverse[shiftName],
    "gender": gender == null ? null : genderValues.reverse[gender],
    "age": age == null ? null : age,
    "companyNo": companyNo == null ? null : companyNo,
    "ogNo": ogNo == null ? null : ogNo,
    "patTypeNo": patTypeNo == null ? null : patTypeNo,
    "patTypeName": patTypeName == null ? null : patTypeNameValues.reverse[patTypeName],
    "fromDate": fromDate,
    "toDate": toDate,
    "remarks": remarks == null ? null : remarksValues.reverse[remarks],
    "slotSl": slotSl == null ? null : slotSl,
    "consultTypeNo": consultTypeNo == null ? null : consultTypeNo,
    "consultTypeName": consultTypeName == null ? null : consultTypeNameValues.reverse[consultTypeName],
    "companyName": companyName == null ? null : companyNameValues.reverse[companyName],
  };
}

enum CompanyName { AALOK_HEALTHCARE_LTD_BRANCH_MIRPUR_10 }

final companyNameValues = EnumValues({
  "Aalok Healthcare Ltd (Branch Mirpur 10) ": CompanyName.AALOK_HEALTHCARE_LTD_BRANCH_MIRPUR_10
});

enum ConsultTypeName { THE_1_ST_FOLLOW_UP, NEW_PATIENT, REPORT_CHECK }

final consultTypeNameValues = EnumValues({
  "NEW PATIENT": ConsultTypeName.NEW_PATIENT,
  "REPORT CHECK": ConsultTypeName.REPORT_CHECK,
  "1ST FOLLOW UP": ConsultTypeName.THE_1_ST_FOLLOW_UP
});

enum DoctorName { ASSOC_PROF_DR_MAHMUD_RAHIM, DR_ABDUR_RAHIM, DR_IMNUL_ISLAM_IMON, DR_P_C_DEBNATH, DR_T_I_KHAN_TOUHID, PROF_DR_MD_SELIMUZZAMAN }

final doctorNameValues = EnumValues({
  "Assoc. Prof. Dr. Mahmud Rahim": DoctorName.ASSOC_PROF_DR_MAHMUD_RAHIM,
  "Dr. Abdur Rahim": DoctorName.DR_ABDUR_RAHIM,
  "Dr. Imnul Islam Imon": DoctorName.DR_IMNUL_ISLAM_IMON,
  "Dr. P. C. Debnath": DoctorName.DR_P_C_DEBNATH,
  "Dr. T. I Khan Touhid": DoctorName.DR_T_I_KHAN_TOUHID,
  "Prof. Dr. Md. Selimuzzaman": DoctorName.PROF_DR_MD_SELIMUZZAMAN
});

enum Gender { MALE, FEMALE, OTHERS }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE,
  "Others": Gender.OTHERS
});

enum PatTypeName { NEW_PATIENT_NOT_REGISTERED, REGISTERED_PATIENT }

final patTypeNameValues = EnumValues({
  "New Patient (Not Registered)": PatTypeName.NEW_PATIENT_NOT_REGISTERED,
  "Registered Patient": PatTypeName.REGISTERED_PATIENT
});

enum Remarks { ONLINE_APPOINTMENT, REMARKS_ONLINE_APPOINTMENT }

final remarksValues = EnumValues({
  "online appointment": Remarks.ONLINE_APPOINTMENT,
  "Online Appointment": Remarks.REMARKS_ONLINE_APPOINTMENT
});

enum ShiftName { MORNING, EVENING }

final shiftNameValues = EnumValues({
  "Evening": ShiftName.EVENING,
  "Morning": ShiftName.MORNING
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

