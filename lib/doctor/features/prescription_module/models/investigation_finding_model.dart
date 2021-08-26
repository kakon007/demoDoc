// To parse this JSON data, do
//
//     final investigationFindingModel = investigationFindingModelFromJson(jsonString);

import 'dart:convert';

InvestigationFindingModel investigationFindingModelFromJson(String str) => InvestigationFindingModel.fromJson(json.decode(str));

String investigationFindingModelToJson(InvestigationFindingModel data) => json.encode(data.toJson());

class InvestigationFindingModel {
  InvestigationFindingModel({
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

  factory InvestigationFindingModel.fromJson(Map<String, dynamic> json) => InvestigationFindingModel(
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
    this.itemNo,
    this.itemId,
    this.itemCustomName,
    this.itemName,
    this.itemTypeNo,
    this.departmentNo,
    this.departmentName,
  });

  int itemNo;
  String itemId;
  dynamic itemCustomName;
  String itemName;
  int itemTypeNo;
  int departmentNo;
  String departmentName;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemNo: json["itemNo"],
    itemId: json["itemId"],
    itemCustomName: json["itemCustomName"],
    itemName: json["itemName"],
    itemTypeNo: json["itemTypeNo"],
    departmentNo: json["departmentNo"],
    departmentName: json["departmentName"],
  );

  Map<String, dynamic> toJson() => {
    "itemNo": itemNo,
    "itemId": itemId,
    "itemCustomName": itemCustomName,
    "itemName": itemName,
    "itemTypeNo": itemTypeNo,
    "departmentNo": departmentNo,
    "departmentName": departmentName,
  };
}
