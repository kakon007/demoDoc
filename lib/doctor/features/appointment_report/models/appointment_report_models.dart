// To parse this JSON data, do
//
//     final appointmentReportListModel = appointmentReportListModelFromJson(jsonString);

import 'dart:convert';

AppointmentReportListModel appointmentReportListModelFromJson(String str) => AppointmentReportListModel.fromJson(json.decode(str));

String appointmentReportListModelToJson(AppointmentReportListModel data) => json.encode(data.toJson());

class AppointmentReportListModel {
  AppointmentReportListModel({
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

  factory AppointmentReportListModel.fromJson(Map<String, dynamic> json) => AppointmentReportListModel(
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
  String doctorName;
  String hospitalNo;
  String patientName;
  String phoneMobile;
  String startTime;
  String endTime;
  int shiftNo;
  String shiftName;
  String gender;
  String age;
  int companyNo;
  int ogNo;
  int patTypeNo;
  String patTypeName;
  dynamic fromDate;
  dynamic toDate;
  String remarks;
  int slotSl;
  int consultTypeNo;
  String consultTypeName;
  String companyName;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    appointmentNo: json["appointmentNo"] == null ? null : json["appointmentNo"],
    appointId: json["appointId"] == null ? null : json["appointId"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    appointDate: json["appointDate"] == null ? null : json["appointDate"],
    doctorName: json["doctorName"] == null ? null : json["doctorName"],
    hospitalNo: json["hospitalNo"] == null ? null : json["hospitalNo"],
    patientName: json["patientName"] == null ? null : json["patientName"],
    phoneMobile: json["phoneMobile"] == null ? null : json["phoneMobile"],
    startTime: json["startTime"] == null ? null : json["startTime"],
    endTime: json["endTime"] == null ? null : json["endTime"],
    shiftNo: json["shiftNo"] == null ? null : json["shiftNo"],
    shiftName: json["shiftName"] == null ? null : json["shiftName"],
    gender: json["gender"] == null ? null : json["gender"],
    age: json["age"] == null ? null : json["age"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    ogNo: json["ogNo"] == null ? null : json["ogNo"],
    patTypeNo: json["patTypeNo"] == null ? null : json["patTypeNo"],
    patTypeName: json["patTypeName"] == null ? null : json["patTypeName"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    remarks: json["remarks"] == null ? null : json["remarks"],
    slotSl: json["slotSl"] == null ? null : json["slotSl"],
    consultTypeNo: json["consultTypeNo"] == null ? null : json["consultTypeNo"],
    consultTypeName: json["consultTypeName"] == null ? null : json["consultTypeName"],
    companyName: json["companyName"] == null ? null : json["companyName"],
  );

  Map<String, dynamic> toJson() => {
    "appointmentNo": appointmentNo == null ? null : appointmentNo,
    "appointId": appointId == null ? null : appointId,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "appointDate": appointDate == null ? null : appointDate,
    "doctorName": doctorName == null ? null : doctorName,
    "hospitalNo": hospitalNo == null ? null : hospitalNo,
    "patientName": patientName == null ? null : patientName,
    "phoneMobile": phoneMobile == null ? null : phoneMobile,
    "startTime": startTime == null ? null : startTime,
    "endTime": endTime == null ? null : endTime,
    "shiftNo": shiftNo == null ? null : shiftNo,
    "shiftName": shiftName == null ? null : shiftName,
    "gender": gender == null ? null : gender,
    "age": age == null ? null : age,
    "companyNo": companyNo == null ? null : companyNo,
    "ogNo": ogNo == null ? null : ogNo,
    "patTypeNo": patTypeNo == null ? null : patTypeNo,
    "patTypeName": patTypeName == null ? null : patTypeName,
    "fromDate": fromDate,
    "toDate": toDate,
    "remarks": remarks == null ? null : remarks,
    "slotSl": slotSl == null ? null : slotSl,
    "consultTypeNo": consultTypeNo == null ? null : consultTypeNo,
    "consultTypeName": consultTypeName == null ? null : consultTypeName,
    "companyName": companyName == null ? null : companyName,
  };
}
