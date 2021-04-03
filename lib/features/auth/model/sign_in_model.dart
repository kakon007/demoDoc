import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.companyName,
    this.name,
    this.sessionNo,
  });

  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;
  String companyName;
  String name;
  int sessionNo;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    refreshToken: json["refresh_token"],
    expiresIn: json["expires_in"],
    scope: json["scope"],
    companyName: json["companyName"],
    name: json["name"],
    sessionNo: json["sessionNo"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "refresh_token": refreshToken,
    "expires_in": expiresIn,
    "scope": scope,
    "companyName": companyName,
    "name": name,
    "sessionNo": sessionNo,
  };
}
