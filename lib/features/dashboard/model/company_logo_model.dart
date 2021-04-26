// To parse this JSON data, do
//
//     final companyLogoModel = companyLogoModelFromJson(jsonString);

import 'dart:convert';

CompanyLogoModel companyLogoModelFromJson(String str) => CompanyLogoModel.fromJson(json.decode(str));

String companyLogoModelToJson(CompanyLogoModel data) => json.encode(data.toJson());

class CompanyLogoModel {
  CompanyLogoModel({
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

  factory CompanyLogoModel.fromJson(Map<String, dynamic> json) => CompanyLogoModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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

class Item {
  Item({
    this.id,
    this.companyId,
    this.companyName,
    this.companyAlias,
    this.companySlogan,
    this.companyAddress,
    this.companyProvince,
    this.companyVillage,
    this.companyUnion,
    this.companyThana,
    this.companyDistrict,
    this.companyDivision,
    this.companyCountry,
    this.companyPhone,
    this.companyFax,
    this.companyEmail,
    this.companyWebsite,
    this.companyLogo,
    this.contactPerson,
    this.contactPersonDesig,
    this.contactNo,
    this.slNo,
    this.contractDate,
    this.lcnVal,
    this.expiredOn,
    this.activeStatus,
    this.logonUrl,
    this.lcnExpMsgDay,
    this.ogNo,
    this.ogName,
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyImage,
    this.promotionalUpdates,
    this.promotionalUpdatesFlag,
    this.companyType,
    this.companyIds,
    this.photoImg,
    this.photoLogo,
  });

  int id;
  dynamic companyId;
  dynamic companyName;
  dynamic companyAlias;
  dynamic companySlogan;
  dynamic companyAddress;
  dynamic companyProvince;
  dynamic companyVillage;
  dynamic companyUnion;
  dynamic companyThana;
  dynamic companyDistrict;
  dynamic companyDivision;
  dynamic companyCountry;
  dynamic companyPhone;
  dynamic companyFax;
  dynamic companyEmail;
  dynamic companyWebsite;
  String companyLogo;
  dynamic contactPerson;
  dynamic contactPersonDesig;
  dynamic contactNo;
  dynamic slNo;
  dynamic contractDate;
  dynamic lcnVal;
  dynamic expiredOn;
  int activeStatus;
  dynamic logonUrl;
  dynamic lcnExpMsgDay;
  int ogNo;
  dynamic ogName;
  dynamic ssCreator;
  dynamic ssCreatedOn;
  dynamic ssCreateSession;
  dynamic ssModifier;
  dynamic ssModifiedOn;
  dynamic ssModifiedSession;
  dynamic companyImage;
  dynamic promotionalUpdates;
  dynamic promotionalUpdatesFlag;
  dynamic companyType;
  dynamic companyIds;
  dynamic photoImg;
  String photoLogo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    companyId: json["companyId"],
    companyName: json["companyName"],
    companyAlias: json["companyAlias"],
    companySlogan: json["companySlogan"],
    companyAddress: json["companyAddress"],
    companyProvince: json["companyProvince"],
    companyVillage: json["companyVillage"],
    companyUnion: json["companyUnion"],
    companyThana: json["companyThana"],
    companyDistrict: json["companyDistrict"],
    companyDivision: json["companyDivision"],
    companyCountry: json["companyCountry"],
    companyPhone: json["companyPhone"],
    companyFax: json["companyFax"],
    companyEmail: json["companyEmail"],
    companyWebsite: json["companyWebsite"],
    companyLogo: json["companyLogo"],
    contactPerson: json["contactPerson"],
    contactPersonDesig: json["contactPersonDesig"],
    contactNo: json["contactNo"],
    slNo: json["slNo"],
    contractDate: json["contractDate"],
    lcnVal: json["lcnVal"],
    expiredOn: json["expiredOn"],
    activeStatus: json["activeStatus"],
    logonUrl: json["logonUrl"],
    lcnExpMsgDay: json["lcnExpMsgDay"],
    ogNo: json["ogNo"],
    ogName: json["ogName"],
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyImage: json["companyImage"],
    promotionalUpdates: json["promotionalUpdates"],
    promotionalUpdatesFlag: json["promotionalUpdatesFlag"],
    companyType: json["companyType"],
    companyIds: json["companyIds"],
    photoImg: json["photoImg"],
    photoLogo: json["photoLogo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyId": companyId,
    "companyName": companyName,
    "companyAlias": companyAlias,
    "companySlogan": companySlogan,
    "companyAddress": companyAddress,
    "companyProvince": companyProvince,
    "companyVillage": companyVillage,
    "companyUnion": companyUnion,
    "companyThana": companyThana,
    "companyDistrict": companyDistrict,
    "companyDivision": companyDivision,
    "companyCountry": companyCountry,
    "companyPhone": companyPhone,
    "companyFax": companyFax,
    "companyEmail": companyEmail,
    "companyWebsite": companyWebsite,
    "companyLogo": companyLogo,
    "contactPerson": contactPerson,
    "contactPersonDesig": contactPersonDesig,
    "contactNo": contactNo,
    "slNo": slNo,
    "contractDate": contractDate,
    "lcnVal": lcnVal,
    "expiredOn": expiredOn,
    "activeStatus": activeStatus,
    "logonUrl": logonUrl,
    "lcnExpMsgDay": lcnExpMsgDay,
    "ogNo": ogNo,
    "ogName": ogName,
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn,
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssModifiedOn,
    "ssModifiedSession": ssModifiedSession,
    "companyImage": companyImage,
    "promotionalUpdates": promotionalUpdates,
    "promotionalUpdatesFlag": promotionalUpdatesFlag,
    "companyType": companyType,
    "companyIds": companyIds,
    "photoImg": photoImg,
    "photoLogo": photoLogo,
  };
}
