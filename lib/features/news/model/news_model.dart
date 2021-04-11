// To parse this JSON data, do
//
//     final newsUpdatedModel = newsUpdatedModelFromJson(jsonString);

import 'dart:convert';

NewsUpdatedModel newsUpdatedModelFromJson(String str) => NewsUpdatedModel.fromJson(json.decode(str));

String newsUpdatedModelToJson(NewsUpdatedModel data) => json.encode(data.toJson());

class NewsUpdatedModel {
  NewsUpdatedModel({
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

  factory NewsUpdatedModel.fromJson(Map<String, dynamic> json) => NewsUpdatedModel(
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
    this.newsLogo,
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

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  dynamic ssModifier;
  dynamic ssModifiedOn;
  dynamic ssModifiedSession;
  dynamic companyNo;
  dynamic organizationNo;
  int blogNo;
  String blogId;
  int blogType;
  int newsCategory;
  String newsLogo;
  String title;
  String newsLink;
  String publishDate;
  dynamic slNo;
  String preface;
  dynamic image;
  dynamic blogDetail;
  String publisher;
  int activeStatus;
  dynamic logo;
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
    newsLogo: json["newsLogo"],
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
    "newsLogo": newsLogo,
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
