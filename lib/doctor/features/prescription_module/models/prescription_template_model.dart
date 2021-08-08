// To parse this JSON data, do
//
//     final prescriptionTemplateModel = prescriptionTemplateModelFromJson(jsonString);

import 'dart:convert';

PrescriptionTemplateModel prescriptionTemplateModelFromJson(String str) => PrescriptionTemplateModel.fromJson(json.decode(str));

String prescriptionTemplateModelToJson(PrescriptionTemplateModel data) => json.encode(data.toJson());

class PrescriptionTemplateModel {
  PrescriptionTemplateModel({
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

  factory PrescriptionTemplateModel.fromJson(Map<String, dynamic> json) => PrescriptionTemplateModel(
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
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.templateName,
    this.departmentNo,
    this.doctorNo,
    this.activeStatus,
    this.ipdFlag,
    this.wardNo,
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
  String templateName;
  dynamic departmentNo;
  String doctorNo;
  int activeStatus;
  int ipdFlag;
  dynamic wardNo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
    id: json["id"] == null ? null : json["id"],
    templateName: json["templateName"] == null ? null : json["templateName"],
    departmentNo: json["departmentNo"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    activeStatus: json["activeStatus"] == null ? null : json["activeStatus"],
    ipdFlag: json["ipdFlag"] == null ? null : json["ipdFlag"],
    wardNo: json["wardNo"],
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
    "templateName": templateName == null ? null : templateName,
    "departmentNo": departmentNo,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "activeStatus": activeStatus == null ? null : activeStatus,
    "ipdFlag": ipdFlag == null ? null : ipdFlag,
    "wardNo": wardNo,
  };
}
