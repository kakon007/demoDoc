// To parse this JSON data, do
//
//     final relationshipModel = relationshipModelFromJson(jsonString);

import 'dart:convert';

RelationshipModel relationshipModelFromJson(String str) => RelationshipModel.fromJson(json.decode(str));

String relationshipModelToJson(RelationshipModel data) => json.encode(data.toJson());

class RelationshipModel {
  RelationshipModel({
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

  factory RelationshipModel.fromJson(Map<String, dynamic> json) => RelationshipModel(
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
    this.name,
    this.id,
  });

  String name;
  int id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
