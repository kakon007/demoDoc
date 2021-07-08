// To parse this JSON data, do
//
//     final notificationListModel = notificationListModelFromJson(jsonString);

import 'dart:convert';

NotificationListModel notificationListModelFromJson(String str) => NotificationListModel.fromJson(json.decode(str));

String notificationListModelToJson(NotificationListModel data) => json.encode(data.toJson());

class NotificationListModel {
  NotificationListModel({
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

  factory NotificationListModel.fromJson(Map<String, dynamic> json) => NotificationListModel(
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
    this.notifNo,
    this.notifId,
    this.messageTitle,
    this.messageBody,
    this.notifType,
    this.sendTo,
    this.sendStatus,
    this.sendTry,
    this.sendDate,
    this.deviceToken,
    this.remarks,
    this.image,
    this.topic,
    this.userName,
  });

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  dynamic ssModifier;
  dynamic ssModifiedOn;
  dynamic ssModifiedSession;
  dynamic companyNo;
  dynamic organizationNo;
  int notifNo;
  String notifId;
  String messageTitle;
  String messageBody;
  int notifType;
  int sendTo;
  int sendStatus;
  int sendTry;
  String sendDate;
  String deviceToken;
  dynamic remarks;
  String image;
  dynamic topic;
  String userName;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    notifNo: json["notifNo"] == null ? null : json["notifNo"],
    notifId: json["notifId"] == null ? null : json["notifId"],
    messageTitle: json["messageTitle"] == null ? null : json["messageTitle"],
    messageBody: json["messageBody"] == null ? null : json["messageBody"],
    notifType: json["notifType"] == null ? null : json["notifType"],
    sendTo: json["sendTo"] == null ? null : json["sendTo"],
    sendStatus: json["sendStatus"] == null ? null : json["sendStatus"],
    sendTry: json["sendTry"] == null ? null : json["sendTry"],
    sendDate: json["sendDate"] == null ? null : json["sendDate"],
    deviceToken: json["deviceToken"] == null ? null : json["deviceToken"],
    remarks: json["remarks"],
    image: json["image"] == null ? null : json["image"],
    topic: json["topic"],
    userName: json["userName"] == null ? null : json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator == null ? null : ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
    "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssModifiedOn,
    "ssModifiedSession": ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "notifNo": notifNo == null ? null : notifNo,
    "notifId": notifId == null ? null : notifId,
    "messageTitle": messageTitle == null ? null : messageTitle,
    "messageBody": messageBody == null ? null : messageBody,
    "notifType": notifType == null ? null : notifType,
    "sendTo": sendTo == null ? null : sendTo,
    "sendStatus": sendStatus == null ? null : sendStatus,
    "sendTry": sendTry == null ? null : sendTry,
    "sendDate": sendDate == null ? null : sendDate,
    "deviceToken": deviceToken == null ? null : deviceToken,
    "remarks": remarks,
    "image": image == null ? null : image,
    "topic": topic,
    "userName": userName == null ? null : userName,
  };
}
