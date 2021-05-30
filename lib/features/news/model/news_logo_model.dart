// To parse this JSON data, do
//
//     final newsLogoModel = newsLogoModelFromJson(jsonString);

import 'dart:convert';

NewsLogoModel newsLogoModelFromJson(String str) => NewsLogoModel.fromJson(json.decode(str));

String newsLogoModelToJson(NewsLogoModel data) => json.encode(data.toJson());

class NewsLogoModel {
  NewsLogoModel({
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

  factory NewsLogoModel.fromJson(Map<String, dynamic> json) => NewsLogoModel(
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
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.blogNo,
    this.blogId,
    this.blogType,
    this.newsCategory,
    this.title,
    this.newsLink,
    this.publishDate,
    this.slNo,
    this.preface,
    this.image,
    this.blogDetail,
    this.publisher,
    this.activeStatus,
    this.logo,
    this.blogImage,
  });

  dynamic ssCreator;
  dynamic ssCreatedOn;
  dynamic ssCreateSession;
  dynamic ssModifier;
  dynamic ssModifiedOn;
  dynamic ssModifiedSession;
  dynamic companyNo;
  dynamic organizationNo;
  int blogNo;
  dynamic blogId;
  dynamic blogType;
  int newsCategory;
  dynamic title;
  dynamic newsLink;
  dynamic publishDate;
  dynamic slNo;
  dynamic preface;
  String image;
  dynamic blogDetail;
  dynamic publisher;
  int activeStatus;
  String logo;
  dynamic blogImage;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    blogNo: json["blogNo"],
    blogId: json["blogId"],
    blogType: json["blogType"],
    newsCategory: json["newsCategory"],
    title: json["title"],
    newsLink: json["newsLink"],
    publishDate: json["publishDate"],
    slNo: json["slNo"],
    preface: json["preface"],
    image: json["image"],
    blogDetail: json["blogDetail"],
    publisher: json["publisher"],
    activeStatus: json["activeStatus"],
    logo: json["logo"],
    blogImage: json["blogImage"],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator,
    "ssCreatedOn": ssCreatedOn,
    "ssCreateSession": ssCreateSession,
    "ssModifier": ssModifier,
    "ssModifiedOn": ssModifiedOn,
    "ssModifiedSession": ssModifiedSession,
    "companyNo": companyNo,
    "organizationNo": organizationNo,
    "blogNo": blogNo,
    "blogId": blogId,
    "blogType": blogType,
    "newsCategory": newsCategory,
    "title": title,
    "newsLink": newsLink,
    "publishDate": publishDate,
    "slNo": slNo,
    "preface": preface,
    "image": image,
    "blogDetail": blogDetail,
    "publisher": publisher,
    "activeStatus": activeStatus,
    "logo": logo,
    "blogImage": blogImage,
  };
}
