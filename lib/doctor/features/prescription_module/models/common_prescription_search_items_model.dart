// To parse this JSON data, do
//
//     final commonPrescriptionSearchItemsModel = commonPrescriptionSearchItemsModelFromJson(jsonString);

import 'dart:convert';

CommonPrescriptionSearchItemsModel commonPrescriptionSearchItemsModelFromJson(
        String str) =>
    CommonPrescriptionSearchItemsModel.fromJson(json.decode(str));

String commonPrescriptionSearchItemsModelToJson(
        CommonPrescriptionSearchItemsModel data) =>
    json.encode(data.toJson());

class CommonPrescriptionSearchItemsModel {
  CommonPrescriptionSearchItemsModel({
    this.items,
  });

  List<CommonPrescriptionSearchItems> items;

  factory CommonPrescriptionSearchItemsModel.fromJson(
          Map<String, dynamic> json) =>
      CommonPrescriptionSearchItemsModel(
        items: List<CommonPrescriptionSearchItems>.from(json["items"]
            .map((x) => CommonPrescriptionSearchItems.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class CommonPrescriptionSearchItems {
  CommonPrescriptionSearchItems({
    this.departmentName,
    this.itemId,
    this.itemName,
    this.genericName,
    this.manufacturerName,
    this.departmentNo,
    this.itemTypeNo,
    this.itemNo,
    this.parItemTypeNo,
    this.routeName,
  });

  String departmentName;
  String itemId;
  String itemName;
  dynamic genericName;
  dynamic manufacturerName;
  int departmentNo;
  int itemTypeNo;
  int itemNo;
  int parItemTypeNo;
  dynamic routeName;

  factory CommonPrescriptionSearchItems.fromJson(Map<String, dynamic> json) =>
      CommonPrescriptionSearchItems(
        departmentName: json["departmentName"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        genericName: json["genericName"],
        manufacturerName: json["manufacturerName"],
        departmentNo: json["departmentNo"],
        itemTypeNo: json["itemTypeNo"],
        itemNo: json["itemNo"],
        parItemTypeNo: json["parItemTypeNo"],
        routeName: json["routeName"],
      );

  Map<String, dynamic> toJson() => {
        "departmentName": departmentName,
        "itemId": itemId,
        "itemName": itemName,
        "genericName": genericName,
        "manufacturerName": manufacturerName,
        "departmentNo": departmentNo,
        "itemTypeNo": itemTypeNo,
        "itemNo": itemNo,
        "parItemTypeNo": parItemTypeNo,
        "routeName": routeName,
      };
}
