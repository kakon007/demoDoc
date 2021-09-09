// To parse this JSON data, do
//
//     final companyListModel = companyListModelFromJson(jsonString);

import 'dart:convert';

CompanyListModel companyListModelFromJson(String str) => CompanyListModel.fromJson(json.decode(str));

String companyListModelToJson(CompanyListModel data) => json.encode(data.toJson());

class CompanyListModel {
  CompanyListModel({
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
  List<CompanyItem> items;
  dynamic obj;

  factory CompanyListModel.fromJson(Map<String, dynamic> json) => CompanyListModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<CompanyItem>.from(json["items"].map((x) => CompanyItem.fromJson(x))),
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

class CompanyItem {
  CompanyItem({
    this.companyNo,
    this.companyId,
    this.companyName,
    this.companyAlias,
    this.companySlogan,
    this.companyAddress,
    this.companyVillage,
    this.companyUnion,
    this.companyThana,
    this.companyDistrict,
    this.companyDivision,
    this.companyProvince,
    this.companyCountry,
    this.companyTel,
    this.companyFax,
    this.companyEmail,
    this.companyWebsite,
    this.contactPerson,
    this.contactPersonDesig,
    this.contactNo,
    this.slNo,
    this.activeStat,
    this.contractDate,
    this.lcnVal,
    this.expiredOn,
    this.lcnExpMsgDay,
    this.ogNo,
    this.logonUrl,
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreatedSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyLogo,
    this.companyImage,
    this.promotionalUpdates,
    this.promotionalUpdatesFlag,
    this.companyType,
    this.placeLatitude,
    this.placeLongitude,
  });

  int companyNo;
  String companyId;
  String companyName;
  String companyAlias;
  String companySlogan;
  String companyAddress;
  dynamic companyVillage;
  dynamic companyUnion;
  String companyThana;
  String companyDistrict;
  String companyDivision;
  String companyProvince;
  String companyCountry;
  String companyTel;
  String companyFax;
  String companyEmail;
  String companyWebsite;
  String contactPerson;
  String contactPersonDesig;
  String contactNo;
  int slNo;
  int activeStat;
  dynamic contractDate;
  dynamic lcnVal;
  String expiredOn;
  int lcnExpMsgDay;
  int ogNo;
  dynamic logonUrl;
  int ssCreator;
  String ssCreatedOn;
  int ssCreatedSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  String companyLogo;
  String companyImage;
  String promotionalUpdates;
  int promotionalUpdatesFlag;
  int companyType;
  int placeLatitude;
  int placeLongitude;

  factory CompanyItem.fromJson(Map<String, dynamic> json) => CompanyItem(
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    companyAlias: json["companyAlias"] == null ? null : json["companyAlias"],
    companySlogan: json["companySlogan"] == null ? null : json["companySlogan"],
    companyAddress: json["companyAddress"] == null ? null : json["companyAddress"],
    companyVillage: json["companyVillage"],
    companyUnion: json["companyUnion"],
    companyThana: json["companyThana"] == null ? null : json["companyThana"],
    companyDistrict: json["companyDistrict"] == null ? null : json["companyDistrict"],
    companyDivision: json["companyDivision"] == null ? null : json["companyDivision"],
    companyProvince: json["companyProvince"] == null ? null : json["companyProvince"],
    companyCountry: json["companyCountry"] == null ? null : json["companyCountry"],
    companyTel: json["companyTel"] == null ? null : json["companyTel"],
    companyFax: json["companyFax"] == null ? null : json["companyFax"],
    companyEmail: json["companyEmail"] == null ? null : json["companyEmail"],
    companyWebsite: json["companyWebsite"] == null ? null : json["companyWebsite"],
    contactPerson: json["contactPerson"] == null ? null : json["contactPerson"],
    contactPersonDesig: json["contactPersonDesig"] == null ? null : json["contactPersonDesig"],
    contactNo: json["contactNo"] == null ? null : json["contactNo"],
    slNo: json["slNo"] == null ? null : json["slNo"],
    activeStat: json["activeStat"] == null ? null : json["activeStat"],
    contractDate: json["contractDate"],
    lcnVal: json["lcnVal"],
    expiredOn: json["expiredOn"] == null ? null : json["expiredOn"],
    lcnExpMsgDay: json["lcnExpMsgDay"] == null ? null : json["lcnExpMsgDay"],
    ogNo: json["ogNo"] == null ? null : json["ogNo"],
    logonUrl: json["logonUrl"],
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreatedSession: json["ssCreatedSession"] == null ? null : json["ssCreatedSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyLogo: json["companyLogo"] == null ? null : json["companyLogo"],
    companyImage: json["companyImage"] == null ? null : json["companyImage"],
    promotionalUpdates: json["promotionalUpdates"] == null ? null : json["promotionalUpdates"],
    promotionalUpdatesFlag: json["promotionalUpdatesFlag"] == null ? null : json["promotionalUpdatesFlag"],
    companyType: json["companyType"] == null ? null : json["companyType"],
    placeLatitude: json["placeLatitude"] == null ? null : json["placeLatitude"],
    placeLongitude: json["placeLongitude"] == null ? null : json["placeLongitude"],
  );

  Map<String, dynamic> toJson() => {
    "companyNo": companyNo == null ? null : companyNo,
    "companyId": companyId == null ? null : companyId,
    "companyName": companyName == null ? null : companyName,
    "companyAlias": companyAlias == null ? null : companyAlias,
    "companySlogan": companySlogan == null ? null : companySlogan,
    "companyAddress": companyAddress == null ? null : companyAddress,
    "companyVillage": companyVillage,
    "companyUnion": companyUnion,
    "companyThana": companyThana == null ? null : companyThana,
    "companyDistrict": companyDistrict == null ? null : companyDistrict,
    "companyDivision": companyDivision == null ? null : companyDivision,
    "companyProvince": companyProvince == null ? null : companyProvince,
    "companyCountry": companyCountry == null ? null : companyCountry,
    "companyTel": companyTel == null ? null : companyTel,
    "companyFax": companyFax == null ? null : companyFax,
    "companyEmail": companyEmail == null ? null : companyEmail,
    "companyWebsite": companyWebsite == null ? null : companyWebsite,
    "contactPerson": contactPerson == null ? null : contactPerson,
    "contactPersonDesig": contactPersonDesig == null ? null : contactPersonDesig,
    "contactNo": contactNo == null ? null : contactNo,
    "slNo": slNo == null ? null : slNo,
    "activeStat": activeStat == null ? null : activeStat,
    "contractDate": contractDate,
    "lcnVal": lcnVal,
    "expiredOn": expiredOn == null ? null : expiredOn,
    "lcnExpMsgDay": lcnExpMsgDay == null ? null : lcnExpMsgDay,
    "ogNo": ogNo == null ? null : ogNo,
    "logonUrl": logonUrl,
    "ssCreator": ssCreator == null ? null : ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreatedSession": ssCreatedSession == null ? null : ssCreatedSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "companyLogo": companyLogo == null ? null : companyLogo,
    "companyImage": companyImage == null ? null : companyImage,
    "promotionalUpdates": promotionalUpdates == null ? null : promotionalUpdates,
    "promotionalUpdatesFlag": promotionalUpdatesFlag == null ? null : promotionalUpdatesFlag,
    "companyType": companyType == null ? null : companyType,
    "placeLatitude": placeLatitude == null ? null : placeLatitude,
    "placeLongitude": placeLongitude == null ? null : placeLongitude,
  };
}
