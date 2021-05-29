// To parse this JSON data, do
//
//     final channelInfoModel = channelInfoModelFromJson(jsonString);

import 'dart:convert';

ChannelInfoModel channelInfoModelFromJson(String str) =>
    ChannelInfoModel.fromJson(json.decode(str));

String channelInfoModelToJson(ChannelInfoModel data) =>
    json.encode(data.toJson());

class ChannelInfoModel {
  ChannelInfoModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.items,
    this.pageInfo,
  });

  String kind;
  String etag;
  String nextPageToken;
  List<Item> items;
  PageInfo pageInfo;

  factory ChannelInfoModel.fromJson(Map<String, dynamic> json) =>
      ChannelInfoModel(
        kind: json["kind"] == null ? null : json["kind"],
        etag: json["etag"] == null ? null : json["etag"],
        nextPageToken:
            json["nextPageToken"] == null ? null : json["nextPageToken"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "etag": etag == null ? null : etag,
        "nextPageToken": nextPageToken == null ? null : nextPageToken,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "pageInfo": pageInfo == null ? null : pageInfo.toJson(),
      };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.contentDetails,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;
  ContentDetails contentDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"] == null ? null : json["kind"],
        etag: json["etag"] == null ? null : json["etag"],
        id: json["id"] == null ? null : json["id"],
        snippet:
            json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
        contentDetails: json["contentDetails"] == null
            ? null
            : ContentDetails.fromJson(json["contentDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "etag": etag == null ? null : etag,
        "id": id == null ? null : id,
        "snippet": snippet == null ? null : snippet.toJson(),
        "contentDetails":
            contentDetails == null ? null : contentDetails.toJson(),
      };
}

class ContentDetails {
  ContentDetails({
    this.videoId,
    this.videoPublishedAt,
  });

  String videoId;
  DateTime videoPublishedAt;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        videoId: json["videoId"] == null ? null : json["videoId"],
        videoPublishedAt: json["videoPublishedAt"] == null
            ? null
            : DateTime.parse(json["videoPublishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId == null ? null : videoId,
        "videoPublishedAt": videoPublishedAt == null
            ? null
            : videoPublishedAt.toIso8601String(),
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String playlistId;
  int position;
  ResourceId resourceId;
  String videoOwnerChannelTitle;
  String videoOwnerChannelId;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"] == null ? null : json["channelId"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromJson(json["thumbnails"]),
        channelTitle:
            json["channelTitle"] == null ? null : json["channelTitle"],
        playlistId: json["playlistId"] == null ? null : json["playlistId"],
        position: json["position"] == null ? null : json["position"],
        resourceId: json["resourceId"] == null
            ? null
            : ResourceId.fromJson(json["resourceId"]),
        videoOwnerChannelTitle: json["videoOwnerChannelTitle"] == null
            ? null
            : json["videoOwnerChannelTitle"],
        videoOwnerChannelId: json["videoOwnerChannelId"] == null
            ? null
            : json["videoOwnerChannelId"],
      );

  Map<String, dynamic> toJson() => {
        "publishedAt":
            publishedAt == null ? null : publishedAt.toIso8601String(),
        "channelId": channelId == null ? null : channelId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "thumbnails": thumbnails == null ? null : thumbnails.toJson(),
        "channelTitle": channelTitle == null ? null : channelTitle,
        "playlistId": playlistId == null ? null : playlistId,
        "position": position == null ? null : position,
        "resourceId": resourceId == null ? null : resourceId.toJson(),
        "videoOwnerChannelTitle":
            videoOwnerChannelTitle == null ? null : videoOwnerChannelTitle,
        "videoOwnerChannelId":
            videoOwnerChannelId == null ? null : videoOwnerChannelId,
      };
}

class ResourceId {
  ResourceId({
    this.kind,
    this.videoId,
  });

  String kind;
  String videoId;

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"] == null ? null : json["kind"],
        videoId: json["videoId"] == null ? null : json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "videoId": videoId == null ? null : videoId,
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault:
            json["default"] == null ? null : Default.fromJson(json["default"]),
        medium:
            json["medium"] == null ? null : Default.fromJson(json["medium"]),
        high: json["high"] == null ? null : Default.fromJson(json["high"]),
        standard: json["standard"] == null
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default":
            thumbnailsDefault == null ? null : thumbnailsDefault.toJson(),
        "medium": medium == null ? null : medium.toJson(),
        "high": high == null ? null : high.toJson(),
        "standard": standard == null ? null : standard.toJson(),
        "maxres": maxres == null ? null : maxres.toJson(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"] == null ? 'https://www.techandteen.com/wp-content/uploads/2020/11/MyHealthBD-Logo-High-Res..png' : json["url"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? 'https://www.techandteen.com/wp-content/uploads/2020/11/MyHealthBD-Logo-High-Res..png' : url,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
        resultsPerPage:
            json["resultsPerPage"] == null ? null : json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults == null ? null : totalResults,
        "resultsPerPage": resultsPerPage == null ? null : resultsPerPage,
      };
}
