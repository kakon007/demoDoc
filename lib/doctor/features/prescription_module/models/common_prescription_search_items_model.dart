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
    this.departmentNo,
    this.itemTypeNo,
    this.itemNo,
    this.parItemTypeNo,
  });

  String departmentName;
  String itemId;
  String itemName;
  int departmentNo;
  int itemTypeNo;
  int itemNo;
  int parItemTypeNo;

  factory CommonPrescriptionSearchItems.fromJson(Map<String, dynamic> json) =>
      CommonPrescriptionSearchItems(
        departmentName: json["departmentName"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        departmentNo: json["departmentNo"],
        itemTypeNo: json["itemTypeNo"],
        itemNo: json["itemNo"],
        parItemTypeNo: json["parItemTypeNo"],
      );

  Map<String, dynamic> toJson() => {
        "departmentName": departmentName,
        "itemId": itemId,
        "itemName": itemName,
        "departmentNo": departmentNo,
        "itemTypeNo": itemTypeNo,
        "itemNo": itemNo,
        "parItemTypeNo": parItemTypeNo,
      };
}
