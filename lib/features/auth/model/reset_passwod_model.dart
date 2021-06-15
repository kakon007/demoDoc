// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  ResetPasswordModel({
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
  dynamic items;
  Obj obj;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"],
    obj: Obj?.fromJson(json["obj"]),
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
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.emailNo,
    this.emailId,
    this.emailType,
    this.emailSubject,
    this.emailBody,
    this.emailAddress,
    this.sendTo,
    this.sendStatus,
    this.sendTry,
    this.sendDate,
    this.hasAttatch,
    this.remarks,
  });

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  dynamic ssModifier;
  dynamic ssModifiedOn;
  dynamic ssModifiedSession;
  int companyNo;
  int organizationNo;
  int emailNo;
  String emailId;
  int emailType;
  String emailSubject;
  String emailBody;
  String emailAddress;
  int sendTo;
  int sendStatus;
  int sendTry;
  dynamic sendDate;
  int hasAttatch;
  dynamic remarks;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    emailNo: json["emailNo"],
    emailId: json["emailId"],
    emailType: json["emailType"],
    emailSubject: json["emailSubject"],
    emailBody: json["emailBody"],
    emailAddress: json["emailAddress"],
    sendTo: json["sendTo"],
    sendStatus: json["sendStatus"],
    sendTry: json["sendTry"],
    sendDate: json["sendDate"],
    hasAttatch: json["hasAttatch"],
    remarks: json["remarks"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn,
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssModifiedOn,
    "ssModifiedSession": ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "emailNo": emailNo,
    "emailId": emailId,
    "emailType": emailType,
    "emailSubject": emailSubject,
    "emailBody": emailBody,
    "emailAddress": emailAddress,
    "sendTo": sendTo,
    "sendStatus": sendStatus,
    "sendTry": sendTry,
    "sendDate": sendDate,
    "hasAttatch": hasAttatch,
    "remarks": remarks,
  };
}
