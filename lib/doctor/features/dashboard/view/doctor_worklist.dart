import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Worklist extends StatefulWidget {
  @override
  _WorklistState createState() => _WorklistState();
}

class _WorklistState extends State<Worklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("WorkList"),),);
  }
}
