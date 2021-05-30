// To parse this JSON data, do
//
//     final nearestAppointmentCardModel = nearestAppointmentCardModelFromJson(jsonString);

import 'dart:convert';

NearestAppointmentCardModel nearestAppointmentCardModelFromJson(String str) => NearestAppointmentCardModel.fromJson(json.decode(str));

String nearestAppointmentCardModelToJson(NearestAppointmentCardModel data) => json.encode(data.toJson());

class NearestAppointmentCardModel {
  NearestAppointmentCardModel({
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

  factory NearestAppointmentCardModel.fromJson(Map<String, dynamic> json) => NearestAppointmentCardModel(
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
    this.appointNo,
    this.appointId,
    this.appointDate,
    this.doctorNo,
    this.doctorName,
    this.doctorImage,
    this.specialtyNo,
    this.doctorSpecialtyName,
    this.shiftNo,
    this.consultTypeNo,
    this.consultTypeName,
    this.slotSl,
    this.startTime,
    this.endTime,
    this.regNo,
    this.regId,
    this.patientName,
    this.companyName,
    this.companyAlias,
    this.prescriptionNo,
    this.consultationNo,
    this.consultationId,
    this.status,
    this.statusArr,
    this.photo,
  });

  int appointNo;
  String appointId;
  String appointDate;
  int doctorNo;
  String doctorName;
  String doctorImage;
  int specialtyNo;
  String doctorSpecialtyName;
  int shiftNo;
  int consultTypeNo;
  String consultTypeName;
  int slotSl;
  String startTime;
  String endTime;
  int regNo;
  String regId;
  String patientName;
  String companyName;
  String companyAlias;
  dynamic prescriptionNo;
  dynamic consultationNo;
  dynamic consultationId;
  int status;
  dynamic statusArr;
  dynamic photo;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    appointNo: json["appointNo"] == null ? null : json["appointNo"],
    appointId: json["appointId"] == null ? null : json["appointId"],
    appointDate: json["appointDate"] == null ? null : json["appointDate"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    doctorName: json["doctorName"] == null ? null : json["doctorName"],
    doctorImage: json["doctorImage"] == null ? null : json["doctorImage"],
    specialtyNo: json["specialtyNo"] == null ? null : json["specialtyNo"],
    doctorSpecialtyName: json["doctorSpecialtyName"] == null ? null : json["doctorSpecialtyName"],
    shiftNo: json["shiftNo"] == null ? null : json["shiftNo"],
    consultTypeNo: json["consultTypeNo"] == null ? null : json["consultTypeNo"],
    consultTypeName: json["consultTypeName"] == null ? null : json["consultTypeName"],
    slotSl: json["slotSl"] == null ? null : json["slotSl"],
    startTime: json["startTime"] == null ? null : json["startTime"],
    endTime: json["endTime"] == null ? null : json["endTime"],
    regNo: json["regNo"] == null ? null : json["regNo"],
    regId: json["regId"] == null ? null : json["regId"],
    patientName: json["patientName"] == null ? null : json["patientName"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    companyAlias: json["companyAlias"] == null ? null : json["companyAlias"],
    prescriptionNo: json["prescriptionNo"],
    consultationNo: json["consultationNo"],
    consultationId: json["consultationId"],
    status: json["status"] == null ? null : json["status"],
    statusArr: json["statusArr"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "appointNo": appointNo == null ? null : appointNo,
    "appointId": appointId == null ? null : appointId,
    "appointDate": appointDate == null ? null : appointDate,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "doctorName": doctorName == null ? null : doctorName,
    "doctorImage": doctorImage == null ? null : doctorImage,
    "specialtyNo": specialtyNo == null ? null : specialtyNo,
    "doctorSpecialtyName": doctorSpecialtyName == null ? null : doctorSpecialtyName,
    "shiftNo": shiftNo == null ? null : shiftNo,
    "consultTypeNo": consultTypeNo == null ? null : consultTypeNo,
    "consultTypeName": consultTypeName == null ? null : consultTypeName,
    "slotSl": slotSl == null ? null : slotSl,
    "startTime": startTime == null ? null : startTime,
    "endTime": endTime == null ? null : endTime,
    "regNo": regNo == null ? null : regNo,
    "regId": regId == null ? null : regId,
    "patientName": patientName == null ? null : patientName,
    "companyName": companyName == null ? null : companyName,
    "companyAlias": companyAlias == null ? null : companyAlias,
    "prescriptionNo": prescriptionNo,
    "consultationNo": consultationNo,
    "consultationId": consultationId,
    "status": status == null ? null : status,
    "statusArr": statusArr,
    "photo": photo,
  };
}
