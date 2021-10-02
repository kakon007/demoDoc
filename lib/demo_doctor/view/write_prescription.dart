import 'package:flutter/material.dart';

class WritePrescription extends StatefulWidget {
  @override
  _WritePrescriptionState createState() => _WritePrescriptionState();
}

class _WritePrescriptionState extends State<WritePrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescription", style: TextStyle(color: Colors.black)),
        backgroundColor:Colors.white,
      ),
    );
  }
}
