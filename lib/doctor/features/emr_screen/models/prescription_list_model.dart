// To parse this JSON data, do
//
//     final emrPrescriptionListModel = emrPrescriptionListModelFromJson(jsonString);

import 'dart:convert';

EmrPrescriptionListModel emrPrescriptionListModelFromJson(String str) => EmrPrescriptionListModel.fromJson(json.decode(str));

String emrPrescriptionListModelToJson(EmrPrescriptionListModel data) => json.encode(data.toJson());

class EmrPrescriptionListModel {
  EmrPrescriptionListModel({
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

  factory EmrPrescriptionListModel.fromJson(Map<String, dynamic> json) => EmrPrescriptionListModel(
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
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  String draw;
  String recordsFiltered;
  int recordsTotal;
  List<Datum> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"] == null ? null : json["draw"],
    recordsFiltered: json["recordsFiltered"] == null ? null : json["recordsFiltered"],
    recordsTotal: json["recordsTotal"]==null?0:int.parse(json["recordsTotal"]?.toString()??"0"),
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw == null ? null : draw,
    "recordsFiltered": recordsFiltered == null ? null : recordsFiltered,
    "recordsTotal": recordsTotal == null ? null : recordsTotal,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.appointmentNo,
    this.consultationId,
    this.consultationNo,
    this.doctorNo,
    this.doctorName,
    this.doctorSignature,
    this.hospitalId,
    this.isPatientIn,
    this.isPatientOut,
    this.patientName,
    this.departmentNo,
    this.departmentName,
    this.admissionNo,
    this.admissionId,
    this.activeStatus,
    this.bedId,
    this.bedName,
    this.wardNo,
    this.wardName,
    this.continuePresFlag,
    this.continuePresNo,
    this.registrationNo,
    this.consultationTypeNo,
    this.patientTypeNo,
    this.shiftNo,
    this.fromDate,
    this.toDate,
    this.consulatation,
  });

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int id;
  int appointmentNo;
  String consultationId;
  int consultationNo;
  int doctorNo;
  String doctorName;
  String doctorSignature;
  String hospitalId;
  int isPatientIn;
  int isPatientOut;
  String patientName;
  int departmentNo;
  String departmentName;
  dynamic admissionNo;
  dynamic admissionId;
  int activeStatus;
  dynamic bedId;
  dynamic bedName;
  dynamic wardNo;
  dynamic wardName;
  int continuePresFlag;
  dynamic continuePresNo;
  int registrationNo;
  dynamic consultationTypeNo;
  dynamic patientTypeNo;
  dynamic shiftNo;
  dynamic fromDate;
  dynamic toDate;
  dynamic consulatation;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
    id: json["id"] == null ? null : json["id"],
    appointmentNo: json["appointmentNo"] == null ? null : json["appointmentNo"],
    consultationId: json["consultationId"] == null ? null : json["consultationId"],
    consultationNo: json["consultationNo"] == null ? null : json["consultationNo"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    doctorName: json["doctorName"] == null ? null : json["doctorName"],
    doctorSignature: json["doctorSignature"] == null ? null : json["doctorSignature"],
    hospitalId: json["hospitalId"] == null ? null : json["hospitalId"],
    isPatientIn: json["isPatientIn"] == null ? null : json["isPatientIn"],
    isPatientOut: json["isPatientOut"] == null ? null : json["isPatientOut"],
    patientName: json["patientName"] == null ? null : json["patientName"],
    departmentNo: json["departmentNo"] == null ? null : json["departmentNo"],
    departmentName: json["departmentName"] == null ? null : json["departmentName"],
    admissionNo: json["admissionNo"],
    admissionId: json["admissionId"],
    activeStatus: json["activeStatus"] == null ? null : json["activeStatus"],
    bedId: json["bedId"],
    bedName: json["bedName"],
    wardNo: json["wardNo"],
    wardName: json["wardName"],
    continuePresFlag: json["continuePresFlag"] == null ? null : json["continuePresFlag"],
    continuePresNo: json["continuePresNo"],
    registrationNo: json["registrationNo"] == null ? null : json["registrationNo"],
    consultationTypeNo: json["consultationTypeNo"],
    patientTypeNo: json["patientTypeNo"],
    shiftNo: json["shiftNo"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    consulatation: json["consulatation"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator == null ? null : ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "companyNo": companyNo == null ? null : companyNo,
    "organizationNo": organizationNo == null ? null : organizationNo,
    "id": id == null ? null : id,
    "appointmentNo": appointmentNo == null ? null : appointmentNo,
    "consultationId": consultationId == null ? null : consultationId,
    "consultationNo": consultationNo == null ? null : consultationNo,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "doctorName": doctorName == null ? null : doctorName,
    "doctorSignature": doctorSignature == null ? null : doctorSignature,
    "hospitalId": hospitalId == null ? null : hospitalId,
    "isPatientIn": isPatientIn == null ? null : isPatientIn,
    "isPatientOut": isPatientOut == null ? null : isPatientOut,
    "patientName": patientName == null ? null : patientName,
    "departmentNo": departmentNo == null ? null : departmentNo,
    "departmentName": departmentName == null ? null : departmentName,
    "admissionNo": admissionNo,
    "admissionId": admissionId,
    "activeStatus": activeStatus == null ? null : activeStatus,
    "bedId": bedId,
    "bedName": bedName,
    "wardNo": wardNo,
    "wardName": wardName,
    "continuePresFlag": continuePresFlag == null ? null : continuePresFlag,
    "continuePresNo": continuePresNo,
    "registrationNo": registrationNo == null ? null : registrationNo,
    "consultationTypeNo": consultationTypeNo,
    "patientTypeNo": patientTypeNo,
    "shiftNo": shiftNo,
    "fromDate": fromDate,
    "toDate": toDate,
    "consulatation": consulatation,
  };
}



