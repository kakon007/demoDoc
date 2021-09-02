// To parse this JSON data, do
//
//     final doctorDocumentationListModel = doctorDocumentationListModelFromJson(jsonString);

import 'dart:convert';

DoctorDocumentationListModel doctorDocumentationListModelFromJson(String str) => DoctorDocumentationListModel.fromJson(json.decode(str));

String doctorDocumentationListModelToJson(DoctorDocumentationListModel data) => json.encode(data.toJson());

class DoctorDocumentationListModel {
  DoctorDocumentationListModel({
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

  factory DoctorDocumentationListModel.fromJson(Map<String, dynamic> json) => DoctorDocumentationListModel(
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

  dynamic draw;
  String recordsFiltered;
  int recordsTotal;
  List<Datum> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"],
    recordsFiltered: json["recordsFiltered"] == null ? null : json["recordsFiltered"],
    recordsTotal: json["recordsTotal"]==null?0:int.parse(json["recordsTotal"]?.toString()??"0"),
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsFiltered": recordsFiltered == null ? null : recordsFiltered,
    "recordsTotal": recordsTotal == null ? null : recordsTotal,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.attachmentNo,
    this.attachmentName,
    this.attachmentPath,
    this.attachmentTypeNo,
    this.description,
    this.referenceNo,
    this.referenceTypeNo,
    this.fileSharedNo,
    this.fileNo,
    this.regNo,
    this.shareType,
    this.doctorNo,
    this.doctorName,
    this.remarks,
    this.reportDate,
    this.activeStat,
    this.companyNo,
    this.companyName,
    this.organizationNo,
    this.fromDate,
    this.toDate,
  });

  int id;
  int attachmentNo;
  String attachmentName;
  String attachmentPath;
  int attachmentTypeNo;
  String description;
  int referenceNo;
  int referenceTypeNo;
  int fileSharedNo;
  int fileNo;
  int regNo;
  int shareType;
  int doctorNo;
  String doctorName;
  dynamic remarks;
  String reportDate;
  int activeStat;
  int companyNo;
  String companyName;
  int organizationNo;
  dynamic fromDate;
  dynamic toDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    attachmentNo: json["attachmentNo"] == null ? null : json["attachmentNo"],
    attachmentName: json["attachmentName"] == null ? null : json["attachmentName"],
    attachmentPath: json["attachmentPath"] == null ? null : json["attachmentPath"],
    attachmentTypeNo: json["attachmentTypeNo"] == null ? null : json["attachmentTypeNo"],
    description: json["description"] == null ? null : json["description"],
    referenceNo: json["referenceNo"] == null ? null : json["referenceNo"],
    referenceTypeNo: json["referenceTypeNo"] == null ? null : json["referenceTypeNo"],
    fileSharedNo: json["fileSharedNo"] == null ? null : json["fileSharedNo"],
    fileNo: json["fileNo"] == null ? null : json["fileNo"],
    regNo: json["regNo"] == null ? null : json["regNo"],
    shareType: json["shareType"] == null ? null : json["shareType"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    doctorName: json["doctorName"] == null ? null : json["doctorName"],
    remarks: json["remarks"],
    reportDate: json["reportDate"] == null ? null : json["reportDate"],
    activeStat: json["activeStat"] == null ? null : json["activeStat"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "attachmentNo": attachmentNo == null ? null : attachmentNo,
    "attachmentName": attachmentName == null ? null : attachmentName,
    "attachmentPath": attachmentPath == null ? null : attachmentPath,
    "attachmentTypeNo": attachmentTypeNo == null ? null : attachmentTypeNo,
    "description": description == null ? null : description,
    "referenceNo": referenceNo == null ? null : referenceNo,
    "referenceTypeNo": referenceTypeNo == null ? null : referenceTypeNo,
    "fileSharedNo": fileSharedNo == null ? null : fileSharedNo,
    "fileNo": fileNo == null ? null : fileNo,
    "regNo": regNo == null ? null : regNo,
    "shareType": shareType == null ? null : shareType,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "doctorName": doctorName == null ? null : doctorName,
    "remarks": remarks,
    "reportDate": reportDate == null ? null : reportDate,
    "activeStat": activeStat == null ? null : activeStat,
    "companyNo": companyNo == null ? null : companyNo,
    "companyName": companyName == null ? null : companyName,
    "organizationNo": organizationNo == null ? null : organizationNo,
    "fromDate": fromDate,
    "toDate": toDate,
  };
}
