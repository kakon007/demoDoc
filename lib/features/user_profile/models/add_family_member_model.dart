// To parse this JSON data, do
//
//     final addFamilyMemberModel = addFamilyMemberModelFromJson(jsonString);

import 'dart:convert';

AddFamilyMemberModel addFamilyMemberModelFromJson(String str) => AddFamilyMemberModel.fromJson(json.decode(str));

String addFamilyMemberModelToJson(AddFamilyMemberModel data) => json.encode(data.toJson());

class AddFamilyMemberModel {
  AddFamilyMemberModel({
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

  factory AddFamilyMemberModel.fromJson(Map<String, dynamic> json) => AddFamilyMemberModel(
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
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.regId,
    this.regNo,
    this.relation,
    this.relatedRegNo,
    this.activeStatus,
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
  String regId;
  int regNo;
  int relation;
  int relatedRegNo;
  int activeStatus;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    regId: json["regId"],
    regNo: json["regNo"],
    relation: json["relation"],
    relatedRegNo: json["relatedRegNo"],
    activeStatus: json["activeStatus"],
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
    "regId": regId,
    "regNo": regNo,
    "relation": relation,
    "relatedRegNo": relatedRegNo,
    "activeStatus": activeStatus,
  };
}
