// To parse this JSON data, do
//
//     final nrearestHospitalModel = nrearestHospitalModelFromJson(jsonString);

import 'dart:convert';

NrearestHospitalModel nrearestHospitalModelFromJson(String str) => NrearestHospitalModel.fromJson(json.decode(str));

String nrearestHospitalModelToJson(NrearestHospitalModel data) => json.encode(data.toJson());

class NrearestHospitalModel {
  NrearestHospitalModel({
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
  List<Items> items;
  dynamic obj;

  factory NrearestHospitalModel.fromJson(Map<String, dynamic> json) => NrearestHospitalModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
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

class Items {
  Items({
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
    this.placeLatitude,
    this.placeLongitude,
    this.companyIds,
    this.photoImg,
    this.photoLogo,
    this.placeDistance,
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
  String companyDistrict;
  Company companyDivision;
  CompanyCountry companyCountry;
  String companyPhone;
  String companyFax;
  String companyEmail;
  String companyWebsite;
  String companyLogo;
  String contactPerson;
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
  double placeLatitude;
  double placeLongitude;
  dynamic companyIds;
  dynamic photoImg;
  dynamic photoLogo;
  double placeDistance;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    id: json["id"] == null ? null : json["id"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    companyName: json["companyName"].toString(),
    companyAlias: json["companyAlias"] == null ? null : json["companyAlias"],
    companySlogan: json["companySlogan"] == null ? null : json["companySlogan"],
    companyAddress: json["companyAddress"] == null ? null : json["companyAddress"],
    companyProvince: json["companyProvince"] == null ? null : companyValues.map[json["companyProvince"]],
    companyVillage: json["companyVillage"],
    companyUnion: json["companyUnion"],
    companyThana: json["companyThana"] == null ? null : json["companyThana"],
    companyDistrict: json["companyDistrict"] == null ? null : json["companyDistrict"],
    companyDivision: json["companyDivision"] == null ? null : companyValues.map[json["companyDivision"]],
    companyCountry: json["companyCountry"] == null ? null : companyCountryValues.map[json["companyCountry"]],
    companyPhone: json["companyPhone"] == null ? null : json["companyPhone"],
    companyFax: json["companyFax"] == null ? null : json["companyFax"],
    companyEmail: json["companyEmail"] == null ? null : json["companyEmail"],
    companyWebsite: json["companyWebsite"] == null ? null : json["companyWebsite"],
    companyLogo: json["companyLogo"] == null ? null : json["companyLogo"],
    contactPerson: json["contactPerson"] == null ? null : json["contactPerson"],
    contactPersonDesig: json["contactPersonDesig"] == null ? null : json["contactPersonDesig"],
    contactNo: json["contactNo"] == null ? null : json["contactNo"],
    slNo: json["slNo"] == null ? null : json["slNo"],
    contractDate: json["contractDate"],
    lcnVal: json["lcnVal"],
    expiredOn: json["expiredOn"] == null ? null : json["expiredOn"],
    activeStatus: json["activeStatus"] == null ? null : json["activeStatus"],
    logonUrl: json["logonUrl"],
    lcnExpMsgDay: json["lcnExpMsgDay"] == null ? null : json["lcnExpMsgDay"],
    ogNo: json["ogNo"] == null ? null : json["ogNo"],
    ogName: json["ogName"],
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyImage: json["companyImage"] == null ? null : json["companyImage"],
    promotionalUpdates: json["promotionalUpdates"] == null ? null : json["promotionalUpdates"],
    promotionalUpdatesFlag: json["promotionalUpdatesFlag"] == null ? null : json["promotionalUpdatesFlag"],
    companyType: json["companyType"] == null ? null : json["companyType"],
    placeLatitude: json["placeLatitude"] == null ? null : json["placeLatitude"].toDouble(),
    placeLongitude: json["placeLongitude"] == null ? null : json["placeLongitude"].toDouble(),
    companyIds: json["companyIds"],
    photoImg: json["photoImg"],
    photoLogo: json["photoLogo"],
    placeDistance: json["placeDistance"] == null ? null : json["placeDistance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "companyId": companyId == null ? null : companyId,
    "companyName": companyName == null ? null : companyName,
    "companyAlias": companyAlias == null ? null : companyAlias,
    "companySlogan": companySlogan == null ? null : companySlogan,
    "companyAddress": companyAddress == null ? null : companyAddress,
    "companyProvince": companyProvince == null ? null : companyValues.reverse[companyProvince],
    "companyVillage": companyVillage,
    "companyUnion": companyUnion,
    "companyThana": companyThana == null ? null : companyThana,
    "companyDistrict": companyDistrict == null ? null : companyDistrict,
    "companyDivision": companyDivision == null ? null : companyValues.reverse[companyDivision],
    "companyCountry": companyCountry == null ? null : companyCountryValues.reverse[companyCountry],
    "companyPhone": companyPhone == null ? null : companyPhone,
    "companyFax": companyFax == null ? null : companyFax,
    "companyEmail": companyEmail == null ? null : companyEmail,
    "companyWebsite": companyWebsite == null ? null : companyWebsite,
    "companyLogo": companyLogo == null ? null : companyLogo,
    "contactPerson": contactPerson == null ? null : contactPerson,
    "contactPersonDesig": contactPersonDesig == null ? null : contactPersonDesig,
    "contactNo": contactNo == null ? null : contactNo,
    "slNo": slNo == null ? null : slNo,
    "contractDate": contractDate,
    "lcnVal": lcnVal,
    "expiredOn": expiredOn == null ? null : expiredOn,
    "activeStatus": activeStatus == null ? null : activeStatus,
    "logonUrl": logonUrl,
    "lcnExpMsgDay": lcnExpMsgDay == null ? null : lcnExpMsgDay,
    "ogNo": ogNo == null ? null : ogNo,
    "ogName": ogName,
    "ssCreator": ssCreator == null ? null : ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "companyImage": companyImage == null ? null : companyImage,
    "promotionalUpdates": promotionalUpdates == null ? null : promotionalUpdates,
    "promotionalUpdatesFlag": promotionalUpdatesFlag == null ? null : promotionalUpdatesFlag,
    "companyType": companyType == null ? null : companyType,
    "placeLatitude": placeLatitude == null ? null : placeLatitude,
    "placeLongitude": placeLongitude == null ? null : placeLongitude,
    "companyIds": companyIds,
    "photoImg": photoImg,
    "photoLogo": photoLogo,
    "placeDistance": placeDistance == null ? null : placeDistance,
  };
}

enum CompanyCountry { BANGLADESH, COMPANY_COUNTRY_BANGLADESH }

final companyCountryValues = EnumValues({
  "BANGLADESH": CompanyCountry.BANGLADESH,
  "Bangladesh": CompanyCountry.COMPANY_COUNTRY_BANGLADESH
});

enum Company { DHAKA, CHATTOGGRAM, MYMENSING }

final companyValues = EnumValues({
  "Chattoggram": Company.CHATTOGGRAM,
  "Dhaka": Company.DHAKA,
  "Mymensing": Company.MYMENSING
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
