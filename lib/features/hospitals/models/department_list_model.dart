/*
// To parse this JSON data, do
//
//     final deptListModel = deptListModelFromJson(jsonString);

import 'dart:convert';

DeptListModel deptListModelFromJson(String str) => DeptListModel.fromJson(json.decode(str));

String deptListModelToJson(DeptListModel data) => json.encode(data.toJson());

class DeptListModel {
  DeptListModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.deptItem,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<DeptItem> deptItem;
  dynamic obj;

  factory DeptListModel.fromJson(Map<String, dynamic> json) => DeptListModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    deptItem: List<DeptItem>.from(json["items"].map((x) => DeptItem.fromJson(x))),
    obj: json["obj"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "info": info,
    "warning": warning,
    "message": message,
    "valid": valid,
    "id": id,
    "model": model,
    "items": List<dynamic>.from(deptItem.map((x) => x.toJson())),
    "obj": obj,
  };
}

class DeptItem {
  DeptItem({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.buId,
    this.buNoParent,
    this.buName,
    this.reportHeader,
    this.activeStatus,
    this.buNoM,
    this.flag,
    this.buNoList,
    this.buNameList,
    this.isChecked,
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
  String buId;
  dynamic buNoParent;
  String buName;
  dynamic reportHeader;
  int activeStatus;
  int buNoM;
  int flag;
  dynamic buNoList;
  dynamic buNameList;
  bool isChecked= false;

  factory DeptItem.fromJson(Map<String, dynamic> json) => DeptItem(
    isChecked: false,
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    buId: json["buId"],
    buNoParent: json["buNoParent"],
    buName: json["buName"],
    reportHeader: json["reportHeader"],
    activeStatus: json["activeStatus"],
    buNoM: json["buNoM"] == null ? null : json["buNoM"],
    flag: json["flag"],
    buNoList: json["buNoList"],
    buNameList: json["buNameList"],
  );

  Map<String, dynamic> toJson() => {
    "isChecked" : false,
    "ssCreator": ssCreator == null ? null : ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "id": id,
    "buId": buId,
    "buNoParent": buNoParent,
    "buName": buName,
    "reportHeader": reportHeader,
    "activeStatus": activeStatus,
    "buNoM": buNoM == null ? null : buNoM,
    "flag": flag,
    "buNoList": buNoList,
    "buNameList": buNameList,
  };
}
*/
// To parse this JSON data, do
//
//     final deptListModel = deptListModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final deptListModel = deptListModelFromJson(jsonString);

import 'dart:convert';

DeptListModel deptListModelFromJson(String str) => DeptListModel.fromJson(json.decode(str));

String deptListModelToJson(DeptListModel data) => json.encode(data.toJson());

class DeptListModel {
  DeptListModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.deptItem,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<DeptItem> deptItem;
  dynamic obj;

  factory DeptListModel.fromJson(Map<String, dynamic> json) => DeptListModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    deptItem: List<DeptItem>.from(json["items"].map((x) => DeptItem.fromJson(x))),
    obj: json["obj"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "info": info,
    "warning": warning,
    "message": message,
    "valid": valid,
    "id": id,
    "model": model,
    "items": List<dynamic>.from(deptItem.map((x) => x.toJson())),
    "obj": obj,
  };
}

class DeptItem {
  DeptItem({
    this.id,
    this.buName,
    this.isChecked,
  });

  int id;
  String buName;
  bool isChecked= false;
  factory DeptItem.fromJson(Map<String, dynamic> json) => DeptItem(
    isChecked: false,
    id: json["id"],
    buName: json["buName"],
  );

  Map<String, dynamic> toJson() => {
    "isChecked" : false,
    "id": id,
    "buName": buName,
  };
}
