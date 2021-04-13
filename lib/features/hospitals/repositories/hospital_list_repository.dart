import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:http/http.dart' as http;



class HospitalListRepository{
  List<Item> dataList = new List<Item>();
  Future<HospitalListModel> fetchHospitalList() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyList";
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      //data = jsonMap["items"];
      HospitalListModel data = hospitalListModelFromJson(response.body) ;
        data.items.forEach((elemant) {
          dataList.add(elemant);
        });
      //print('Data:: ' + data.items[5].companyName);
      return data;
      //print(data[0]['companySlogan']);
    }else {
      return null;
    }
  }

}

