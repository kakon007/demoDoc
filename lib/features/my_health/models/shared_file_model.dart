// To parse this JSON data, do
//
//     final sharedFileModel = sharedFileModelFromJson(jsonString);

import 'dart:convert';

SharedFileModel sharedFileModelFromJson(String str) => SharedFileModel.fromJson(json.decode(str));

String sharedFileModelToJson(SharedFileModel data) => json.encode(data.toJson());

class SharedFileModel {
  SharedFileModel({
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

  factory SharedFileModel.fromJson(Map<String, dynamic> json) => SharedFileModel(
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
    this.fileNo,
    this.regNo,
    this.shareType,
    this.doctorNo,
    this.activeStat,
    this.remarks,
    this.fileNoArr,
    this.doctorNoArr,
    this.doctorName,
    this.photo,
    this.companyName,
    this.isEdit=false
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
  int fileNo;
  int regNo;
  int shareType;
  int doctorNo;
  int activeStat;
  Remarks remarks;
  dynamic fileNoArr;
  dynamic doctorNoArr;
  dynamic doctorName;
  String photo;
  String companyName;
  bool isEdit;

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
    fileNo: json["fileNo"] == null ? null : json["fileNo"],
    regNo: json["regNo"] == null ? null : json["regNo"],
    shareType: json["shareType"] == null ? null : json["shareType"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    activeStat: json["activeStat"] == null ? null : json["activeStat"],
    remarks: json["remarks"] == null ? null : remarksValues.map[json["remarks"]],
    fileNoArr: json["fileNoArr"],
    doctorNoArr: json["doctorNoArr"],
    doctorName: json["doctorName"],
    photo: json["photo"] == null ? null : json["photo"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    isEdit: false,
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
    "fileNo": fileNo == null ? null : fileNo,
    "regNo": regNo == null ? null : regNo,
    "shareType": shareType == null ? null : shareType,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "activeStat": activeStat == null ? null : activeStat,
    "remarks": remarks == null ? null : remarksValues.reverse[remarks],
    "fileNoArr": fileNoArr,
    "doctorNoArr": doctorNoArr,
    "doctorName": doctorName,
    "photo": photo == null ? null : photo,
    "companyName": companyName == null ? null : companyName,
  };
}

enum Remarks { REMARKS_TEST, REMARKS }

final remarksValues = EnumValues({
  "remarks...": Remarks.REMARKS,
  "remarks test": Remarks.REMARKS_TEST
});

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
