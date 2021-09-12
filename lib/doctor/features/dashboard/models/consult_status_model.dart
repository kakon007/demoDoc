// To parse this JSON data, do
//
//     final consultationStatusModel = consultationStatusModelFromJson(jsonString);

import 'dart:convert';

ConsultationStatusModel consultationStatusModelFromJson(String str) => ConsultationStatusModel.fromJson(json.decode(str));

String consultationStatusModelToJson(ConsultationStatusModel data) => json.encode(data.toJson());

class ConsultationStatusModel {
  ConsultationStatusModel({
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

  factory ConsultationStatusModel.fromJson(Map<String, dynamic> json) => ConsultationStatusModel(
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
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.appointDate,
    this.consultTypeNo,
    this.isPatientOut,
    this.consultIn,
    this.shiftNo,
    this.notPaid,
    this.totalAppointed,
    this.freshVisit,
    this.firstFollowUp,
    this.secondFollowUp,
    this.reportCheck,
    this.paid,
    this.done,
    this.waiting,
    this.consultationPending,
    this.morningShift,
    this.eveningShift,
    this.canceled,
    this.fromDate,
    this.toDate,
    this.all,
  });

  int doctorNo;
  String doctorId;
  String doctorName;
  String appointDate;
  dynamic consultTypeNo;
  dynamic isPatientOut;
  dynamic consultIn;
  dynamic shiftNo;
  dynamic notPaid;
  int totalAppointed;
  int freshVisit;
  int firstFollowUp;
  int secondFollowUp;
  int reportCheck;
  int paid;
  int done;
  int waiting;
  int consultationPending;
  int morningShift;
  int eveningShift;
  int canceled;
  dynamic fromDate;
  dynamic toDate;
  int all;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    doctorId: json["doctorId"] == null ? null : json["doctorId"],
    doctorName: json["doctorName"] == null ? null : json["doctorName"],
    appointDate: json["appointDate"] == null ? null : json["appointDate"],
    consultTypeNo: json["consultTypeNo"],
    isPatientOut: json["isPatientOut"],
    consultIn: json["consultIn"],
    shiftNo: json["shiftNo"],
    notPaid: json["notPaid"],
    totalAppointed: json["totalAppointed"] == null ? null : json["totalAppointed"],
    freshVisit: json["freshVisit"] == null ? null : json["freshVisit"],
    firstFollowUp: json["firstFollowUp"] == null ? null : json["firstFollowUp"],
    secondFollowUp: json["secondFollowUp"] == null ? null : json["secondFollowUp"],
    reportCheck: json["reportCheck"] == null ? null : json["reportCheck"],
    paid: json["paid"] == null ? null : json["paid"],
    done: json["done"] == null ? null : json["done"],
    waiting: json["waiting"] == null ? null : json["waiting"],
    consultationPending: json["consultationPending"] == null ? null : json["consultationPending"],
    morningShift: json["morningShift"] == null ? null : json["morningShift"],
    eveningShift: json["eveningShift"] == null ? null : json["eveningShift"],
    canceled: json["canceled"] == null ? null : json["canceled"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    all: json["all"] == null ? null : json["all"],
  );

  Map<String, dynamic> toJson() => {
    "doctorNo": doctorNo == null ? null : doctorNo,
    "doctorId": doctorId == null ? null : doctorId,
    "doctorName": doctorName == null ? null : doctorName,
    "appointDate": appointDate == null ? null : appointDate,
    "consultTypeNo": consultTypeNo,
    "isPatientOut": isPatientOut,
    "consultIn": consultIn,
    "shiftNo": shiftNo,
    "notPaid": notPaid,
    "totalAppointed": totalAppointed == null ? null : totalAppointed,
    "freshVisit": freshVisit == null ? null : freshVisit,
    "firstFollowUp": firstFollowUp == null ? null : firstFollowUp,
    "secondFollowUp": secondFollowUp == null ? null : secondFollowUp,
    "reportCheck": reportCheck == null ? null : reportCheck,
    "paid": paid == null ? null : paid,
    "done": done == null ? null : done,
    "waiting": waiting == null ? null : waiting,
    "consultationPending": consultationPending == null ? null : consultationPending,
    "morningShift": morningShift == null ? null : morningShift,
    "eveningShift": eveningShift == null ? null : eveningShift,
    "canceled": canceled == null ? null : canceled,
    "fromDate": fromDate,
    "toDate": toDate,
    "all": all == null ? null : all,
  };
}
