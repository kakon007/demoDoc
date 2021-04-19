import 'package:flutter/material.dart';

class HealthVideoAll extends StatefulWidget {
  @override
  _HealthVideoAllState createState() => _HealthVideoAllState();
}

class _HealthVideoAllState extends State<HealthVideoAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
