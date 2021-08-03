// To parse this JSON data, do
//
//     final userImageModel = userImageModelFromJson(jsonString);

import 'dart:convert';

UserImageModel userImageModelFromJson(String str) => UserImageModel.fromJson(json.decode(str));

String userImageModelToJson(UserImageModel data) => json.encode(data.toJson());

class UserImageModel {
  UserImageModel({
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

  factory UserImageModel.fromJson(Map<String, dynamic> json) => UserImageModel(
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
    this.companyList,
    this.userTypeNo,
    this.userMobile,
    this.name,
    this.defaultCompanyId,
    this.defaultCompanyName,
    this.photo,
    this.organizationNo,
    this.userEmail,
    this.userDefaultPageLink,
    this.userId,
    this.doctorNo,
  });

  List<CompanyList> companyList;
  int userTypeNo;
  dynamic userMobile;
  String name;
  int defaultCompanyId;
  String defaultCompanyName;
  String photo;
  int organizationNo;
  dynamic userEmail;
  String userDefaultPageLink;
  int userId;
  dynamic doctorNo;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    companyList: List<CompanyList>.from(json["companyList"].map((x) => CompanyList.fromJson(x))),
    userTypeNo: json["userTypeNo"],
    userMobile: json["userMobile"],
    name: json["name"],
    defaultCompanyId: json["defaultCompanyId"],
    defaultCompanyName: json["defaultCompanyName"],
    photo: json["photo"],
    organizationNo: json["organizationNo"],
    userEmail: json["userEmail"],
    userDefaultPageLink: json["userDefaultPageLink"],
    userId: json["userId"],
    doctorNo: json["doctorNo"],
  );

  Map<String, dynamic> toJson() => {
    "companyList": List<dynamic>.from(companyList.map((x) => x.toJson())),
    "userTypeNo": userTypeNo,
    "userMobile": userMobile,
    "name": name,
    "defaultCompanyId": defaultCompanyId,
    "defaultCompanyName": defaultCompanyName,
    "photo": photo,
    "organizationNo": organizationNo,
    "userEmail": userEmail,
    "userDefaultPageLink": userDefaultPageLink,
    "userId": userId,
    "doctorNo": doctorNo,
  };
}

class CompanyList {
  CompanyList({
    this.companyId,
    this.compnayName,
    this.companyPhone,
    this.alias,
    this.compnayAddress1,
    this.compnayEmail,
    this.orgId,
  });

  int companyId;
  String compnayName;
  String companyPhone;
  String alias;
  String compnayAddress1;
  String compnayEmail;
  int orgId;

  factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
    companyId: json["companyId"],
    compnayName: json["compnayName"],
    companyPhone: json["companyPhone"],
    alias: json["alias"],
    compnayAddress1: json["compnayAddress1"],
    compnayEmail: json["compnayEmail"],
    orgId: json["orgId"],
  );

  Map<String, dynamic> toJson() => {
    "companyId": companyId,
    "compnayName": compnayName,
    "companyPhone": companyPhone,
    "alias": alias,
    "compnayAddress1": compnayAddress1,
    "compnayEmail": compnayEmail,
    "orgId": orgId,
  };
}
