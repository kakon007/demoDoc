import 'dart:convert';

FavouriteListModel favouriteListModelFromJson(String str) =>
    FavouriteListModel.fromJson(json.decode(str));

String favouriteListModelToJson(FavouriteListModel data) =>
    json.encode(data.toJson());

class FavouriteListModel {
  FavouriteListModel({
    List<FavouriteItemModel> items,
  }) : this.items = items ?? [];

  List<FavouriteItemModel> items;

  factory FavouriteListModel.fromJson(Map<String, dynamic> json) =>
      FavouriteListModel(
        items: List<FavouriteItemModel>.from(
            json["items"].map((x) => FavouriteItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class FavouriteItemModel {
  FavouriteItemModel({
    this.companyNo,
    this.organizationNo,
    this.id,
    this.favouriteVal,
    this.favouriteType,
    this.doctorNo,
    this.activeStatus,
    this.isCheck = false,
    this.brandName,
    this.genericName,
  });

  int companyNo;
  int organizationNo;
  int id;
  String favouriteVal;
  String brandName;
  String genericName;
  int favouriteType;
  int doctorNo;
  int activeStatus;
  bool isCheck;

  factory FavouriteItemModel.fromJson(Map<String, dynamic> json) =>
      FavouriteItemModel(
        companyNo: json["companyNo"],
        organizationNo: json["organizationNo"],
        id: json["id"],
        favouriteVal: json["favouriteVal"],
        favouriteType: json["favouriteType"],
        doctorNo: json["doctorNo"],
        activeStatus: json["activeStatus"],
        brandName: json["brandName"],
        genericName: json["genericName"],
      );

  Map<String, dynamic> toJson() => {
        "companyNo": companyNo,
        "organizationNo": organizationNo,
        "id": id,
        "favouriteVal": favouriteVal,
        "favouriteType": favouriteType,
        "doctorNo": doctorNo,
        "activeStatus": activeStatus,
        "brandName": brandName,
        "genericName": genericName,
      };
}
