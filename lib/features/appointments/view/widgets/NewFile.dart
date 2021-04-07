import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import '../appointments_screen.dart';
class NewFile extends StatefulWidget {
  @override
  _NewFileState createState() => _NewFileState();
}

class _NewFileState extends State<NewFile> {
  AvailableSlotModel spItem;
  final List<Items> specializationList = List<Items>();
  Future<AvailableSlotModel>  fetchSpecializationList() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/getAvailableSlot";
    final http.Response response = await http.post(url,body: jsonEncode(<String, String>{
      "appointDate": "2021-04-07T03:48:46.483Z",
      "companyNo": "2",
      "doctorNo": "2000011",
      "ogNo": "2"
    }),);
    //print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      spItem = availableSlotModelFromJson(response.body) ;
      // print(spItem);
      setState(() {
        spItem.items.forEach((element) {
          specializationList.add(element);
        });
      });
      // print('Data:: ' + spItem.specializationItem[2].dtlDescription);
      return spItem;
    }else {
      return null;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchSpecializationList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(specializationList[1].doctorName.toString());
    return Scaffold(
      body: ListView.builder(
          itemCount: specializationList.length,
          itemBuilder: (ctx, index) {
            return Text(specializationList[index].slotNo.toString());
          })
    );
  }
}
