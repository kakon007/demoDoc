// To parse this JSON data, do
//
//     final specializationNameModel = specializationNameModelFromJson(jsonString);

import 'dart:convert';

SpecializationNameModel specializationNameModelFromJson(String str) => SpecializationNameModel.fromJson(json.decode(str));

String specializationNameModelToJson(SpecializationNameModel data) => json.encode(data.toJson());

class SpecializationNameModel {
  SpecializationNameModel({
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
  dynamic message;
  bool valid;
  dynamic id;
  dynamic model;
  dynamic items;
  Obj obj;

  factory SpecializationNameModel.fromJson(Map<String, dynamic> json) => SpecializationNameModel(
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
    this.specializationList,
  });

  List<SpecializationListElement> specializationList;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    specializationList: List<SpecializationListElement>.from(json["specializationList"].map((x) => SpecializationListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "specializationList": List<dynamic>.from(specializationList.map((x) => x.toJson())),
  };
}

class SpecializationListElement {
  SpecializationListElement({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.lookupdtlNoParent,
    this.notEqualId,
    this.lookupNo,
    this.slNo,
    this.dtlName,
    this.dtlDescription,
    this.activeStatus,
    this.lookdtlNameMap,
    this.lookupNoList,
    this.lookupdtlNoParentName,
    this.lookupDltNoList,
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
  dynamic lookupdtlNoParent;
  dynamic notEqualId;
  int lookupNo;
  int slNo;
  String dtlName;
  String dtlDescription;
  int activeStatus;
  dynamic lookdtlNameMap;
  dynamic lookupNoList;
  dynamic lookupdtlNoParentName;
  dynamic lookupDltNoList;

  factory SpecializationListElement.fromJson(Map<String, dynamic> json) => SpecializationListElement(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    lookupdtlNoParent: json["lookupdtlNoParent"],
    notEqualId: json["notEqualId"],
    lookupNo: json["lookupNo"],
    slNo: json["slNo"] == null ? null : json["slNo"],
    dtlName: json["dtlName"],
    dtlDescription: json["dtlDescription"] == null ? null : json["dtlDescription"],
    activeStatus: json["activeStatus"],
    lookdtlNameMap: json["lookdtlNameMap"],
    lookupNoList: json["lookupNoList"],
    lookupdtlNoParentName: json["lookupdtlNoParentName"],
    lookupDltNoList: json["lookupDltNoList"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "id": id,
    "lookupdtlNoParent": lookupdtlNoParent,
    "notEqualId": notEqualId,
    "lookupNo": lookupNo,
    "slNo": slNo == null ? null : slNo,
    "dtlName": dtlName,
    "dtlDescription": dtlDescription == null ? null : dtlDescription,
    "activeStatus": activeStatus,
    "lookdtlNameMap": lookdtlNameMap,
    "lookupNoList": lookupNoList,
    "lookupdtlNoParentName": lookupdtlNoParentName,
    "lookupDltNoList": lookupDltNoList,
  };
}
