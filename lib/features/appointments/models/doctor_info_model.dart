// To parse this JSON data, do
//
//     final doctorInfoModel = doctorInfoModelFromJson(jsonString);

import 'dart:convert';

DoctorInfoModel doctorInfoModelFromJson(String str) => DoctorInfoModel.fromJson(json.decode(str));

String doctorInfoModelToJson(DoctorInfoModel data) => json.encode(data.toJson());

class DoctorInfoModel {
  DoctorInfoModel({
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

  factory DoctorInfoModel.fromJson(Map<String, dynamic> json) => DoctorInfoModel(
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
    this.id,
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.jobtitleNo,
    this.jobtitle,
    this.docDegree,
    this.specializationNo,
    this.specializationName,
    this.gender,
    this.activeStat,
    this.chamber,
    this.doctorPhoto,
    this.companyNo,
    this.ogNo,
    this.consultationFee,
    this.buNo,
    this.buName,
    this.onlineDoctorFlag,
    this.specList,
    this.buList,
    this.photo,
  });

  int id;
  int doctorNo;
  String doctorId;
  String doctorName;
  int jobtitleNo;
  String jobtitle;
  String docDegree;
  int specializationNo;
  String specializationName;
  String gender;
  int activeStat;
  dynamic chamber;
  String doctorPhoto;
  int companyNo;
  int ogNo;
  int consultationFee;
  int buNo;
  String buName;
  int onlineDoctorFlag;
  dynamic specList;
  dynamic buList;
  dynamic photo;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    id: json["id"],
    doctorNo: json["doctorNo"],
    doctorId: json["doctorId"],
    doctorName: json["doctorName"],
    jobtitleNo: json["jobtitleNo"],
    jobtitle: json["jobtitle"],
    docDegree: json["docDegree"],
    specializationNo: json["specializationNo"],
    specializationName: json["specializationName"],
    gender: json["gender"],
    activeStat: json["activeStat"],
    chamber: json["chamber"],
    doctorPhoto: json["doctorPhoto"],
    companyNo: json["companyNo"],
    ogNo: json["ogNo"],
    consultationFee: json["consultationFee"],
    buNo: json["buNo"],
    buName: json["buName"],
    onlineDoctorFlag: json["onlineDoctorFlag"],
    specList: json["specList"],
    buList: json["buList"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctorNo": doctorNo,
    "doctorId": doctorId,
    "doctorName": doctorName,
    "jobtitleNo": jobtitleNo,
    "jobtitle": jobtitle,
    "docDegree": docDegree,
    "specializationNo": specializationNo,
    "specializationName": specializationName,
    "gender": gender,
    "activeStat": activeStat,
    "chamber": chamber,
    "doctorPhoto": doctorPhoto,
    "companyNo": companyNo,
    "ogNo": ogNo,
    "consultationFee": consultationFee,
    "buNo": buNo,
    "buName": buName,
    "onlineDoctorFlag": onlineDoctorFlag,
    "specList": specList,
    "buList": buList,
    "photo": photo,
  };
}
