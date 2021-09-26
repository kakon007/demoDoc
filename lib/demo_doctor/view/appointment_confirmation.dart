import 'package:flutter/material.dart';

class AppointmentConfirmation extends StatefulWidget {

  @override
  _AppointmentConfirmationState createState() => _AppointmentConfirmationState();
}

class _AppointmentConfirmationState extends State<AppointmentConfirmation> {
  TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    var textField=Theme(
      data: new ThemeData(
        primaryColor: Colors.redAccent,
        primaryColorDark: Colors.red,
      ),
      child: new TextField(
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            hintText: 'Enter Your Name',
            //helperText: 'Keep it short, this is just a demo.',
            labelText: 'Name',
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.green,
            ),
            prefixText: ' ',
            suffixText: 'Name',
            suffixStyle: const TextStyle(color: Colors.green)),
      ),
    );

    //emailController.text
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Appointment", style: TextStyle(color: Colors.white)),
        backgroundColor:Color(0xff7266D8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            textField,
            SizedBox(height: 15,),
            textField,
            SizedBox(height: 15,),
            textField,
            SizedBox(height: 15,),
            textField,
            SizedBox(height: 15,),
            textField,
            SizedBox(height: 15,),
            textField,
            SizedBox(height: 15,),
            textField,
            SizedBox(height: 15,),
            textField,
            SizedBox(height: 15,),
            Container(
              // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff7266D8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Center(
                  child: Text(
                    'Confirm Appointment',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
