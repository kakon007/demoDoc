// To parse this JSON data, do
//
//     final getFamilyMember = getFamilyMemberFromJson(jsonString);

import 'dart:convert';

GetFamilyMember getFamilyMemberFromJson(String str) => GetFamilyMember.fromJson(json.decode(str));

String getFamilyMemberToJson(GetFamilyMember data) => json.encode(data.toJson());

class GetFamilyMember {
  GetFamilyMember({
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
  Obj obj;

  factory GetFamilyMember.fromJson(Map<String, dynamic> json) => GetFamilyMember(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj.toJson(),
  };
}

class Item {
  Item({
    this.id,
    this.regId,
    this.regNo,
    this.relation,
    this.relationName,
    this.fmRegNo,
    this.fmRegId,
    this.fmName,
    this.fmDob,
    this.fmAddress,
    this.fmImage,
    this.activeStat,
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreatedSession,
    this.companyNo,
    this.ogNo,
    this.photo,
    this.fmAge,
  });

  int id;
  String regId;
  int regNo;
  int relation;
  String relationName;
  int fmRegNo;
  String fmRegId;
  String fmName;
  String fmDob;
  String fmAddress;
  String fmImage;
  int activeStat;
  int ssCreator;
  String ssCreatedOn;
  int ssCreatedSession;
  int companyNo;
  int ogNo;
  String photo;
  String fmAge;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    regId: json["regId"],
    regNo: json["regNo"],
    relation: json["relation"],
    relationName: json['relationName'],
    fmRegNo: json["fmRegNo"],
    fmRegId: json["fmRegId"],
    fmName: json["fmName"],
    fmDob: json["fmDob"],
    fmAddress: json["fmAddress"],
    fmImage: json["fmImage"] == null ? null : json["fmImage"],
    activeStat: json["activeStat"],
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreatedSession: json["ssCreatedSession"] == null ? null : json["ssCreatedSession"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    ogNo: json["ogNo"] == null ? null : json["ogNo"],
    photo: json["photo"] == null ? null : json["photo"],
    fmAge: json["fmAge"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "regId": regId,
    "regNo": regNo,
    "relation": relation,
    "relationName": relationName,
    "fmRegNo": fmRegNo,
    "fmRegId": fmRegId,
    "fmName": fmName,
    "fmDob": fmDob,
    "fmAddress": fmAddressValues.reverse[fmAddress],
    "fmImage": fmImage == null ? null : fmImage,
    "activeStat": activeStat,
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreatedSession": ssCreatedSession == null ? null : ssCreatedSession,
    "companyNo": companyNo == null ? null : companyNo,
    "ogNo": ogNo == null ? null : ogNo,
    "photo": photo == null ? null : photo,
    "fmAge": fmAge,
  };
}

enum FmAddress { DHAKA, MAGHBAZAR, DHAKA_DHAKA }

final fmAddressValues = EnumValues({
  "Dhaka": FmAddress.DHAKA,
  "Dhaka, dhaka": FmAddress.DHAKA_DHAKA,
  "Maghbazar": FmAddress.MAGHBAZAR
});

enum RelationName { FATHER, MOTHER, SON, BROTHER }

final relationNameValues = EnumValues({
  "Brother": RelationName.BROTHER,
  "Father": RelationName.FATHER,
  "Mother": RelationName.MOTHER,
  "Son": RelationName.SON
});

class Obj {
  Obj({
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  String draw;
  String recordsFiltered;
  String recordsTotal;
  List<Item> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"],
    recordsFiltered: json["recordsFiltered"],
    recordsTotal: json["recordsTotal"],
    data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsFiltered": recordsFiltered,
    "recordsTotal": recordsTotal,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

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
