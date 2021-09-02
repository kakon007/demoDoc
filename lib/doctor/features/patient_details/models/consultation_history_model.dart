// To parse this JSON data, do
//
//     final consultationHistoryModel = consultationHistoryModelFromJson(jsonString);

import 'dart:convert';

ConsultationHistoryModel consultationHistoryModelFromJson(String str) => ConsultationHistoryModel.fromJson(json.decode(str));

String consultationHistoryModelToJson(ConsultationHistoryModel data) => json.encode(data.toJson());

class ConsultationHistoryModel {
  ConsultationHistoryModel({
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

  factory ConsultationHistoryModel.fromJson(Map<String, dynamic> json) => ConsultationHistoryModel(
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
    this.prescriptionId,
    this.consultationNo,
    this.doctorName,
    this.createdDate,
    this.disease,
    this.prescription,
    this.consultationId,
    this.doctorNo,
  });

  int prescriptionId;
  int consultationNo;
  String doctorName;
  String createdDate;
  dynamic disease;
  Prescription prescription;
  String consultationId;
  int doctorNo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    prescriptionId: json["prescriptionId"] == null ? null : json["prescriptionId"],
    consultationNo: json["consultationNo"] == null ? null : json["consultationNo"],
    doctorName: json["doctorName"] == null ? null : json["doctorName"],
    createdDate: json["createdDate"] == null ? null : json["createdDate"],
    disease: json["disease"],
    prescription: json["prescription"] == null ? null : Prescription.fromJson(json["prescription"]),
    consultationId: json["consultationId"] == null ? null : json["consultationId"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
  );

  Map<String, dynamic> toJson() => {
    "prescriptionId": prescriptionId == null ? null : prescriptionId,
    "consultationNo": consultationNo == null ? null : consultationNo,
    "doctorName": doctorName == null ? null : doctorName,
    "createdDate": createdDate == null ? null : createdDate,
    "disease": disease,
    "prescription": prescription == null ? null : prescription.toJson(),
    "consultationId": consultationId == null ? null : consultationId,
    "doctorNo": doctorNo == null ? null : doctorNo,
  };
}

class Prescription {
  Prescription({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.registrationNo,
    this.hospitalId,
    this.consultationNo,
    this.consultationId,
    this.doctorNo,
    this.appointmentNo,
    this.departmentNo,
    this.departmentName,
    this.isPatientIn,
    this.isPatientOut,
    this.activeStatus,
    this.ipdFlag,
    this.admissionNo,
    this.admissionId,
    this.wardNo,
    this.wardName,
    this.bedId,
    this.bedName,
    this.continuePresFlag,
    this.continuePresNo,
    this.refferedPresFlag,
    this.refferedPresNo,
    this.consultationTypeNo,
    this.patientTypeNo,
    this.shiftNo,
    this.fromDate,
    this.toDate,
    this.refNo,
    this.doctorName,
    this.nurseName,
    this.doctorInfo,
    this.consulatation,
    this.continuePrescriptionList,
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
  int registrationNo;
  String hospitalId;
  int consultationNo;
  String consultationId;
  int doctorNo;
  int appointmentNo;
  int departmentNo;
  String departmentName;
  int isPatientIn;
  int isPatientOut;
  int activeStatus;
  int ipdFlag;
  dynamic admissionNo;
  dynamic admissionId;
  dynamic wardNo;
  dynamic wardName;
  dynamic bedId;
  dynamic bedName;
  int continuePresFlag;
  dynamic continuePresNo;
  int refferedPresFlag;
  dynamic refferedPresNo;
  dynamic consultationTypeNo;
  dynamic patientTypeNo;
  dynamic shiftNo;
  dynamic fromDate;
  dynamic toDate;
  dynamic refNo;
  dynamic doctorName;
  dynamic nurseName;
  dynamic doctorInfo;
  dynamic consulatation;
  dynamic continuePrescriptionList;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
    id: json["id"] == null ? null : json["id"],
    registrationNo: json["registrationNo"] == null ? null : json["registrationNo"],
    hospitalId: json["hospitalId"] == null ? null : json["hospitalId"],
    consultationNo: json["consultationNo"] == null ? null : json["consultationNo"],
    consultationId: json["consultationId"] == null ? null : json["consultationId"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    appointmentNo: json["appointmentNo"] == null ? null : json["appointmentNo"],
    departmentNo: json["departmentNo"] == null ? null : json["departmentNo"],
    departmentName: json["departmentName"] == null ? null : json["departmentName"],
    isPatientIn: json["isPatientIn"] == null ? null : json["isPatientIn"],
    isPatientOut: json["isPatientOut"] == null ? null : json["isPatientOut"],
    activeStatus: json["activeStatus"] == null ? null : json["activeStatus"],
    ipdFlag: json["ipdFlag"] == null ? null : json["ipdFlag"],
    admissionNo: json["admissionNo"],
    admissionId: json["admissionId"],
    wardNo: json["wardNo"],
    wardName: json["wardName"],
    bedId: json["bedId"],
    bedName: json["bedName"],
    continuePresFlag: json["continuePresFlag"] == null ? null : json["continuePresFlag"],
    continuePresNo: json["continuePresNo"],
    refferedPresFlag: json["refferedPresFlag"] == null ? null : json["refferedPresFlag"],
    refferedPresNo: json["refferedPresNo"],
    consultationTypeNo: json["consultationTypeNo"],
    patientTypeNo: json["patientTypeNo"],
    shiftNo: json["shiftNo"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    refNo: json["refNo"],
    doctorName: json["doctorName"],
    nurseName: json["nurseName"],
    doctorInfo: json["doctorInfo"],
    consulatation: json["consulatation"],
    continuePrescriptionList: json["continuePrescriptionList"],
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
    "registrationNo": registrationNo == null ? null : registrationNo,
    "hospitalId": hospitalId == null ? null : hospitalId,
    "consultationNo": consultationNo == null ? null : consultationNo,
    "consultationId": consultationId == null ? null : consultationId,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "appointmentNo": appointmentNo == null ? null : appointmentNo,
    "departmentNo": departmentNo == null ? null : departmentNo,
    "departmentName": departmentName == null ? null : departmentName,
    "isPatientIn": isPatientIn == null ? null : isPatientIn,
    "isPatientOut": isPatientOut == null ? null : isPatientOut,
    "activeStatus": activeStatus == null ? null : activeStatus,
    "ipdFlag": ipdFlag == null ? null : ipdFlag,
    "admissionNo": admissionNo,
    "admissionId": admissionId,
    "wardNo": wardNo,
    "wardName": wardName,
    "bedId": bedId,
    "bedName": bedName,
    "continuePresFlag": continuePresFlag == null ? null : continuePresFlag,
    "continuePresNo": continuePresNo,
    "refferedPresFlag": refferedPresFlag == null ? null : refferedPresFlag,
    "refferedPresNo": refferedPresNo,
    "consultationTypeNo": consultationTypeNo,
    "patientTypeNo": patientTypeNo,
    "shiftNo": shiftNo,
    "fromDate": fromDate,
    "toDate": toDate,
    "refNo": refNo,
    "doctorName": doctorName,
    "nurseName": nurseName,
    "doctorInfo": doctorInfo,
    "consulatation": consulatation,
    "continuePrescriptionList": continuePrescriptionList,
  };
}
