import 'package:flutter/material.dart';
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
        title: Text('Appointments'),
      ),
      body: Center(child: FlatButton(
        onPressed: (){
          showInSnackBar("Some text");
          print("Shakil");
        },
        child: Text("Appointments"),))
    );
  }

  void showInSnackBar(String s) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(s)
    ));
  }
}
