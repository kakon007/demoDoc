// To parse this JSON data, do
//
//     final testItemModel = testItemModelFromJson(jsonString);

import 'dart:convert';

TestItemModel testItemModelFromJson(String str) => TestItemModel.fromJson(json.decode(str));

String testItemModelToJson(TestItemModel data) => json.encode(data.toJson());

class TestItemModel {
  TestItemModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.items,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<Item> items;

  factory TestItemModel.fromJson(Map<String, dynamic> json) => TestItemModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
  };
}

class Item {
  Item({
    this.itemNo,
    this.itemId,
    this.itemName,
    this.itemTypeNo,
    this.itemTypeName,
    this.buNo,
    this.buName,
    this.salesPrice,
    this.purchasePrice,
    this.maxDisPct,
    this.discountAmt,
    this.discountPrice,
    this.promoCode,
    this.companyName,
  });

  int itemNo;
  String itemId;
  String itemName;
  int itemTypeNo;
  String itemTypeName;
  int buNo;
  String buName;
  double salesPrice;
  dynamic purchasePrice;
  double maxDisPct;
  double discountAmt;
  double discountPrice;
  dynamic promoCode;
  dynamic companyName;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemNo: json["itemNo"] == null ? null : json["itemNo"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    itemName: json["itemName"] == null ? null : json["itemName"],
    itemTypeNo: json["itemTypeNo"] == null ? null : json["itemTypeNo"],
    itemTypeName: json["itemTypeName"] == null ? null : json["itemTypeName"],
    buNo: json["buNo"] == null ? null : json["buNo"],
    buName: json["buName"] == null ? null : json["buName"],
    salesPrice: json["salesPrice"] == null ? null : json["salesPrice"].toDouble(),
    purchasePrice: json["purchasePrice"],
    maxDisPct: json["maxDisPct"] == null ? null : json["maxDisPct"].toDouble(),
    discountAmt: json["discountAmt"] == null ? null : json["discountAmt"].toDouble(),
    discountPrice: json["discountPrice"] == null ? null : json["discountPrice"].toDouble(),
    promoCode: json["promoCode"],
    companyName: json["companyName"],
  );

  Map<String, dynamic> toJson() => {
    "itemNo": itemNo == null ? null : itemNo,
    "itemId": itemId == null ? null : itemId,
    "itemName": itemName == null ? null : itemName,
    "itemTypeNo": itemTypeNo == null ? null : itemTypeNo,
    "itemTypeName": itemTypeName == null ? null : itemTypeName,
    "buNo": buNo == null ? null : buNo,
    "buName": buName == null ? null : buName,
    "salesPrice": salesPrice == null ? null : salesPrice,
    "purchasePrice": purchasePrice,
    "maxDisPct": maxDisPct == null ? null : maxDisPct,
    "discountAmt": discountAmt == null ? null : discountAmt,
    "discountPrice": discountPrice == null ? null : discountPrice,
    "promoCode": promoCode,
    "companyName": companyName,
  };
}
