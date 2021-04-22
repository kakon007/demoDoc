// To parse this JSON data, do
//
//     final blogMofdel = blogMofdelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
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

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
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

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int blogNo;
  String blogId;
  int blogType;
  int newsCategory;
  String title;
  dynamic newsLink;
  String publishDate;
  int slNo;
  String preface;
  String image;
  String blogDetail;
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
