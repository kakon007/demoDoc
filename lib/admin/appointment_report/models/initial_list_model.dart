// To parse this JSON data, do
//
//     final initialListModel = initialListModelFromJson(jsonString);

import 'dart:convert';

InitialListModel initialListModelFromJson(String str) => InitialListModel.fromJson(json.decode(str));

String initialListModelToJson(InitialListModel data) => json.encode(data.toJson());

class InitialListModel {
  InitialListModel({
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

  factory InitialListModel.fromJson(Map<String, dynamic> json) => InitialListModel(
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
    this.id,
    this.ogName,
    this.ogAlias,
    this.ogSlogan,
    this.ogAddress,
    this.ogVillage,
    this.ogUnion,
    this.ogThana,
    this.ogDistrict,
    this.ogDivision,
    this.ogProvince,
    this.ogCountry,
    this.ogPhone,
    this.ogMobile,
    this.ogFax,
    this.ogEmail,
    this.ogWebsite,
    this.ogLogo,
    this.ogTypeNo,
    this.contactPerson,
    this.contactPersonDesig,
    this.contactNo,
    this.activeStatus,
    this.contactDate,
    this.lcnVal,
    this.expiredOn,
    this.lcnExpMsgDay,
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreatedSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.photoOgLogo,
  });

  int id;
  String ogName;
  String ogAlias;
  String ogSlogan;
  String ogAddress;
  dynamic ogVillage;
  dynamic ogUnion;
  String ogThana;
  String ogDistrict;
  String ogDivision;
  String ogProvince;
  String ogCountry;
  String ogPhone;
  String ogMobile;
  String ogFax;
  String ogEmail;
  String ogWebsite;
  String ogLogo;
  int ogTypeNo;
  String contactPerson;
  String contactPersonDesig;
  String contactNo;
  int activeStatus;
  dynamic contactDate;
  dynamic lcnVal;
  dynamic expiredOn;
  dynamic lcnExpMsgDay;
  int ssCreator;
  String ssCreatedOn;
  int ssCreatedSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  dynamic photoOgLogo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    ogName: json["ogName"] == null ? null : json["ogName"],
    ogAlias: json["ogAlias"] == null ? null : json["ogAlias"],
    ogSlogan: json["ogSlogan"] == null ? null : json["ogSlogan"],
    ogAddress: json["ogAddress"] == null ? null : json["ogAddress"],
    ogVillage: json["ogVillage"],
    ogUnion: json["ogUnion"],
    ogThana: json["ogThana"] == null ? null : json["ogThana"],
    ogDistrict: json["ogDistrict"] == null ? null : json["ogDistrict"],
    ogDivision: json["ogDivision"] == null ? null : json["ogDivision"],
    ogProvince: json["ogProvince"] == null ? null : json["ogProvince"],
    ogCountry: json["ogCountry"] == null ? null : json["ogCountry"],
    ogPhone: json["ogPhone"] == null ? null : json["ogPhone"],
    ogMobile: json["ogMobile"] == null ? null : json["ogMobile"],
    ogFax: json["ogFax"] == null ? null : json["ogFax"],
    ogEmail: json["ogEmail"] == null ? null : json["ogEmail"],
    ogWebsite: json["ogWebsite"] == null ? null : json["ogWebsite"],
    ogLogo: json["ogLogo"] == null ? null : json["ogLogo"],
    ogTypeNo: json["ogTypeNo"] == null ? null : json["ogTypeNo"],
    contactPerson: json["contactPerson"] == null ? null : json["contactPerson"],
    contactPersonDesig: json["contactPersonDesig"] == null ? null : json["contactPersonDesig"],
    contactNo: json["contactNo"] == null ? null : json["contactNo"],
    activeStatus: json["activeStatus"] == null ? null : json["activeStatus"],
    contactDate: json["contactDate"],
    lcnVal: json["lcnVal"],
    expiredOn: json["expiredOn"],
    lcnExpMsgDay: json["lcnExpMsgDay"],
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreatedSession: json["ssCreatedSession"] == null ? null : json["ssCreatedSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    photoOgLogo: json["photoOgLogo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "ogName": ogName == null ? null : ogName,
    "ogAlias": ogAlias == null ? null : ogAlias,
    "ogSlogan": ogSlogan == null ? null : ogSlogan,
    "ogAddress": ogAddress == null ? null : ogAddress,
    "ogVillage": ogVillage,
    "ogUnion": ogUnion,
    "ogThana": ogThana == null ? null : ogThana,
    "ogDistrict": ogDistrict == null ? null : ogDistrict,
    "ogDivision": ogDivision == null ? null : ogDivision,
    "ogProvince": ogProvince == null ? null : ogProvince,
    "ogCountry": ogCountry == null ? null : ogCountry,
    "ogPhone": ogPhone == null ? null : ogPhone,
    "ogMobile": ogMobile == null ? null : ogMobile,
    "ogFax": ogFax == null ? null : ogFax,
    "ogEmail": ogEmail == null ? null : ogEmail,
    "ogWebsite": ogWebsite == null ? null : ogWebsite,
    "ogLogo": ogLogo == null ? null : ogLogo,
    "ogTypeNo": ogTypeNo == null ? null : ogTypeNo,
    "contactPerson": contactPerson == null ? null : contactPerson,
    "contactPersonDesig": contactPersonDesig == null ? null : contactPersonDesig,
    "contactNo": contactNo == null ? null : contactNo,
    "activeStatus": activeStatus == null ? null : activeStatus,
    "contactDate": contactDate,
    "lcnVal": lcnVal,
    "expiredOn": expiredOn,
    "lcnExpMsgDay": lcnExpMsgDay,
    "ssCreator": ssCreator == null ? null : ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreatedSession": ssCreatedSession == null ? null : ssCreatedSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "photoOgLogo": photoOgLogo,
  };
}
