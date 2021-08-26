import 'dart:convert';

ReferredOpdModel referredOpdModelFromJson(String str) =>
    ReferredOpdModel.fromJson(json.decode(str));

String referredOpdModelToJson(ReferredOpdModel data) =>
    json.encode(data.toJson());

class ReferredOpdModel {
  ReferredOpdModel({
    this.items,
  });

  List<ReferredOPDItem> items;

  factory ReferredOpdModel.fromJson(Map<String, dynamic> json) =>
      ReferredOpdModel(
        items: List<ReferredOPDItem>.from(
            json["items"].map((x) => ReferredOPDItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ReferredOPDItem {
  ReferredOPDItem({
    this.ssCreator,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.buId,
    this.buName,
    this.activeStatus,
    this.flag,
  });

  int ssCreator;
  int companyNo;
  int organizationNo;
  int id;
  String buId;
  String buName;
  int activeStatus;
  int flag;

  factory ReferredOPDItem.fromJson(Map<String, dynamic> json) =>
      ReferredOPDItem(
        ssCreator: json["ssCreator"],
        companyNo: json["companyNo"],
        organizationNo: json["organizationNo"],
        id: json["id"],
        buId: json["buId"],
        buName: json["buName"],
        activeStatus: json["activeStatus"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator,
        "companyNo": companyNo,
        "organizationNo": organizationNo,
        "id": id,
        "buId": buId,
        "buName": buName,
        "activeStatus": activeStatus,
        "flag": flag,
      };
}
