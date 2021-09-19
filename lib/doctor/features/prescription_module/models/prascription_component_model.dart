// To parse this JSON data, do
//
//     final prescriptionComponentModel = prescriptionComponentModelFromJson(jsonString);

import 'dart:convert';

PrescriptionComponentModel prescriptionComponentModelFromJson(String str) =>
    PrescriptionComponentModel.fromJson(json.decode(str));

String prescriptionComponentModelToJson(PrescriptionComponentModel data) =>
    json.encode(data.toJson());

class PrescriptionComponentModel {
  PrescriptionComponentModel({
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
  List<PrescriptionComponentItem> items;
  dynamic obj;

  factory PrescriptionComponentModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionComponentModel(
        success: json["success"] == null ? null : json["success"],
        info: json["info"] == null ? null : json["info"],
        warning: json["warning"] == null ? null : json["warning"],
        message: json["message"] == null ? null : json["message"],
        valid: json["valid"] == null ? null : json["valid"],
        id: json["id"],
        model: json["model"],
        items: json["items"] == null
            ? []
            : List<PrescriptionComponentItem>.from(json["items"]
                .map((x) => PrescriptionComponentItem.fromJson(x))),
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
        "items": items == null
            ? []
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "obj": obj,
      };
}

class PrescriptionComponentItem {
  PrescriptionComponentItem({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.title,
    this.userPreferencesType,
    this.preferencesDataType,
    this.preferencesSerial,
    this.userPreferencesKey,
    this.userPreferencesValue,
    this.description,
    this.preferencesShowInReport,
    this.preferencesShowInTab,
    this.doctorNo,
    this.idNotEqual,
    this.activeStatus,
    this.uiNo,
  });

  int ssCreator;
  SsEdOn ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  SsEdOn ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int id;
  String title;
  String userPreferencesType;
  int preferencesDataType;
  int preferencesSerial;
  String userPreferencesKey;
  String userPreferencesValue;
  String description;
  int preferencesShowInReport;
  int preferencesShowInTab;
  int doctorNo;
  dynamic idNotEqual;
  int activeStatus;
  int uiNo;

  factory PrescriptionComponentItem.fromJson(Map<String, dynamic> json) =>
      PrescriptionComponentItem(
        ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssCreatedOn"]],
        ssCreateSession:
            json["ssCreateSession"] == null ? null : json["ssCreateSession"],
        ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"] == null
            ? null
            : ssEdOnValues.map[json["ssModifiedOn"]],
        ssModifiedSession: json["ssModifiedSession"] == null
            ? null
            : json["ssModifiedSession"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        organizationNo:
            json["organizationNo"] == null ? null : json["organizationNo"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        userPreferencesType: json["userPreferencesType"] == null
            ? null
            : json["userPreferencesType"],
        preferencesDataType: json["preferencesDataType"] == null
            ? null
            : json["preferencesDataType"],
        preferencesSerial: json["preferencesSerial"] == null
            ? null
            : json["preferencesSerial"],
        userPreferencesKey: json["userPreferencesKey"] == null
            ? null
            : json["userPreferencesKey"],
        userPreferencesValue: json["userPreferencesValue"] == null
            ? null
            : json["userPreferencesValue"],
        description: json["description"] == null ? null : json["description"],
        preferencesShowInReport: json["preferencesShowInReport"] == null
            ? null
            : json["preferencesShowInReport"],
        preferencesShowInTab: json["preferencesShowInTab"] == null
            ? null
            : json["preferencesShowInTab"],
        doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
        idNotEqual: json["idNotEqual"],
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
        uiNo: json["uiNo"] == null ? null : json["uiNo"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator == null ? null : ssCreator,
        "ssCreatedOn":
            ssCreatedOn == null ? null : ssEdOnValues.reverse[ssCreatedOn],
        "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
        "ssModifier": ssModifier == null ? null : ssModifier,
        "ssModifiedOn":
            ssModifiedOn == null ? null : ssEdOnValues.reverse[ssModifiedOn],
        "ssModifiedSession":
            ssModifiedSession == null ? null : ssModifiedSession,
        "companyNo": companyNo == null ? null : companyNo,
        "organizationNo": organizationNo == null ? null : organizationNo,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "userPreferencesType":
            userPreferencesType == null ? null : userPreferencesType,
        "preferencesDataType":
            preferencesDataType == null ? null : preferencesDataType,
        "preferencesSerial":
            preferencesSerial == null ? null : preferencesSerial,
        "userPreferencesKey":
            userPreferencesKey == null ? null : userPreferencesKey,
        "userPreferencesValue":
            userPreferencesValue == null ? null : userPreferencesValue,
        "description": description == null ? null : description,
        "preferencesShowInReport":
            preferencesShowInReport == null ? null : preferencesShowInReport,
        "preferencesShowInTab":
            preferencesShowInTab == null ? null : preferencesShowInTab,
        "doctorNo": doctorNo == null ? null : doctorNo,
        "idNotEqual": idNotEqual,
        "activeStatus": activeStatus == null ? null : activeStatus,
        "uiNo": uiNo == null ? null : uiNo,
      };
}

enum SsEdOn { THE_20210824_T04_57570000000 }

final ssEdOnValues = EnumValues(
    {"2021-08-24T04:57:57.000+0000": SsEdOn.THE_20210824_T04_57570000000});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
