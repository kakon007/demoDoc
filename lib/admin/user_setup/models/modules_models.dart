// To parse this JSON data, do
//
//     final modulesRepository = modulesRepositoryFromJson(jsonString);

import 'dart:convert';

ModulesRepository modulesRepositoryFromJson(String str) => ModulesRepository.fromJson(json.decode(str));

String modulesRepositoryToJson(ModulesRepository data) => json.encode(data.toJson());

class ModulesRepository {
  ModulesRepository({
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

  factory ModulesRepository.fromJson(Map<String, dynamic> json) => ModulesRepository(
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
    this.id,
    this.prentId,
    this.displayName,
    this.featureDtosList,
  });

  int id;
  int prentId;
  String displayName;
  List<FeatureDtosList> featureDtosList;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    prentId: json["prentId"] == null ? null : json["prentId"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    featureDtosList: json["featureDtosList"] == null ? null : List<FeatureDtosList>.from(json["featureDtosList"].map((x) => FeatureDtosList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "prentId": prentId == null ? null : prentId,
    "displayName": displayName == null ? null : displayName,
    "featureDtosList": featureDtosList == null ? null : List<dynamic>.from(featureDtosList.map((x) => x.toJson())),
  };
}

class FeatureDtosList {
  FeatureDtosList({
    this.featureId,
    this.featureCode,
    this.featureName,
    this.isGranted,
    this.updatedStatus,
    this.isChecked
  });

  int featureId;
  dynamic featureCode;
  String featureName;
  bool isGranted;
  bool isChecked= false;
  bool updatedStatus;

  factory FeatureDtosList.fromJson(Map<String, dynamic> json) => FeatureDtosList(
    featureId: json["featureId"] == null ? null : json["featureId"],
    featureCode: json["featureCode"],
    isChecked: false,
    featureName: json["featureName"] == null ? null : json["featureName"],
    isGranted: json["isGranted"] == null ? null : json["isGranted"],
    updatedStatus: json["updatedStatus"] == null ? null : json["updatedStatus"],
  );

  Map<String, dynamic> toJson() => {
    "isChecked" : false,
    "featureId": featureId == null ? null : featureId,
    "featureCode": featureCode,
    "featureName": featureName == null ? null : featureName,
    "isGranted": isGranted == null ? null : isGranted,
    "updatedStatus": updatedStatus == null ? null : updatedStatus,
  };
}
