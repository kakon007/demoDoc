// To parse this JSON data, do
//
//     final zoomModel = zoomModelFromJson(jsonString);

import 'dart:convert';

ZoomModel zoomModelFromJson(String str) => ZoomModel.fromJson(json.decode(str));

String zoomModelToJson(ZoomModel data) => json.encode(data.toJson());

class ZoomModel {
  ZoomModel({
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
  Model model;
  dynamic items;
  Obj obj;

  factory ZoomModel.fromJson(Map<String, dynamic> json) => ZoomModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: Model.fromJson(json["model"]),
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
    "model": model.toJson(),
    "items": items,
    "obj": obj.toJson(),
  };
}

class Model {
  Model({
    this.meetingNumber,
    this.password,
    this.apiKey,
    this.apiSecret,
    this.userEmail,
    this.userName,
  });

  int meetingNumber;
  String password;
  String apiKey;
  String apiSecret;
  String userEmail;
  String userName;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    meetingNumber: json["meetingNumber"],
    password: json["password"],
    apiKey: json["apiKey"],
    apiSecret: json["apiSecret"],
    userEmail: json["userEmail"],
    userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "meetingNumber": meetingNumber,
    "password": password,
    "apiKey": apiKey,
    "apiSecret": apiSecret,
    "userEmail": userEmail,
    "userName": userName,
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
    this.id,
    this.doctorNo,
    this.consultationNo,
    this.consultationId,
    this.meetingNumber,
    this.meetingPassword,
    this.meetingCreatedAt,
    this.joinUrl,
    this.hostId,
    this.duration,
    this.startTime,
    this.startUrl,
    this.timezone,
    this.uuid,
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
  int doctorNo;
  int consultationNo;
  String consultationId;
  int meetingNumber;
  String meetingPassword;
  DateTime meetingCreatedAt;
  String joinUrl;
  String hostId;
  dynamic duration;
  DateTime startTime;
  String startUrl;
  dynamic timezone;
  String uuid;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    doctorNo: json["doctorNo"],
    consultationNo: json["consultationNo"],
    consultationId: json["consultationId"],
    meetingNumber: json["meetingNumber"],
    meetingPassword: json["meetingPassword"],
    meetingCreatedAt: DateTime.parse(json["meetingCreatedAt"]),
    joinUrl: json["joinUrl"],
    hostId: json["hostId"],
    duration: json["duration"],
    startTime: DateTime.parse(json["startTime"]),
    startUrl: json["startUrl"],
    timezone: json["timezone"],
    uuid: json["uuid"],
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
    "id": id,
    "doctorNo": doctorNo,
    "consultationNo": consultationNo,
    "consultationId": consultationId,
    "meetingNumber": meetingNumber,
    "meetingPassword": meetingPassword,
    "meetingCreatedAt": meetingCreatedAt.toIso8601String(),
    "joinUrl": joinUrl,
    "hostId": hostId,
    "duration": duration,
    "startTime": startTime.toIso8601String(),
    "startUrl": startUrl,
    "timezone": timezone,
    "uuid": uuid,
  };
}
