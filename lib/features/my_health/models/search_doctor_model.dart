// To parse this JSON data, do
//
//     final searchDoctorModel = searchDoctorModelFromJson(jsonString);

import 'dart:convert';

SearchDoctorModel searchDoctorModelFromJson(String str) => SearchDoctorModel.fromJson(json.decode(str));

String searchDoctorModelToJson(SearchDoctorModel data) => json.encode(data.toJson());

class SearchDoctorModel {
  SearchDoctorModel({
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
  List<Itemm> items;
  dynamic obj;

  factory SearchDoctorModel.fromJson(Map<String, dynamic> json) => SearchDoctorModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<Itemm>.from(json["items"].map((x) => Itemm.fromJson(x))),
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

class Itemm {
  Itemm({
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.specializationName,
    this.chamberAddress1,
    this.chamberAddress2,
    this.activeStat,
    this.qualification,
    this.buNo,
    this.buName,
    this.chamber,
    this.docDegree,
    this.doctorSignature,
    this.phoneMobile,
    this.remarks,
    this.jobtitleNo,
    this.companyNo,
    this.companyName,
    this.organizationNo,
    this.doctorPhoto,
    this.photo,
    this.allPresciptionDoctorFlag,
    this.doctorNoList,
  });

  int doctorNo;
  String doctorId;
  String doctorName;
  String specializationName;
  dynamic chamberAddress1;
  dynamic chamberAddress2;
  int activeStat;
  dynamic qualification;
  int buNo;
  dynamic buName;
  dynamic chamber;
  String docDegree;
  String doctorSignature;
  String phoneMobile;
  dynamic remarks;
  int jobtitleNo;
  int companyNo;
  String companyName;
  int organizationNo;
  String doctorPhoto;
  String photo;
  int allPresciptionDoctorFlag;
  dynamic doctorNoList;

  factory Itemm.fromJson(Map<String, dynamic> json) => Itemm(
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    doctorId: json["doctorId"] == null ? null : json["doctorId"],
    doctorName: json["doctorName"] == null ? null : json["doctorName"],
    specializationName: json["specializationName"] == null ? null : json["specializationName"],
    chamberAddress1: json["chamberAddress1"],
    chamberAddress2: json["chamberAddress2"],
    activeStat: json["activeStat"] == null ? null : json["activeStat"],
    qualification: json["qualification"],
    buNo: json["buNo"] == null ? null : json["buNo"],
    buName: json["buName"],
    chamber: json["chamber"],
    docDegree: json["docDegree"] == null ? null : json["docDegree"],
    doctorSignature: json["doctorSignature"] == null ? null : json["doctorSignature"],
    phoneMobile: json["phoneMobile"] == null ? null : json["phoneMobile"],
    remarks: json["remarks"],
    jobtitleNo: json["jobtitleNo"] == null ? null : json["jobtitleNo"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
    doctorPhoto: json["doctorPhoto"] == null ? null : json["doctorPhoto"],
    photo: json["photo"] == null ? null : json["photo"],
    allPresciptionDoctorFlag: json["allPresciptionDoctorFlag"] == null ? null : json["allPresciptionDoctorFlag"],
    doctorNoList: json["doctorNoList"],
  );

  Map<String, dynamic> toJson() => {
    "doctorNo": doctorNo == null ? null : doctorNo,
    "doctorId": doctorId == null ? null : doctorId,
    "doctorName": doctorName == null ? null : doctorName,
    "specializationName": specializationName == null ? null : specializationName,
    "chamberAddress1": chamberAddress1,
    "chamberAddress2": chamberAddress2,
    "activeStat": activeStat == null ? null : activeStat,
    "qualification": qualification,
    "buNo": buNo == null ? null : buNo,
    "buName": buName,
    "chamber": chamber,
    "docDegree": docDegree == null ? null : docDegree,
    "doctorSignature": doctorSignature == null ? null : doctorSignature,
    "phoneMobile": phoneMobile == null ? null : phoneMobile,
    "remarks": remarks,
    "jobtitleNo": jobtitleNo == null ? null : jobtitleNo,
    "companyNo": companyNo == null ? null : companyNo,
    "companyName": companyName == null ? null : companyName,
    "organizationNo": organizationNo == null ? null : organizationNo,
    "doctorPhoto": doctorPhoto == null ? null : doctorPhoto,
    "photo": photo == null ? null : photo,
    "allPresciptionDoctorFlag": allPresciptionDoctorFlag == null ? null : allPresciptionDoctorFlag,
    "doctorNoList": doctorNoList,
  };
}
