import 'dart:convert';

DigitalSignatureModel digitalSignatureModelFromJson(String str) => DigitalSignatureModel.fromJson(json.decode(str));
class DigitalSignatureModel {
  DigitalSignatureModel({
    this.signature,
  });
  String signature;
  factory DigitalSignatureModel.fromJson(Map<String, dynamic> json) => DigitalSignatureModel(
    signature: json["obj"],
  );
}
