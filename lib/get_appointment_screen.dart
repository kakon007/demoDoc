import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';

class GetAppointment extends StatefulWidget {
  @override
  _GetAppointmentState createState() => _GetAppointmentState();
}

class _GetAppointmentState extends State<GetAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text('Appointments'),
      ),
      body: Center(child: Container(child: Text("No Appointments Yet"),))
    );
  }
}
