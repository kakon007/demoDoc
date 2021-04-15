// To parse this JSON data, do
//
//     final sepcializationListModel = sepcializationListModelFromJson(jsonString);

import 'dart:convert';

SepcializationListModel sepcializationListModelFromJson(String str) => SepcializationListModel.fromJson(json.decode(str));

String sepcializationListModelToJson(SepcializationListModel data) => json.encode(data.toJson());

class SepcializationListModel {
  SepcializationListModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.specializationItem,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<SpecializationItem> specializationItem;
  dynamic obj;

  factory SepcializationListModel.fromJson(Map<String, dynamic> json) => SepcializationListModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    specializationItem: List<SpecializationItem>.from(json["items"].map((x) => SpecializationItem.fromJson(x))),
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
    "items": List<dynamic>.from(specializationItem.map((x) => x.toJson())),
    "obj": obj,
  };
}

class SpecializationItem {
  SpecializationItem({
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
    this.isChecked,
  });

  int ssCreator;
  String ssCreatedOn;
  dynamic ssCreateSession;
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
  bool isChecked= false;

  factory SpecializationItem.fromJson(Map<String, dynamic> json) => SpecializationItem(
    isChecked: false,
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
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
    "isChecked" : false,
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreateSession": ssCreateSession,
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
