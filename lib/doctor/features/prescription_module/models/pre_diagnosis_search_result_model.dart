import 'dart:convert';

PreDiagnosisSearchResultModel preDiagnosisSearchResultModelFromJson(
        String str) =>
    PreDiagnosisSearchResultModel.fromJson(json.decode(str));

class PreDiagnosisSearchResultModel {
  PreDiagnosisSearchResultModel({
    List<PreDiagnosisSearchListModel> items,
  }) : this.items = items ?? [];

  List<PreDiagnosisSearchListModel> items;

  factory PreDiagnosisSearchResultModel.fromJson(Map<String, dynamic> json) =>
      PreDiagnosisSearchResultModel(
        items: List<PreDiagnosisSearchListModel>.from(
            json["items"].map((x) => PreDiagnosisSearchListModel.fromJson(x))),
      );
}

class PreDiagnosisSearchListModel {
  PreDiagnosisSearchListModel({
    this.preDiagnosisVal,
    this.preDiagnosisValType,
  });

  String preDiagnosisVal;
  int preDiagnosisValType;

  factory PreDiagnosisSearchListModel.fromJson(Map<String, dynamic> json) =>
      PreDiagnosisSearchListModel(
        preDiagnosisVal: json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"],
      );
}
