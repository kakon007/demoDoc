// To parse this JSON data, do
//
//     final designationModel = designationModelFromJson(jsonString);

import 'dart:convert';

DesignationModel designationModelFromJson(String str) => DesignationModel.fromJson(json.decode(str));

String designationModelToJson(DesignationModel data) => json.encode(data.toJson());

class DesignationModel {
  DesignationModel({
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
  List<DesignationList> items;
  dynamic obj;

  factory DesignationModel.fromJson(Map<String, dynamic> json) => DesignationModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: List<DesignationList>.from(json["items"].map((x) => DesignationList.fromJson(x))),
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
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj,
  };
}

class DesignationList {
  DesignationList({
    this.companyNo,
    this.organizationNo,
    this.jobtitleNo,
    this.jobtitle,
    this.activeStat,
  });

  int companyNo;
  int organizationNo;
  int jobtitleNo;
  String jobtitle;
  int activeStat;

  factory DesignationList.fromJson(Map<String, dynamic> json) => DesignationList(
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    jobtitleNo: json["jobtitleNo"],
    jobtitle: json["jobtitle"],
    activeStat: json["activeStat"],
  );

  Map<String, dynamic> toJson() => {
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "jobtitleNo": jobtitleNo,
    "jobtitle": jobtitle,
    "activeStat": activeStat,
  };
}
