// To parse this JSON data, do
//
//     final reportListModel = reportListModelFromJson(jsonString);

import 'dart:convert';

ReportListModel reportListModelFromJson(String str) => ReportListModel.fromJson(json.decode(str));

String reportListModelToJson(ReportListModel data) => json.encode(data.toJson());

class ReportListModel {
  ReportListModel({
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
  Obj obj;

  factory ReportListModel.fromJson(Map<String, dynamic> json) => ReportListModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj.toJson(),
  };
}

class Item {
  Item({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.attachmentName,
    this.attachmentPath,
    this.attachmentTypeNo,
    this.description,
    this.activeStatus,
    this.referenceNo,
    this.referenceTypeNo,
    this.reportDate,
    this.regId,
    this.type,
    this.attachmentTypeName,
    this.referenceTypeName,
    this.fromDate,
    this.toDate,
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
  String attachmentName;
  String attachmentPath;
  int attachmentTypeNo;
  dynamic description;
  int activeStatus;
  int referenceNo;
  int referenceTypeNo;
  String reportDate;
  String regId;
  int type;
  String attachmentTypeName;
  String referenceTypeName;
  dynamic fromDate;
  dynamic toDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    attachmentName: json["attachmentName"],
    attachmentPath: json["attachmentPath"],
    attachmentTypeNo: json["attachmentTypeNo"],
    description: json["description"],
    activeStatus: json["activeStatus"],
    referenceNo: json["referenceNo"],
    referenceTypeNo: json["referenceTypeNo"],
    reportDate: json["reportDate"],
    regId: json["regId"],
    type: json["type"],
    attachmentTypeName: json["attachmentTypeName"],
    referenceTypeName: json["referenceTypeName"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn,
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssModifiedOn,
    "ssModifiedSession": ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "id": id,
    "attachmentName": attachmentName,
    "attachmentPath": attachmentPath,
    "attachmentTypeNo": attachmentTypeNo,
    "description": description,
    "activeStatus": activeStatus,
    "referenceNo": referenceNo,
    "referenceTypeNo": referenceTypeNo,
    "reportDate": reportDate,
    "regId": regId,
    "type": type,
    "attachmentTypeName": attachmentTypeName,
    "referenceTypeName": referenceTypeName,
    "fromDate": fromDate,
    "toDate": toDate,
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
  List<Item> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"],
    recordsFiltered: json["recordsFiltered"],
    recordsTotal: json["recordsTotal"]==null?0:int.parse(json["recordsTotal"]?.toString()??"0"),
    data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsFiltered": recordsFiltered,
    "recordsTotal": recordsTotal,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
