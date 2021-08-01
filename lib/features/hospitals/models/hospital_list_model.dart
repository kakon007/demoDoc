// To parse this JSON data, do
//
//     final hospitalListModel = hospitalListModelFromJson(jsonString);

import 'dart:convert';

HospitalListModel hospitalListModelFromJson(String str) => HospitalListModel.fromJson(json.decode(str));

String hospitalListModelToJson(HospitalListModel data) => json.encode(data.toJson());

class HospitalListModel {
  HospitalListModel({
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

  factory HospitalListModel.fromJson(Map<String, dynamic> json) => HospitalListModel(
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
  String companyId;
  String companyName;
  String companyAlias;
  String companySlogan;
  String companyAddress;
  Company companyProvince;
  dynamic companyVillage;
  dynamic companyUnion;
  String companyThana;
  Company companyDistrict;
  Company companyDivision;
  CompanyCountry companyCountry;
  String companyPhone;
  String companyFax;
  String companyEmail;
  String companyWebsite;
  String companyLogo;
  ContactPerson contactPerson;
  String contactPersonDesig;
  String contactNo;
  int slNo;
  dynamic contractDate;
  dynamic lcnVal;
  String expiredOn;
  int activeStatus;
  dynamic logonUrl;
  int lcnExpMsgDay;
  int ogNo;
  dynamic ogName;
  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  String companyImage;
  String promotionalUpdates;
  String promotionalUpdatesFlag;
  int companyType;
  dynamic companyIds;
  dynamic photoImg;
  dynamic photoLogo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    companyId: json["companyId"],
    companyName: json["companyName"].toString(),
    companyAlias: json["companyAlias"],
    companySlogan: json["companySlogan"] == null ? null : json["companySlogan"],
    companyAddress: json["companyAddress"] == null ? null : json["companyAddress"],
    companyProvince: json["companyProvince"] == null ? null : companyValues.map[json["companyProvince"]],
    companyVillage: json["companyVillage"],
    companyUnion: json["companyUnion"],
    companyThana: json["companyThana"] == null ? null : json["companyThana"],
    companyDistrict: json["companyDistrict"] == null ? null : companyValues.map[json["companyDistrict"]],
    companyDivision: json["companyDivision"] == null ? null : companyValues.map[json["companyDivision"]],
    companyCountry: json["companyCountry"] == null ? null : companyCountryValues.map[json["companyCountry"]],
    companyPhone: json["companyPhone"] == null ? null : json["companyPhone"],
    companyFax: json["companyFax"] == null ? null : json["companyFax"],
    companyEmail: json["companyEmail"] == null ? null : json["companyEmail"],
    companyWebsite: json["companyWebsite"] == null ? null : json["companyWebsite"],
    companyLogo: json["companyLogo"],
    contactPerson: json["contactPerson"] == null ? null : contactPersonValues.map[json["contactPerson"]],
    contactPersonDesig: json["contactPersonDesig"] == null ? null : json["contactPersonDesig"],
    contactNo: json["contactNo"] == null ? null : json["contactNo"],
    slNo: json["slNo"] == null ? null : json["slNo"],
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
    companyImage: json["companyImage"] == null ? null : json["companyImage"],
    promotionalUpdates: json["promotionalUpdates"] == null ? null : json["promotionalUpdates"],
    promotionalUpdatesFlag: json["promotionalUpdatesFlag"] == null ? null : json["promotionalUpdatesFlag"],
    companyType: json["companyType"] == null ? null : json["companyType"],
    companyIds: json["companyIds"],
    photoImg: json["photoImg"],
    photoLogo: json["photoLogo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyId": companyId,
    "companyName": companyName,
    "companyAlias": companyAlias,
    "companySlogan": companySlogan == null ? null : companySlogan,
    "companyAddress": companyAddress == null ? null : companyAddress,
    "companyProvince": companyProvince == null ? null : companyValues.reverse[companyProvince],
    "companyVillage": companyVillage,
    "companyUnion": companyUnion,
    "companyThana": companyThana == null ? null : companyThana,
    "companyDistrict": companyDistrict == null ? null : companyValues.reverse[companyDistrict],
    "companyDivision": companyDivision == null ? null : companyValues.reverse[companyDivision],
    "companyCountry": companyCountry == null ? null : companyCountryValues.reverse[companyCountry],
    "companyPhone": companyPhone == null ? null : companyPhone,
    "companyFax": companyFax == null ? null : companyFax,
    "companyEmail": companyEmail == null ? null : companyEmail,
    "companyWebsite": companyWebsite == null ? null : companyWebsite,
    "companyLogo": companyLogo,
    "contactPerson": contactPerson == null ? null : contactPersonValues.reverse[contactPerson],
    "contactPersonDesig": contactPersonDesig == null ? null : contactPersonDesig,
    "contactNo": contactNo == null ? null : contactNo,
    "slNo": slNo == null ? null : slNo,
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
    "companyImage": companyImage == null ? null : companyImage,
    "promotionalUpdates": promotionalUpdates == null ? null : promotionalUpdates,
    "promotionalUpdatesFlag": promotionalUpdatesFlag == null ? null : promotionalUpdatesFlag,
    "companyType": companyType == null ? null : companyType,
    "companyIds": companyIds,
    "photoImg": photoImg,
    "photoLogo": photoLogo,
  };
}

enum CompanyCountry { BANGLADESH, COMPANY_COUNTRY_BANGLADESH }

final companyCountryValues = EnumValues({
  "BANGLADESH": CompanyCountry.BANGLADESH,
  "Bangladesh": CompanyCountry.COMPANY_COUNTRY_BANGLADESH
});

enum Company { DHAKA, COMPANY_DHAKA }

final companyValues = EnumValues({
  "Dhaka": Company.COMPANY_DHAKA,
  "DHAKA": Company.DHAKA
});

enum ContactPerson { MD_MANJURUL_HOQUE, MD_LOKMAN_HUSSAIN, ZIA }

final contactPersonValues = EnumValues({
  "Md. Lokman Hussain": ContactPerson.MD_LOKMAN_HUSSAIN,
  "Md. Manjurul Hoque": ContactPerson.MD_MANJURUL_HOQUE,
  "Zia": ContactPerson.ZIA
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
