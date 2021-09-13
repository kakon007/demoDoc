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
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<TestItem> items;
  Obj obj;

  factory TestItemModel.fromJson(Map<String, dynamic> json) => TestItemModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<TestItem>.from(json["items"].map((x) => TestItem.fromJson(x))),
    obj: json["obj"] == null ? null : Obj.fromJson(json["obj"]),
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
    "obj": obj == null ? null : obj.toJson(),
  };
}

class TestItem {
  TestItem({
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
    this.buList,
    this.isAdded,
    this.isChecked
  });

  int itemNo;
  String itemId;
  String itemName;
  int itemTypeNo;
  ItemTypeName itemTypeName;
  int buNo;
  String buName;
  double salesPrice;
  dynamic purchasePrice;
  double maxDisPct;
  double discountAmt;
  double discountPrice;
  dynamic promoCode;
  dynamic companyName;
  dynamic buList;
  bool isAdded;
  bool isChecked=false;

  factory TestItem.fromJson(Map<String, dynamic> json) => TestItem(
    itemNo: json["itemNo"] == null ? null : json["itemNo"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    itemName: json["itemName"] == null ? null : json["itemName"],
    itemTypeNo: json["itemTypeNo"] == null ? null : json["itemTypeNo"],
    itemTypeName: json["itemTypeName"] == null ? null : itemTypeNameValues.map[json["itemTypeName"]],
    buNo: json["buNo"] == null ? null : json["buNo"],
    buName: json["buName"] == null ? null : json["buName"],
    salesPrice: json["salesPrice"] == null ? null : json["salesPrice"].toDouble(),
    purchasePrice: json["purchasePrice"],
    maxDisPct: json["maxDisPct"] == null ? null : json["maxDisPct"].toDouble(),
    discountAmt: json["discountAmt"] == null ? null : json["discountAmt"].toDouble(),
    discountPrice: json["discountPrice"] == null ? null : json["discountPrice"].toDouble(),
    promoCode: json["promoCode"],
    companyName: json["companyName"],
    buList: json["buList"],
    isAdded: false,
    isChecked: false
  );

  Map<String, dynamic> toJson() => {
    "itemNo": itemNo == null ? null : itemNo,
    "itemId": itemId == null ? null : itemId,
    "itemName": itemName == null ? null : itemName,
    "itemTypeNo": itemTypeNo == null ? null : itemTypeNo,
    "itemTypeName": itemTypeName == null ? null : itemTypeNameValues.reverse[itemTypeName],
    "buNo": buNo == null ? null : buNo,
    "buName": buName == null ? null : buName,
    "salesPrice": salesPrice == null ? null : salesPrice,
    "purchasePrice": purchasePrice,
    "maxDisPct": maxDisPct == null ? null : maxDisPct,
    "discountAmt": discountAmt == null ? null : discountAmt,
    "discountPrice": discountPrice == null ? null : discountPrice,
    "promoCode": promoCode,
    "companyName": companyName,
    "buList": buList,
  };
}

enum ItemTypeName { PATHOLOGY }

final itemTypeNameValues = EnumValues({
  "PATHOLOGY": ItemTypeName.PATHOLOGY
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
  int recordsTotal;
  List<TestItem> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"] == null ? null : json["draw"],
    recordsFiltered: json["recordsFiltered"] == null ? null : json["recordsFiltered"],
    recordsTotal: json["recordsTotal"]==null?0:int.parse(json["recordsTotal"]?.toString()??"0"),
    data: json["data"] == null ? null : List<TestItem>.from(json["data"].map((x) => TestItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw == null ? null : draw,
    "recordsFiltered": recordsFiltered == null ? null : recordsFiltered,
    "recordsTotal": recordsTotal == null ? null : recordsTotal,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
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
